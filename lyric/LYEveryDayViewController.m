//
//  LYEveryDayViewController.m
//  lyric
//
//  Created by guotianji on 15/1/26.
//  Copyright (c) 2015年 guotianji. All rights reserved.
//

#import "LYEveryDayViewController.h"
#import "UINavigationItem+Utility.h"

@interface LYEveryDayViewController ()

@end

@implementation LYEveryDayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.tabBarController.navigationItem setTitleWithTitle:@"Just One Word" color:[UIColor whiteColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
