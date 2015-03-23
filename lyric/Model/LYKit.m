//
//  LYKit.m
//  lyric
//
//  Created by 郭天际 on 15/3/23.
//  Copyright (c) 2015年 guotianji. All rights reserved.
//

#import "LYKit.h"

@implementation LYKit

+ (instancetype )sharedInstance
{
    __strong static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (void)setCurrent_user:(LYLoginModel *)current_user {
    _current_user = current_user;
}

- (LYLoginModel*)getCurrent_user {
    return _current_user;
}

@end
