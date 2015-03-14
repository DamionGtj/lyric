//
//  LYCommonAPI.m
//  lyric
//
//  Created by guotianji on 15/3/7.
//  Copyright (c) 2015年 guotianji. All rights reserved.
//

#import "LYRequestAPI.h"
#import "GTJNetworkAgent.h"
#import "LYRequest.h"
#import "NSDictionary+NSURL.h"
#import "NSString+Helpers.h"

@implementation LYRequestAPI

+(void)lyricRegister:(NSString*)user_Key user_Name:(NSString*)user_Name user_Password:(NSString*)user_Password user_Image:(UIImage*)user_Image className:(NSString*)className completionBlock:(GTJObjectCompletionBlock)block {
    NSParameterAssert(user_Key);
    NSParameterAssert(user_Name);
    NSParameterAssert(user_Password);
    
    NSDictionary *parameterDictionary = @{@"user_key":user_Key,
                                          @"user_name":user_Name,
                                          @"password":user_Password,
                                          };
    //创建请求对象
    LYRequest *registerRequest = [LYRequest requestWithUrl:@"lyric/api/register.php?" parameters:parameterDictionary method:GTJRequestMethodPost className:className];
    if (user_Image) {
        [registerRequest setConstructingBodyBlock:^(id<AFMultipartFormData> formData)
         {
             NSData *data = UIImageJPEGRepresentation(user_Image,0.6);
             [formData appendPartWithFileData:data name:@"user_img" fileName:@"imageA.jpg" mimeType:@"multipart/form-data"];
         }];
    }
    
    [registerRequest setCompletionBlock:block];
    //发送请求
    [[GTJNetworkAgent sharedInstance]sendRequest:registerRequest];
}

+(void)lyricLogin:(NSString*)user_Key user_Password:(NSString*)user_Password className:(NSString*)className completionBlock:(GTJObjectCompletionBlock)block {
    NSParameterAssert(user_Key);
    NSParameterAssert(user_Password);
    
    NSDictionary *parameterDictionary = @{@"user_key":user_Key,
                                          @"password":user_Password,
                                          };
    LYRequest *loginRequest = [LYRequest requestWithUrl:@"lyric/api/login.php?" parameters:parameterDictionary method:GTJRequestMethodGet className:className];
    [loginRequest setCompletionBlock:block];
    //发送请求
    [[GTJNetworkAgent sharedInstance]sendRequest:loginRequest];
}

+(void)lyricGetOneWordWithClassName:(NSString*)className completionBlock:(GTJObjectCompletionBlock)block {
    LYRequest *loginRequest = [LYRequest requestWithUrl:@"lyric/api/get_hot_list.php" parameters:nil method:GTJRequestMethodGet className:className];
    [loginRequest setCompletionBlock:block];
    //发送请求
    [[GTJNetworkAgent sharedInstance]sendRequest:loginRequest];
}

+(void)lyricGetLyricLists:(NSString*)user_key client_key:(NSString*)client_key className:(NSString*)className completionBlock:(GTJObjectCompletionBlock)block {
    NSParameterAssert(user_key);
    NSParameterAssert(client_key);
    
    NSDictionary *parameterDictionary = @{@"user_key":user_key,
                                          @"client_key":client_key};
    LYRequest *lyricListRequest = [LYRequest requestWithUrl:@"lyric/api/get_follow_list.php?" parameters:parameterDictionary method:GTJRequestMethodGet className:className];
    [lyricListRequest setCompletionBlock:block];
    [[GTJNetworkAgent sharedInstance]sendRequest:lyricListRequest];
}

+(void)lyricAttentionUser:(NSString*)user_key client_key:(NSString*)client_key followed_User_Key:(NSString*)followed_User_Key className:(NSString*)className completionBlock:(GTJObjectCompletionBlock)block {
    NSParameterAssert(user_key);
    NSParameterAssert(client_key);
    NSParameterAssert(followed_User_Key);
    
    NSDictionary *parameterDictionary = @{@"user_key":user_key,
                                          @"client_key":client_key,
                                          @"followed_User_Key":followed_User_Key};
    LYRequest *lyricAttentionRequest = [LYRequest requestWithUrl:@"lyric/api/follow.php?" parameters:parameterDictionary method:GTJRequestMethodGet className:className];
    [lyricAttentionRequest setCompletionBlock:block];
    [[GTJNetworkAgent sharedInstance]sendRequest:lyricAttentionRequest];
}

