//
//  ViewController.m
//  weatherInfo
//
//  Created by icreative-mini on 13-3-8.
//  Copyright (c) 2013年 icreative-mini. All rights reserved.
//

#import "ViewController.h"
#import <RestKit/RestKit.h>
#import "detail.h"
#import "EGOCache.h"

@interface ViewController ()
{
    NSDateFormatter *dateFormatter;
}
@end

@implementation ViewController

@synthesize img1;
@synthesize img2;
@synthesize weather;

@synthesize temp1;
@synthesize fl1;
@synthesize UV;
@synthesize indexD;
@synthesize date;
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

- (void)loadTimeLine
{
    RKObjectManager *objectManager = [RKObjectManager sharedManager];
    [objectManager getObjectsAtPath:@"/data/101210301.html"
                         parameters:nil
                            success:^(RKObjectRequestOperation *operation,RKMappingResult *mappingResult){
                                weatherInfo = [mappingResult dictionary];
                                
                                NSLog(@"00000000%@000000000",data);
                                [[EGOCache globalCache]setObject:weatherInfo forKey:@"cacheData"];
                                data = [weatherInfo objectForKey:@"weatherinfo"];

                                temp1.text = [data temp1];
                                fl1.text = [data wind1];
                                UV.text = [data index_uv];
                                indexD.text = [data index_d];
                                weather.text = data.weather1;
                                
                                dateFormatter = [[NSDateFormatter alloc] init];
                                [dateFormatter setDateFormat:@"yyyy-MM-dd"];
                                date.text = [dateFormatter stringFromDate:[NSDate date]];

                                [self weatherImg];
                            }
                            failure:^(RKObjectRequestOperation *operation,NSError *error){
                                

                                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"出错了"
                                                                               message:[error localizedDescription]
                                                                              delegate:self
                                                                     cancelButtonTitle:@"OK"
                                                                     otherButtonTitles:nil];
                                [alert show];
                                weatherInfo = (NSDictionary *)[[EGOCache globalCache] objectForKey:@"cacheData"];
                                NSLog(@"000000%@00000",weatherInfo);
                                data = [weatherInfo objectForKey:@"weatherinfo"];
                                temp1.text = [data temp1];
                                fl1.text = [data wind1];
                                UV.text = [data index_uv];
                                indexD.text = [data index_d];
                                weather.text = data.weather1;
                                
                                dateFormatter = [[NSDateFormatter alloc] init];
                                [dateFormatter setDateFormat:@"yyyy-MM-dd"];
                                date.text = [dateFormatter stringFromDate:[NSDate date]];
                                [self weatherImg];

                            }
     ];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    if (!iPhone5) {
        NSLog(@"你好");
    }

    UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    scroll.delegate = self;
    scroll.pagingEnabled = YES;
    scroll.directionalLockEnabled = YES;
    scroll.showsHorizontalScrollIndicator = YES;
    scroll.showsVerticalScrollIndicator = NO;
    scroll.backgroundColor = [UIColor clearColor];
    [scroll setContentSize:CGSizeMake(self.view.frame.size.width * 6, self.view.frame.size.height)];
    [self.view addSubview:scroll];
    
    //    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0.0, 401, self.view.frame.size.width, 80)];
    //    pageControl.hidesForSinglePage = YES;
    //    pageControl.userInteractionEnabled = NO;
    //    pageControl.backgroundColor = [UIColor redColor];
    //    [self.view addSubview:pageControl];
    
    
