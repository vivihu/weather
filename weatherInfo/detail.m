//
//  detail.m
//  weatherInfo
//
//  Created by icreative-mini on 13-3-8.
//  Copyright (c) 2013年 icreative-mini. All rights reserved.
//

#import "detail.h"

@implementation detail

@synthesize temp1,wind1,index_uv,index_d,weather1;

@synthesize temp2,wind2,weather2;
@synthesize temp3,wind3,weather3;
@synthesize temp4,wind4,weather4;
@synthesize temp5,wind5,weather5;
@synthesize temp6,wind6,weather6;

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.temp1];
    [aCoder encodeObject:self.wind1];
    [aCoder encodeObject:self.index_uv];
    [aCoder encodeObject:self.index_d];
    [aCoder encodeObject:self.weather1];
    [aCoder encodeObject:self.temp2];
    [aCoder encodeObject:self.wind2];
    [aCoder encodeObject:self.weather2];
    [aCoder encodeObject:self.temp3];
    [aCoder encodeObject:self.wind3];
    [aCoder encodeObject:self.weather3];
    [aCoder encodeObject:self.temp4];
    [aCoder encodeObject:self.wind4];
    [aCoder encodeObject:self.weather4];
    [aCoder encodeObject:self.temp5];
    [aCoder encodeObject:self.wind5];
    [aCoder encodeObject:self.weather5];
    [aCoder encodeObject:self.temp6];
    [aCoder encodeObject:self.wind6];
    [aCoder encodeObject:self.weather6];
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    temp1 = [[aDecoder decodeObject]copy];
    wind1 = [[aDecoder decodeObject]copy];
    index_uv = [[aDecoder decodeObject]copy];
    index_d = [[aDecoder decodeObject]copy];
    weather1 = [[aDecoder decodeObject]copy];
    temp2 = [[aDecoder decodeObject]copy];
    wind2 = [[aDecoder decodeObject]copy];
    weather2 = [[aDecoder decodeObject]copy];
    temp3 = [[aDecoder decodeObject]copy];
    wind3 = [[aDecoder decodeObject]copy];
    weather3 = [[aDecoder decodeObject]copy];
    temp4 = [[aDecoder decodeObject]copy];
    wind4 = [[aDecoder decodeObject]copy];
    weather4 = [[aDecoder decodeObject]copy];
    temp5 = [[aDecoder decodeObject]copy];
    wind5 = [[aDecoder decodeObject]copy];
    weather5 = [[aDecoder decodeObject]copy];
    temp6 = [[aDecoder decodeObject]copy];
    wind6 = [[aDecoder decodeObject]copy];
    weather6 = [[aDecoder decodeObject]copy];
    return self;
}

@end
