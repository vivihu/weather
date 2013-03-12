//
//  ViewController.h
//  weatherInfo
//
//  Created by icreative-mini on 13-3-8.
//  Copyright (c) 2013年 icreative-mini. All rights reserved.
//

#import <UIKit/UIKit.h>
@class detail;

@interface ViewController : UIViewController<UIScrollViewDelegate>
{
    NSDictionary *weatherInfo;
    detail *data;
}
@property (strong, nonatomic) IBOutlet UIImageView *img1;
@property (strong, nonatomic) IBOutlet UIImageView *img2;
@property (strong, nonatomic) IBOutlet UILabel *weather;

@property (strong, nonatomic) IBOutlet UILabel *temp1;
@property (strong, nonatomic) IBOutlet UILabel *fl1;
@property (strong, nonatomic) IBOutlet UILabel *UV;
@property (strong, nonatomic) IBOutlet UILabel *indexD;
@property (strong, nonatomic) IBOutlet UILabel *date;
@end
