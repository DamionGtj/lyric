//
//  LYFollowListModel.h
//  lyric
//
//  Created by guotianji on 15/3/21.
//  Copyright (c) 2015年 guotianji. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle/Mantle.h>

@interface LYFollowListModel : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, copy) NSArray *data;

@end


@interface LYFollowListItemModel : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *img_address;
@property (nonatomic, assign) NSInteger like;
@property (nonatomic, copy) NSString *lyric_key;
@property (nonatomic, copy) NSString *provider;
@property (nonatomic, copy) NSString *singer;
@property (nonatomic, copy) NSString *songs;
@property (nonatomic, copy) NSString *user_key;
@property (nonatomic, assign) long long time;

@end
