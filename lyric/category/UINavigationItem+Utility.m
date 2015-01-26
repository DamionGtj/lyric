//
//  UINavigationItem+Utility.m
//  lyric
//
//  Created by guotianji on 15/1/26.
//  Copyright (c) 2015年 guotianji. All rights reserved.
//

#import "UINavigationItem+Utility.h"

@implementation UINavigationItem (Utility)

- (void)setTitleWithTitle:(NSString*)title color:(UIColor*)color
{
    UILabel* titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    titleLab.font = [UIFont systemFontOfSize:18];
    [titleLab setBackgroundColor:[UIColor clearColor]];
    titleLab.textColor = color;
    titleLab.text = title;
    titleLab.textAlignment = NSTextAlignmentCenter;
    self.titleView = titleLab;
    self.title = title;
}

@end
