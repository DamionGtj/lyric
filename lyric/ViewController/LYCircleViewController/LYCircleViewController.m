//
//  LYCircleViewController.m
//  lyric
//
//  Created by guotianji on 15/3/14.
//  Copyright (c) 2015年 guotianji. All rights reserved.
//

#import "LYCircleViewController.h"
#import "LYPublishLyricViewController.h"
#import "SlideNavigationController.h"

@interface LYCircleViewController ()

@end

@implementation LYCircleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    UIButton *button  = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [button setImage:[UIImage imageNamed:@"aldUpdatePhoto_up"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(rightBarButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    [self.tabBarController.navigationItem setRightBarButtonItem:rightBarButtonItem];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - UI and Action
- (void)rightBarButtonClicked:(id)sender {
    LYPublishLyricViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LYPublishLyricViewController"];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:viewController];
    [[SlideNavigationController sharedInstance]presentViewController:nav animated:YES completion:nil];
}

@end
