//
//  LYRegisterModel.m
//  lyric
//
//  Created by guotianji on 15/3/14.
//  Copyright (c) 2015年 guotianji. All rights reserved.
//

#import "LYRegisterModel.h"

@implementation LYRegisterModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"uid" : @"uid",
             @"message" : @"message",
             @"code" : @"code",
             };
}

@end