//    NSURL *url = [NSURL URLWithString:@"http://m.weather.com.cn/data/101210301.html"];
//    NSDictionary *weatherinfo = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfURL:url]
//                                                   options:kNilOptions
//                                                     error:nil];
//    NSDictionary *data = [weatherinfo objectForKey:@"weatherinfo"];
//    
//    temp1.text = [NSString stringWithFormat:@"%@",[data objectForKey:@"temp1"]];
//    fl1.text = [NSString stringWithFormat:@"%@",[data objectForKey:@"fl1"]];
//    UV.text = [NSString stringWithFormat:@"%@",[data objectForKey:@"index_uv"]];
//    indexD.text = [NSString stringWithFormat:@"%@",[data objectForKey:@"index_d"]];
//    weather.text = [NSString stringWithFormat:@"%@",[data objectForKey:@"weather1"]];
//    [self weatherImg];
    
    
    [self loadTimeLine];//对象映射
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
    if (rain.location != NSNotFound && [weather.text hasSuffix:@"云"]) {
        [img1 setImage:[UIImage imageNamed:@"rain.gif"]];
        [img2 setImage:[UIImage imageNamed:@"cloudy.gif"]];
    }//雨转云
    if (cloudy.location != NSNotFound && [weather.text hasSuffix:@"阴"]) {
        [img1 setImage:[UIImage imageNamed:@"cloudy.gif"]];
        [img2 setImage:[UIImage imageNamed:@"overcast.gif"]];
    }//云转阴

//等等。。。= =！
    
    if (overcast.location ==NSNotFound && cloudy.location == NSNotFound && rain.location == NSNotFound && sunny.location != NSNotFound) {
        [img1 setImage:[UIImage imageNamed:@"sunny.gif"]];
        [img2 setImage:nil];
    }//晴天
    if (overcast.location ==NSNotFound && cloudy.location == NSNotFound && rain.location != NSNotFound && sunny.location == NSNotFound) {
        [img1 setImage:[UIImage imageNamed:@"rain.gif"]];
        [img2 setImage:nil];
    }//雨天
    if (overcast.location ==NSNotFound && cloudy.location != NSNotFound && rain.location == NSNotFound && sunny.location == NSNotFound) {
        [img1 setImage:[UIImage imageNamed:@"cloudy.gif"]];
        [img2 setImage:nil];
    }//多云
    if (overcast.location !=NSNotFound && cloudy.location == NSNotFound && rain.location == NSNotFound && sunny.location == NSNotFound) {
        [img1 setImage:[UIImage imageNamed:@"overcast.gif"]];
        [img2 setImage:nil];
    }//阴天
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int index = fabs(scrollView.contentOffset.x)/scrollView.frame.size.width;
    if (index == 0) {
        temp1.text = [data temp1];
        fl1.text = [data wind1];
        UV.text = [data index_uv];
        indexD.text = [data index_d];
        weather.text = data.weather1;
        
        date.text = [dateFormatter stringFromDate:[NSDate date]];
    }
    if (index == 1) {
        temp1.text = [data temp2];
        fl1.text = [data wind2];
        UV.text = nil;
        indexD.text = nil;
        weather.text = data.weather2;
        
        date.text = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSinceNow:+(24 * 60 * 60 )]];
    }

    if (index == 2) {
        temp1.text = [data temp3];
        fl1.text = [data wind3];
        UV.text = nil;
        indexD.text = nil;
        weather.text = data.weather3;
        
        date.text = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSinceNow:+(24 * 60 * 60 * 2)]];
    }

    if (index == 3) {
        temp1.text = [data temp4];
        fl1.text = [data wind4];
        UV.text = nil;
        indexD.text = nil;
        weather.text = data.weather4;
        
        date.text = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSinceNow:+(24 * 60 * 60 * 3)]];
    }
    if (index == 4) {
        temp1.text = [data temp5];
        fl1.text = [data wind5];
        UV.text = nil;
        indexD.text = nil;
        weather.text = data.weather5;
        
        date.text = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSinceNow:+(24 * 60 * 60 * 4)]];
    }
    if (index == 5) {
        temp1.text = [data temp6];
        fl1.text = [data wind6];
        UV.text = nil;
        indexD.text = nil;
        weather.text = data.weather6;
        
        date.text = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSinceNow:+(24 * 60 * 60 * 5)]];
    }
    [self weatherImg];
}

@end
