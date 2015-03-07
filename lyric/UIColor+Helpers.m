//
//  UIColor+Helpers.m
//  HXStockAccount
//
//  Created by apple on 14-11-5.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "UIColor+Helpers.h"

@implementation UIColor (Helpers)


+ (UIColor *)UIColorFromRGBAColorWithRed: (CGFloat)r green:(CGFloat)g blue:(CGFloat)b alpha:(CGFloat)a {
    return [UIColor colorWithRed: r/255.0 green: g/255.0 blue: b/255.0 alpha:a];
}

+ (UIColor *)UIColorFromRGBColorWithRed:(CGFloat)r green:(CGFloat)g blue:(CGFloat)b {
    return [UIColor colorWithRed: r/255.0 green: g/255.0 blue: b/255.0 alpha: 0.5];
}

+ (UIColor *)UIColorFromHex:(NSUInteger)rgb alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:((float)((rgb & 0xFF0000) >> 16))/255.0
                           green:((float)((rgb & 0xFF00) >> 8))/255.0
                            blue:((float)(rgb & 0xFF))/255.0
                           alpha:alpha];
}

+ (UIColor *)UIColorFromHex:(NSUInteger)rgb
{
    return [UIColor UIColorFromHex:rgb alpha:1.0];
}



@end
