//
//  LYEveryDayModel.h
//  lyric
//
//  Created by guotianji on 15/3/10.
//  Copyright (c) 2015年 guotianji. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle/Mantle.h>

/**
 *  每日一句数据Model
 */

@interface LYEveryDayModel : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSString *illustrationURL;
@property (nonatomic, copy, readonly) NSString *singer;
@property (nonatomic, copy, readonly) NSString *song;
@property (nonatomic, copy, readonly) NSString *lyric;
@property (nonatomic, assign, readonly) NSInteger likeFlag;

@end
