//
//  LYTabBarController.m
//  lyric
//
//  Created by guotianji on 15/1/26.
//  Copyright (c) 2015年 guotianji. All rights reserved.
//

#import "LYTabBarController.h"
#import "UIImage+Utility.h"

@implementation LYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:RGBCOLOR(255, 108, 0)] forBarMetrics:UIBarMetricsDefault];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:RGBCOLOR(49, 182, 239)] forBarMetrics:UIBarMetricsDefault];
    
    
//    self.tabBar.tintColor = RGBACOLOR(9, 187, 7, 1);
    self.tabBar.tintColor = RGBACOLOR(49, 182, 239, 1);
    for (UITabBarItem* item in self.tabBar.items)
    {
        if ([item.title isEqualToString:@"每日一句"])
        {
            item.image = [[UIImage imageNamed:@"aldMessage_up"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            item.selectedImage = [[UIImage imageNamed:@"aldMessage_down"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        }
        else if ([item.title isEqualToString:@"词圈"])
        {
            item.image = [[UIImage imageNamed:@"aldContact_up"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            item.selectedImage = [[UIImage imageNamed:@"aldContact_down"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        }
        else if ([item.title isEqualToString:@"热门"])
        {
            item.image = [[UIImage imageNamed:@"aldNearby_up"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            item.selectedImage = [[UIImage imageNamed:@"aldNearby_down"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        }
    }
}

#pragma mark - SlideNavigationController Methods -

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return YES;
}

- (BOOL)slideNavigationControllerShouldDisplayRightMenu
{
    return NO;
}

@end
