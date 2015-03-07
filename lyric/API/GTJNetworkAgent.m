//
//  LYNetworkAgent.m
//  lyric
//
//  Created by guotianji on 15/3/7.
//  Copyright (c) 2015年 guotianji. All rights reserved.
//

#import "GTJNetworkAgent.h"
#import "AFNetworking.h"
#import "gtjRequest.h"

@interface GTJNetworkAgent()

@property(nonatomic,strong)AFHTTPRequestOperationManager *manager;

//基本URL
@property(nonatomic,strong)NSURL *baseURL;

@end

@implementation GTJNetworkAgent

+ (instancetype )sharedInstance
{
    __strong static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        _baseURL = [NSURL URLWithString:kBaseUrl];
        _manager = [[AFHTTPRequestOperationManager alloc]initWithBaseURL:_baseURL];
        _manager.operationQueue.maxConcurrentOperationCount = 6;
        
    }
    return self;
}


//发送多个请求
- (void)sendRequests:(NSArray *)requests progressBlock:(GTJProgressBlock)progressBlock completionBlock:(GTJBatchCompletionBlock)completionBlock
{
    NSMutableArray *mutableOperations = [NSMutableArray array];
    for (GTJRequest *request in requests)
    {
        AFHTTPRequestOperation *requestOperation = [self getOperation:request success:^(AFHTTPRequestOperation *operation, id responseObject)
                                                    {
                                                        [request handleRequestResult:operation];
                                                    } failure:^(AFHTTPRequestOperation *operation, NSError *error)
                                                    {
                                                        [request handleRequestResult:operation];
                                                    }];
        if (requestOperation)
        {
            [mutableOperations addObject:requestOperation];
        }
    }
    
    NSArray *operations = [AFURLConnectionOperation batchOfRequestOperations:mutableOperations progressBlock:^(NSUInteger numberOfFinishedOperations, NSUInteger totalNumberOfOperations)
                           {
                               if (progressBlock)
                               {
                                   progressBlock(numberOfFinishedOperations,totalNumberOfOperations);
                               }
                           } completionBlock:^(NSArray *operations)
                           {
                               if (completionBlock)
                               {
                                   completionBlock(operations);
                               }
                           }];
    [_manager.operationQueue addOperations:operations waitUntilFinished:NO];
}


//清除单一请求
- (void)cancelRequestWithMethod:(GTJRequestMethod)method
                     parameters:(id)parameters
                           path:(NSString *)path
{
    NSString *methodString = [self formatMethodString:method];
    
    NSMutableURLRequest *request = [_manager.requestSerializer requestWithMethod:methodString URLString:[[NSURL URLWithString:path relativeToURL:self.baseURL] absoluteString] parameters:parameters error:nil];
    
    for (NSOperation *operation in [_manager.operationQueue operations])
    {
        if (![operation isKindOfClass:[AFHTTPRequestOperation class]]) {
            continue;
        }
        BOOL hasMatchingMethod = !methodString || [methodString isEqualToString:[[(AFHTTPRequestOperation *)operation request] HTTPMethod]];
        BOOL hasMatchingURL = [[[(AFHTTPRequestOperation *)operation request] URL] isEqual:[request URL]];
        if (method == GTJRequestMethodPost)
        {
            BOOL hasMatchingBody = [[[(AFHTTPRequestOperation *)operation request] HTTPBody] isEqual:[request HTTPBody]];
            if (hasMatchingMethod && hasMatchingURL && hasMatchingBody) {
                [operation cancel];
            }
        }
        else
        {
            if (hasMatchingMethod && hasMatchingURL)
            {
                [operation cancel];
            }
        }
    }
}

//清除所有的请求
- (void)cancelAllRequests
{
    [[_manager operationQueue]cancelAllOperations];
}


//发送单个请求
- (void)sendRequest:(GTJRequest *)request
{
    [self cancelRequestWithMethod:request.requestMethod parameters:request.parameters path:request.URLString];
    AFHTTPRequestOperation *requestOperation = [self getOperation:request success:^(AFHTTPRequestOperation *operation, id responseObject)
                                                {
                                                    [request handleRequestResult:operation];
                                                    
                                                } failure:^(AFHTTPRequestOperation *operation, NSError *error)
                                                {
                                                    [request handleRequestResult:operation];
                                                }];
    if (requestOperation)
    {
        [_manager.operationQueue addOperation:requestOperation];
    }
}

