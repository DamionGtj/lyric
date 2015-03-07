//
//  GTJCompletionBlockes.h
//  lyric
//
//  Created by guotianji on 15/3/7.
//  Copyright (c) 2015年 guotianji. All rights reserved.
//

/*
 请求回调Block
 */

#import "AFHTTPRequestOperation.h"

typedef void (^GTJCompletionBlock)(NSError *error);

typedef void (^GTJResponseCompletionBlock)(NSHTTPURLResponse *response, id responseObject, NSError *error);

typedef void (^GTJBooleanCompletionBlock)(BOOL result, NSError *error);

typedef void (^GTJProgressBlock)(NSUInteger numberOfFinishedOperations, NSUInteger totalNumberOfOperations);

typedef void (^GTJBatchCompletionBlock)(NSArray *collection);

typedef void (^GTJObjectCompletionBlock)(id object, NSError *error,AFHTTPRequestOperation *operation);

typedef void (^GTJArrayCompletionBlock)(NSArray *collection, NSError *error);
