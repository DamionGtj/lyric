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
    
    [SlideNavigationController sharedInstance].navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonClicked:)];
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
#pragma mark - UI and Action
- (void)rightBarButtonClicked:(id)sender {
    LYPublishLyricViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LYPublishLyricViewController"];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