+(void)lyricGetAttentionList:(NSString*)user_key client_key:(NSString*)client_key className:(NSString*)className completionBlock:(GTJObjectCompletionBlock)block {
    NSParameterAssert(user_key);
    NSParameterAssert(client_key);
    
    NSDictionary *parameterDictionary = @{@"user_key":user_key,
                                          @"client_key":client_key};
    LYRequest *lyricAttentionListRequest = [LYRequest requestWithUrl:@"lyric/api/get_followers_list.php?" parameters:parameterDictionary method:GTJRequestMethodGet className:className];
    [lyricAttentionListRequest setCompletionBlock:block];
    [[GTJNetworkAgent sharedInstance]sendRequest:lyricAttentionListRequest];
}

+(void)lyricCancelAttention:(NSString*)user_key client_key:(NSString*)client_key unfollow_User_Key:(NSString*)unfollow_user_key className:(NSString*)className completionBlock:(GTJObjectCompletionBlock)block {
    NSParameterAssert(user_key);
    NSParameterAssert(client_key);
    NSParameterAssert(unfollow_user_key);
    
    NSDictionary *parameterDictionary = @{@"user_key":user_key,
                                          @"client_key":client_key,
                                          @"unfollow_user_key":unfollow_user_key};
    LYRequest *lyricCancelAttentionRequest = [LYRequest requestWithUrl:@"lyric/api/unfollow.php?" parameters:parameterDictionary method:GTJRequestMethodGet className:className];
    [lyricCancelAttentionRequest setCompletionBlock:block];
    [[GTJNetworkAgent sharedInstance]sendRequest:lyricCancelAttentionRequest];
}

+(void)lyricCommentLytic:(NSString*)user_key client_key:(NSString*)client_key followed_User_Key:(NSString*)followed_User_Key user_Comment_Id:(NSString*)user_comment_id comment:(NSString*)comment className:(NSString*)className completionBlock:(GTJObjectCompletionBlock)block {
    NSParameterAssert(user_key);
    NSParameterAssert(client_key);
    NSParameterAssert(followed_User_Key);
    NSParameterAssert(user_comment_id);
    NSParameterAssert(comment);
    
    NSDictionary *parameterDictionary = @{@"user_key":user_key,
                                          @"client_key":client_key,
                                          @"followed_User_Key":followed_User_Key,
                                          @"user_comment_id":user_comment_id,
                                          @"comment":comment};
    LYRequest *lyricCancelAttentionRequest = [LYRequest requestWithUrl:@"lyric/api/comment.php?" parameters:parameterDictionary method:GTJRequestMethodPost className:className];
    [lyricCancelAttentionRequest setCompletionBlock:block];
    [[GTJNetworkAgent sharedInstance]sendRequest:lyricCancelAttentionRequest];
}

+(void)lyricPulish:(NSString*)user_key client_key:(NSString*)client_key lyric:(NSString*)lyric singer:(NSString*)singer songs:(NSString*)songs image:(UIImage*)image className:(NSString*)className completionBlock:(GTJObjectCompletionBlock)block {
    NSParameterAssert(user_key);
    NSParameterAssert(client_key);
    NSParameterAssert(lyric);
    NSParameterAssert(singer);
    NSParameterAssert(songs);
    
    NSDictionary *parameterDictionary = @{@"user_key":user_key,
                                          @"client_key":client_key,
                                          @"lyric":lyric,
                                          @"singer":singer,
                                          @"songs":songs};
    
    LYRequest *lyricPublishRequest = [LYRequest requestWithUrl:@"lyric/api/publish_lyric.php?" parameters:parameterDictionary method:GTJRequestMethodPost className:className];
    [lyricPublishRequest setConstructingBodyBlock:^(id<AFMultipartFormData> formData)
     {
         NSData *data = UIImageJPEGRepresentation(image,0.6);
         [formData appendPartWithFileData:data name:@"user_img" fileName:@"imageB.jpg" mimeType:@"multipart/form-data"];
     }];
    [lyricPublishRequest setCompletionBlock:block];
    [[GTJNetworkAgent sharedInstance]sendRequest:lyricPublishRequest];
}

@end
