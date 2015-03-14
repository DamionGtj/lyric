//
//  LYLoginModel.m
//  lyric
//
//  Created by guotianji on 15/3/14.
//  Copyright (c) 2015年 guotianji. All rights reserved.
//

#import "LYLoginModel.h"

@implementation LYLoginModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"client_key" : @"client_key",
             @"message" : @"message",
             @"code" : @"code",
             };
}

@end
