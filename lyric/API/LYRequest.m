//
//  LYRequest.m
//  lyric
//
//  Created by guotianji on 15/3/7.
//  Copyright (c) 2015年 guotianji. All rights reserved.
//

#import "LYRequest.h"

#import "AFHTTPRequestOperation.h"
#import "GTJObjectBuilder.h"
#import "LYConfiguration.h"

#define DefaultTimeoutInterval 20

@implementation LYRequest

+(instancetype)requestWithUrl:(NSString *)urlString parameters:(id)parameters method:(GTJRequestMethod)method
{
    return [self requestWithUrl:urlString parameters:parameters method:method className:nil];
}

+(instancetype)requestWithUrl:(NSString *)urlString parameters:(id)parameters method:(GTJRequestMethod)method className:(NSString *)className
{
    return [self requestWithUrl:urlString parameters:parameters method:method className:className timeoutInterval:DefaultTimeoutInterval];
    
}

+ (instancetype)requestWithUrl:(NSString *)urlString parameters:(id)parameters method:(GTJRequestMethod)method className:(NSString *)className timeoutInterval:(NSTimeInterval)timeoutInterval
{
    return [[self alloc]initWithURL:urlString parameters:parameters method:method className:className timeoutInterval:timeoutInterval];
}


- (instancetype)initWithURL:(NSString *)urlString parameters:(id)parameters method:(GTJRequestMethod)method className:(NSString *)className timeoutInterval:(NSTimeInterval)timeoutInterval
{
    self = [super init];
    if (!self)
    {
        return nil;
    }
    
    self.timeoutInterval = timeoutInterval;
    
    self.requestSerializerType = GTJRequestSerializerTypeHTTP;
    
    self.URLString = urlString;
    
    self.requestMethod = method;
    
    self.parameters = parameters;
    
    if (className && [className isKindOfClass:[NSString class]] && className.length > 0)
    {
        _useMantle = YES;
        self.className = className;
    }
    else
    {
        _useMantle = NO;
    }
    return self;
}

- (void)handleRequestResult:(AFHTTPRequestOperation *)operation
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),^{
        if (operation.error)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (self.completionBlock && [operation.error code] != NSURLErrorCancelled)
                {
                    self.completionBlock(nil,operation.error,operation);
                }
            });
        }
        else
        {
            //如果请求成功，这里会先收集cookies
            NSArray* cookies = [NSHTTPCookie cookiesWithResponseHeaderFields:[operation.response allHeaderFields] forURL:[operation.request URL]];
            if (cookies && cookies.count > 0)
            {
                [[LYConfiguration sharedInstance]setCookies:cookies];
            }
            //解析数据
            NSError *error = nil;
            NSDictionary *dict = nil;
            if ([operation.responseObject isKindOfClass:[NSDictionary class]])
            {
                dict = operation.responseObject;
            }
            else
            {
                NSDictionary *dictionary=[NSJSONSerialization JSONObjectWithData:operation.responseData options:0 error:&error];
                if (error)
                {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        if (self.completionBlock)
                        {
                            self.completionBlock(dictionary,error,operation);
                        }
                    });
                }
                else
                {
                    dict = dictionary;
                }
            }
            if (dict && [[dict objectForKey:kServerErrorNumber] intValue]!=0)
            {
                NSString *message = [dict objectForKey:kServerErrorInfo];
                NSString *errotReason = @"服务器返回信息错误";
                NSDictionary *userInfo = @{
                                           NSLocalizedDescriptionKey:message,
                                           NSLocalizedFailureReasonErrorKey: errotReason,
                                           };
                
                error = [NSError errorWithDomain:kStockAccountErrorDomain code:[[dict objectForKey:kServerErrorNumber] intValue] userInfo:userInfo];
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (self.completionBlock)
                    {
                        self.completionBlock(dict,error,operation);
                    }
                });
            }
            else
            {
                if (_useMantle && _className && _className.length > 0)
                {
                    id object =[GTJObjectBuilder objectFromJSON:dict className:_className];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        if (self.completionBlock)
                        {
                            self.completionBlock(object,error,operation);
                        }
                    });
                }
                else
                {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        if (self.completionBlock)
                        {
                            self.completionBlock(dict,error,operation);
                        }
                    });
                }
            }
        }
    });
}

@end
