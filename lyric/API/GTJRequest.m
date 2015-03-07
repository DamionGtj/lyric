//
//  GTJRequest.m
//  lyric
//
//  Created by guotianji on 15/3/7.
//  Copyright (c) 2015年 guotianji. All rights reserved.
//

#import "GTJRequest.h"
#import "AFHTTPRequestOperation.h"

@interface GTJRequest()


@end

@implementation GTJRequest

+(instancetype)requestWithUrl:(NSString *)urlString parameters:(id)parameters requestType:(GTJRequestSerializerType)request method:(GTJRequestMethod)method timeoutInterval:(NSTimeInterval)timeoutInterval
{
    return [[self alloc]initWithURL:urlString parameters:parameters requestType:request method:method timeoutInterval:timeoutInterval];
}

- (instancetype)initWithURL:(NSString *)urlString  parameters:(id)parameters requestType:(GTJRequestSerializerType)request method:(GTJRequestMethod)method timeoutInterval:(NSTimeInterval)timeoutInterval
{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.URLString = urlString;
    
    self.requestSerializerType = request;
    
    self.requestMethod = method;
    
    self.timeoutInterval = timeoutInterval;
    
    self.parameters = parameters;
    
    return self;
}

- (void)handleRequestResult:(AFHTTPRequestOperation *)operation
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),^{
        if (operation.error)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (self.completionBlock)
                {
                    self.completionBlock(nil,operation.error,operation);
                }
            });
        }
        else
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (self.completionBlock)
                {
                    self.completionBlock(operation.responseObject,operation.error,operation);
                }
            });
        }
    });
}

-(void)dealloc
{
    self.completionBlock = nil;
}

@end
