//
//  UIColor+Helpers.h
//  HXStockAccount
//
//  Created by apple on 14-11-5.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 颜色的扩展类，根据RGBA获取颜色
 */
@interface UIColor (Helpers)

// [UIColor UIColorFromRGBColorWithRed:10 green:20 blue:30]
+ (UIColor *)UIColorFromRGBColorWithRed:(CGFloat)r green:(CGFloat)g blue:(CGFloat)b;

// [UIColor UIColorFromRGBAColorWithRed:10 green:20 blue:30 alpha:0.8]
+ (UIColor *)UIColorFromRGBAColorWithRed: (CGFloat)r green:(CGFloat)g blue:(CGFloat)b alpha:(CGFloat)a;

// [UIColor UIColorFromHex:0xc5c5c5 alpha:0.8];
+ (UIColor *)UIColorFromHex:(NSUInteger)rgb alpha:(CGFloat)alpha;

// [UIColor UIColorFromHex:0xc5c5c5];
+ (UIColor *)UIColorFromHex:(NSUInteger)rgb;

@end
