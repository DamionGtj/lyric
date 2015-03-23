//
//  LYKit.h
//  lyric
//
//  Created by 郭天际 on 15/3/23.
//  Copyright (c) 2015年 guotianji. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LYLoginModel.h"

@interface LYKit : NSObject

@property (nonatomic, strong) LYLoginModel *current_user;

+ (instancetype )sharedInstance;

@end
