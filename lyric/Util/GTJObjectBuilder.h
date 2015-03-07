//
//  GTJObjectBuilder.h
//  lyric
//
//  Created by guotianji on 15/3/7.
//  Copyright (c) 2015年 guotianji. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 该类是在mantle的基础上
 */
@interface GTJObjectBuilder : NSObject

+ (id)objectFromJSON:(NSDictionary *)JSON className:(NSString *)className;


+ (id)collectionFromJSON:(NSDictionary *)JSON className:(NSString *)className;

@end
