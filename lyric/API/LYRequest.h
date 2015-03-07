//
//  LYRequest.h
//  lyric
//
//  Created by guotianji on 15/3/7.
//  Copyright (c) 2015年 guotianji. All rights reserved.
//

#import "GTJRequest.h"

@interface LYRequest : GTJRequest

//设置是否使用Mantle解析数据
@property (nonatomic, assign) BOOL useMantle;

//如果使用Mantle解析数据需要设置对应的Model的类名
@property (nonatomic, strong) NSString *className;

//初始化方法
+(instancetype)requestWithUrl:(NSString *)urlString parameters:(id)parameters method:(GTJRequestMethod)method;

//初始化方法
+(instancetype)requestWithUrl:(NSString *)urlString parameters:(id)parameters method:(GTJRequestMethod)method className:(NSString *)className;

@end
