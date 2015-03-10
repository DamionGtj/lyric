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
             @"illustrationURL" : @"illustrationURL",
             @"singer" : @"singer",
             @"song" : @"song",
             @"lyric": @"lyric",
             @"likeFlag" : @"likeFlag",
             };
}


- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %p, song: %@, singer: %@, lyric: %@>", NSStringFromClass([self class]), self, self.song, self.singer, self.lyric];
}

@end
