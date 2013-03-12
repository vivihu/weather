//
//  detail.h
//  weatherInfo
//
//  Created by icreative-mini on 13-3-8.
//  Copyright (c) 2013年 icreative-mini. All rights reserved.
//

#import "RKNSJSONSerialization.h"

@interface detail : RKNSJSONSerialization<NSCoding>


@property (nonatomic,strong) NSString *temp1;
@property (nonatomic,strong) NSString *wind1;
@property (nonatomic,strong) NSString *index_uv;
@property (nonatomic,strong) NSString *index_d;
@property (nonatomic,strong) NSString *weather1;

@property (nonatomic,strong) NSString *temp2;
@property (nonatomic,strong) NSString *wind2;
//@property (nonatomic,strong) NSString *index_uv;
//@property (nonatomic,strong) NSString *index_d;
@property (nonatomic,strong) NSString *weather2;

@property (nonatomic,strong) NSString *temp3;
@property (nonatomic,strong) NSString *wind3;
//@property (nonatomic,strong) NSString *index_uv;
//@property (nonatomic,strong) NSString *index_d;
@property (nonatomic,strong) NSString *weather3;

@property (nonatomic,strong) NSString *temp4;
@property (nonatomic,strong) NSString *wind4;
//@property (nonatomic,strong) NSString *index_uv;
//@property (nonatomic,strong) NSString *index_d;
@property (nonatomic,strong) NSString *weather4;

@property (nonatomic,strong) NSString *temp5;
@property (nonatomic,strong) NSString *wind5;
//@property (nonatomic,strong) NSString *index_uv;
//@property (nonatomic,strong) NSString *index_d;
@property (nonatomic,strong) NSString *weather5;

@property (nonatomic,strong) NSString *temp6;
@property (nonatomic,strong) NSString *wind6;
//@property (nonatomic,strong) NSString *index_uv;
//@property (nonatomic,strong) NSString *index_d;
@property (nonatomic,strong) NSString *weather6;
- (void)encodeWithCoder:(NSCoder *)aCoder;
- (id)initWithCoder:(NSCoder *)aDecoder;


@end
