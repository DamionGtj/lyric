//
//  LYFollowListModel.m
//  lyric
//
//  Created by guotianji on 15/3/21.
//  Copyright (c) 2015年 guotianji. All rights reserved.
//

#import "LYFollowListModel.h"

@implementation LYFollowListModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"data" : @"data",
             @"message" : @"message",
             @"code" : @"code",
             };
}

+ (NSValueTransformer *)dataJSONTransformer {
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[LYFollowListItemModel class]];
}

@end

@implementation LYFollowListItemModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"content" : @"content",
             @"img_address" : @"img_address",
             @"like" : @"like",
             @"lyric_key" : @"lyric_key",
             @"provider" : @"provider",
             @"singer" : @"singer",
             @"songs" : @"songs",
             @"time" : @"time",
             @"user_key" : @"user_key"
             };
}

@end
