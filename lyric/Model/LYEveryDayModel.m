//
//  LYEveryDayModel.m
//  lyric
//
//  Created by guotianji on 15/3/10.
//  Copyright (c) 2015年 guotianji. All rights reserved.
//

#import "LYEveryDayModel.h"

@implementation LYEveryDayModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"resultDic" : @"data",
             @"message" : @"message",
             @"code" : @"code",
             @"like" : @"like",
             };
}


- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %p, data: %@, mgs: %@, code: %ld>", NSStringFromClass([self class]), self, self.resultDic, self.message, (long)self.code];
}

+ (NSValueTransformer *)resultDicJSONTransformer
{
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[LYDetailModel class]];
    //    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[LYEveryDayModel class]];
}

@end


@implementation LYDetailModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"img_url" : @"img_url",
             @"singer" : @"singer",
             @"song_name" : @"song_name",
             @"lyric": @"lyric",
             @"lyric_key": @"lyric_key",
             @"provider" : @"provider",
             };
}

@end