//这里没有使用AFHTTPRequestOperationManager 的GET POST等方法是因为AFHTTPRequestOperationManager的方法会自动添加到AFHTTPRequestOperationManager 的operationQueue中，而HXNetworkAgent为了支持添加请求队列，所以重新创建了该方法
- (AFHTTPRequestOperation*)getOperation:(GTJRequest *)request
                                success:(void (^)(AFHTTPRequestOperation *operation,id responseObject))success
                                failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    AFHTTPRequestOperation *operation = nil;
    if (request.requestSerializerType == GTJRequestSerializerTypeHTTP)
    {
        _manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    }
    else if (request.requestSerializerType == GTJRequestSerializerTypeJSON)
    {
        _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    
    _manager.requestSerializer.timeoutInterval = request.timeoutInterval;
    /*
     这里必须要设置acceptableContentTypes,这是afnetworking的BUG，详情请参考
     http://stackoverflow.com/questions/19114623/request-failed-unacceptable-content-type-text-html-using-afnetworking-2-0
     */
    _manager.responseSerializer.acceptableContentTypes = [_manager.responseSerializer.acceptableContentTypes setByAddingObject: @"text/html"];
    GTJRequestMethod method = request.requestMethod;
    
    if (request.constructingRequestBlock)
    {
        NSURL *url = [NSURL URLWithString:request.URLString relativeToURL:self.baseURL];
        NSString *methodString = [self formatMethodString:method];
        NSMutableURLRequest *customRequest = request.constructingRequestBlock(request,methodString,url);
        if (customRequest)
        {
            operation = [[AFHTTPRequestOperation alloc] initWithRequest:customRequest];
            [operation setCompletionBlockWithSuccess:success failure:failure];
        }
    }
    else
    {
        if (method == GTJRequestMethodPost)
        {
            GTJConstructingBlock constructingBlock = [request constructingBodyBlock];
            
            if (constructingBlock != nil)
            {
                NSMutableURLRequest *urlRequest = [_manager.requestSerializer multipartFormRequestWithMethod:@"POST" URLString:[[NSURL URLWithString:request.URLString relativeToURL:self.baseURL] absoluteString] parameters:request.parameters constructingBodyWithBlock:constructingBlock error:nil];
                
                operation = [_manager HTTPRequestOperationWithRequest:urlRequest success:success failure:failure];
            }
            else
            {
                NSMutableURLRequest *urlRequest = [_manager.requestSerializer requestWithMethod:@"POST" URLString:[[NSURL URLWithString:request.URLString relativeToURL:self.baseURL] absoluteString] parameters:request.parameters error:nil];
                
                operation = [_manager HTTPRequestOperationWithRequest:urlRequest success:success failure:failure];
            }
        }
        else
        {
            NSString *methodString = [self formatMethodString:method];
            NSMutableURLRequest *urlRequest = [_manager.requestSerializer requestWithMethod:methodString URLString:[[NSURL URLWithString:request.URLString relativeToURL:self.baseURL] absoluteString] parameters:request.parameters error:nil];
            operation = [_manager HTTPRequestOperationWithRequest:urlRequest success:success failure:failure];
        }
    }
    operation.userInfo = request.userInfo;
    return operation;
    
}

-(NSString *)formatMethodString:(GTJRequestMethod)method
{
    NSString *methodString = nil;
    if (method == GTJRequestMethodGet)
    {
        methodString = @"GET";
    }
    else if (method == GTJRequestMethodHead)
    {
        methodString = @"HEAD";
    }
    else if (method == GTJRequestMethodPut)
    {
        methodString = @"PUT";
    }
    else if (method == GTJRequestMethodDelete)
    {
        methodString = @"DELETE";
    }
    else if (method == GTJRequestMethodPost)
    {
        methodString = @"POST";
    }
    return methodString;
}

@end
