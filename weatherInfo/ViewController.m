//
//  ViewController.m
//  weatherInfo
//
//  Created by icreative-mini on 13-3-8.
//  Copyright (c) 2013年 icreative-mini. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize img1;
@synthesize img2;
@synthesize weather;

@synthesize temp1;
@synthesize fl1;
@synthesize UV;
@synthesize index_d;
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    if (!iPhone5) {
        NSLog(@"iphone5?");
    }

    NSURL *url = [NSURL URLWithString:@"http://m.weather.com.cn/data/101210301.html"];
    NSDictionary *weatherinfo = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfURL:url]
                                                   options:kNilOptions
                                                     error:nil];
    NSDictionary *data = [weatherinfo objectForKey:@"weatherinfo"];
    
    temp1.text = [NSString stringWithFormat:@"%@",[data objectForKey:@"temp1"]];
    fl1.text = [NSString stringWithFormat:@"%@",[data objectForKey:@"fl1"]];
    UV.text = [NSString stringWithFormat:@"%@",[data objectForKey:@"index_uv"]];
    index_d.text = [NSString stringWithFormat:@"%@",[data objectForKey:@"index_d"]];
    
    weather.text = [NSString stringWithFormat:@"%@",[data objectForKey:@"weather1"]];
    [self weatherImg];
}
- (void)weatherImg
{
    NSRange sunny = [weather.text rangeOfString:@"晴"];
    NSRange cloudy = [weather.text rangeOfString:@"云"];
    NSRange rain = [weather.text rangeOfString:@"雨"];
    NSRange overcast= [weather.text rangeOfString:@"阴"];
    if (sunny.location != NSNotFound && [weather.text hasSuffix:@"云"]) {
        [img1 setImage:[UIImage imageNamed:@"sunny.gif"]];
        [img2 setImage:[UIImage imageNamed:@"cloudy.gif"]];
    }//晴转云
    if (rain.location != NSNotFound && [weather.text hasSuffix:@"阴"]) {
        [img1 setImage:[UIImage imageNamed:@"rain.gif"]];
        [img2 setImage:[UIImage imageNamed:@"overcast.gif"]];
    }//雨转阴
    
    if (sunny.location != NSNotFound && [weather.text hasSuffix:@"雨"]) {
        [img1 setImage:[UIImage imageNamed:@"sunny.gif"]];
        [img2 setImage:[UIImage imageNamed:@"rain.gif"]];
    }//晴转雨
    if (cloudy.location != NSNotFound && [weather.text hasSuffix:@"雨"]) {
        [img1 setImage:[UIImage imageNamed:@"cloudy.gif"]];
        [img2 setImage:[UIImage imageNamed:@"rain.gif"]];
    }//云转雨
    
//等等。。。= =！
    
    if (overcast.location ==NSNotFound && cloudy.location == NSNotFound && rain.location == NSNotFound && sunny.location != NSNotFound) {
        [img1 setImage:[UIImage imageNamed:@"sunny.gif"]];
    }//晴天
    if (overcast.location ==NSNotFound && cloudy.location == NSNotFound && rain.location != NSNotFound && sunny.location == NSNotFound) {
        [img1 setImage:[UIImage imageNamed:@"rain.gif"]];
    }//雨天
    if (overcast.location ==NSNotFound && cloudy.location != NSNotFound && rain.location == NSNotFound && sunny.location == NSNotFound) {
        [img1 setImage:[UIImage imageNamed:@"cloudy.gif"]];
    }//多云
    if (overcast.location !=NSNotFound && cloudy.location == NSNotFound && rain.location == NSNotFound && sunny.location == NSNotFound) {
        [img1 setImage:[UIImage imageNamed:@"overcast.gif"]];
    }//阴天
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
