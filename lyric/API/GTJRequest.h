//
//  GTJRequest.h
//  lyric
//
//  Created by guotianji on 15/3/7.
//  Copyright (c) 2015年 guotianji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFURLRequestSerialization.h"
#import "GTJCompletionBlocks.h"

@class GTJRequest;
typedef NS_ENUM(NSInteger , GTJRequestMethod) {
    GTJRequestMethodGet = 0,
    GTJRequestMethodPost,
    GTJRequestMethodHead,
    GTJRequestMethodPut,
    GTJRequestMethodDelete,
};

typedef NS_ENUM(NSInteger , GTJRequestSerializerType) {
    GTJRequestSerializerTypeHTTP = 0,
    GTJRequestSerializerTypeJSON,
};


@class AFHTTPRequestOperation;

typedef void (^GTJConstructingBlock)(id<AFMultipartFormData> formData);

typedef  NSMutableURLRequest* (^GTJConstructinRequestBlock)(GTJRequest *request,NSString *method, NSURL *URL);

@interface GTJRequest : NSObject

@property (nonatomic, strong) NSDictionary *userInfo;

//设置请求的Path URL
@property (nonatomic, strong) NSString *URLString;

//设置请求返回的回调
@property (nonatomic, copy) GTJObjectCompletionBlock completionBlock;

//设置请求超时时间
@property (nonatomic, assign) NSTimeInterval timeoutInterval;

//设置请求方法
@property (nonatomic, assign) GTJRequestMethod requestMethod;

//自定义创建request的方法
@property (readwrite, nonatomic, copy) GTJConstructinRequestBlock constructingRequestBlock;

//设置请求序列化方法
@property (nonatomic, assign) GTJRequestSerializerType requestSerializerType;

//设置POST请求时内容带有文件图片或富文本时使用
@property (nonatomic, copy) GTJConstructingBlock constructingBodyBlock;

//设置请求的参数
@property (nonatomic, strong) id parameters;

//初始化方法
+(instancetype)requestWithUrl:(NSString *)urlString parameters:(id)parameters requestType:(GTJRequestSerializerType)request method:(GTJRequestMethod)method timeoutInterval:(NSTimeInterval)timeoutInterval;

//设置统一数据处理方法，可在这个方法中判断status code是否合法，数据是否合法等
- (void)handleRequestResult:(AFHTTPRequestOperation *)operation;

@end
