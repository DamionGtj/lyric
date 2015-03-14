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

@property (nonatomic, copy) NSDictionary *resultDic;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, assign) NSInteger code;
@property (nonatomic, assign) NSInteger like;

@end


@interface LYDetailModel : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy) NSString *img_url;
@property (nonatomic, copy) NSString *singer;
@property (nonatomic, copy) NSString *song_name;
@property (nonatomic, copy) NSString *lyric;
@property (nonatomic, copy) NSString *lyric_key;
@property (nonatomic, copy) NSString *provider;

@end
