//
//  LYNetworkAgent.h
//  lyric
//
//  Created by guotianji on 15/3/7.
//  Copyright (c) 2015年 guotianji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GTJRequest.h"

typedef void (^GTJCookiesHandler)();

/*
 网络代理类基类,建立在AFNetworking 2.0的基础上，支持发送batching Requests,支持取消单个请求
 */

@interface GTJNetworkAgent : NSObject

//单例类
+ (instancetype )sharedInstance;

//发送单个请求
- (void)sendRequest:(GTJRequest *)request;

//发送多个请求
- (void)sendRequests:(NSArray *)requests progressBlock:(GTJProgressBlock)progressBlock completionBlock:(GTJBatchCompletionBlock)completionBlock;

//清除单一请求，这里需要传入参数，请求方法，请求路径，这里取消一个Get请求，会把参数拼接到url中，而Post请求，会把参数组成postbody 进行判断，如果一致才会取消
- (void)cancelRequestWithMethod:(GTJRequestMethod)method
                     parameters:(id)parameters
                           path:(NSString *)path;

//清除所有的请求
- (void)cancelAllRequests;

@end
