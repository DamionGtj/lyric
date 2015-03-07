//
//  GTJObjectBuilder.m
//  lyric
//
//  Created by guotianji on 15/3/7.
//  Copyright (c) 2015年 guotianji. All rights reserved.
//

#import "GTJObjectBuilder.h"
#import <Mantle/Mantle.h>

@implementation GTJObjectBuilder

+ (id)objectFromJSON:(NSDictionary *)JSON className:(NSString *)className
{
    NSParameterAssert(className);
    
    NSError *error = nil;
    id model = [MTLJSONAdapter modelOfClass:NSClassFromString(className) fromJSONDictionary:JSON error:&error];
    
    if (!error) {
        return model;
    } else {
        return nil;
    }
}

+ (id)collectionFromJSON:(NSDictionary *)JSON className:(NSString *)className
{
    NSParameterAssert(className);
    
    if ([JSON isKindOfClass:[NSArray class]]) {
        
        NSValueTransformer *valueTransformer = [MTLValueTransformer mtl_JSONArrayTransformerWithModelClass:NSClassFromString(className)];
        NSArray *collection = [valueTransformer transformedValue:JSON];
        return collection;
        
    }
    return nil;
}

@end
