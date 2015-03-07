//
//  LYConfiguration.h
//  lyric
//
//  Created by guotianji on 15/3/7.
//  Copyright (c) 2015年 guotianji. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYConfiguration : NSObject

//单例类
+ (instancetype )sharedInstance;

//设置cookies
- (void)setCookies:(NSArray *)cookies;

@end
