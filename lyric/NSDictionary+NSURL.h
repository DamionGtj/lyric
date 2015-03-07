//
//  NSDictionary+NSURL.h
//  HXStockAccount
//
//  Created by apple on 14-11-7.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 字典扩展类
 */
@interface NSDictionary (NSURL)

- (NSString*) getAsQueryParams;

- (NSData*) getDataQueryParams;

+ (NSDictionary *)URLQueryParameters:(NSURL *)URL;

@end
