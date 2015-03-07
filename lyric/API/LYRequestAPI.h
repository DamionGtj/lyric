//
//  LYCommonAPI.h
//  lyric
//
//  Created by guotianji on 15/3/7.
//  Copyright (c) 2015年 guotianji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GTJCompletionBlocks.h"
#import "GTJRequest.h"

/*
 Lyric的api类，包括所有的请求接口API
 */
@interface LYRequestAPI : NSObject

/**
 *  用户注册
 *
 *  @param user_Key      注册邮箱或者手机号
 *  @param user_Name     设置昵称
 *  @param user_Password 设置密码
 *  @param user_Image    设置头像
 *  @param className     mantle类名
 *  @param block         block回调
 */
+(void)lyricRegister:(NSString*)user_Key user_Name:(NSString*)user_Name user_Password:(NSString*)user_Password user_Image:(UIImage*)user_Image className:(NSString*)className completionBlock:(GTJObjectCompletionBlock)block;

/**
 *  用户登录
 *
 *  @param user_Key      注册邮箱或者手机号
 *  @param user_Password 登录密码
 *  @param className     mantle类名
 *  @param block         block回调
 */
+(void)lyricLogin:(NSString*)user_Key user_Password:(NSString*)user_Password className:(NSString*)className completionBlock:(GTJObjectCompletionBlock)block;

/**
 *  每日一句
 *
 *  @param className mantle类名
 *  @param block     block回调
 */
+(void)lyricGetOneWordWithClassName:(NSString*)className completionBlock:(GTJObjectCompletionBlock)block;

/**
 *  获取词圈列表
 *
 *  @param user_key   用户邮箱或者手机号
 *  @param client_key 登录key
 *  @param className  mantle类名
 *  @param block      block回调
 */
+(void)lyricGetLyricLists:(NSString*)user_key client_key:(NSString*)client_key className:(NSString*)className completionBlock:(GTJObjectCompletionBlock)block;

/**
 *  关注用户
 *
 *  @param user_key          登录用户邮箱或者手机号
 *  @param client_key        登录key
 *  @param followed_User_Key 关注用户邮箱或者手机号
 *  @param className         mantle类名
 *  @param block             block回调
 */
+(void)lyricAttentionUser:(NSString*)user_key client_key:(NSString*)client_key followed_User_Key:(NSString*)followed_User_Key className:(NSString*)className completionBlock:(GTJObjectCompletionBlock)block;

/**
 *  获取关注列表
 *
 *  @param user_key   登录用户邮箱或者手机号
 *  @param client_key 登录key
 *  @param className  mantle类名
 *  @param block      block回调
 */
+(void)lyricGetAttentionList:(NSString*)user_key client_key:(NSString*)client_key className:(NSString*)className completionBlock:(GTJObjectCompletionBlock)block;

/**
 *  取消关注
 *
 *  @param user_key          登录用户邮箱或者手机号
 *  @param client_key        登录key
 *  @param unfollow_User_Key 取消关注用户邮箱或者手机号
 *  @param className         mantle类名
 *  @param block             block回调
 */
+(void)lyricCancelAttention:(NSString*)user_key client_key:(NSString*)client_key unfollow_User_Key:(NSString*)unfollow_user_key className:(NSString*)className completionBlock:(GTJObjectCompletionBlock)block;

/**
 *  评论
 *
 *  @param user_key          登录用户邮箱或者手机号
 *  @param client_key        登录key
 *  @param followed_User_Key 取消关注用户邮箱或者手机号
 *  @param user_comment_id   歌词id
 *  @param comment           歌词评论
 *  @param className         mantle类名
 *  @param block             block回调
 */
+(void)lyricCommentLytic:(NSString*)user_key client_key:(NSString*)client_key followed_User_Key:(NSString*)followed_User_Key user_Comment_Id:(NSString*)user_comment_id comment:(NSString*)comment className:(NSString*)className completionBlock:(GTJObjectCompletionBlock)block;

/**
 *  发布歌词
 *
 *  @param user_key   登录用户邮箱或者手机号
 *  @param client_key 登录key
 *  @param lyric      歌词
 *  @param singer     歌手
 *  @param songs      歌曲
 *  @param image      图像
 *  @param className  mantle类名
 *  @param block      block回调
 */
+(void)lyricPulish:(NSString*)user_key client_key:(NSString*)client_key lyric:(NSString*)lyric singer:(NSString*)singer songs:(NSString*)songs image:(UIImage*)image className:(NSString*)className completionBlock:(GTJObjectCompletionBlock)block;
@end
