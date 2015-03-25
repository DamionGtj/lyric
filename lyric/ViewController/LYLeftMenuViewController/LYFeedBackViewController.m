//
//  LYFeedBackViewController.m
//  lyric
//
//  Created by guotianji on 15/3/25.
//  Copyright (c) 2015年 guotianji. All rights reserved.
//

#import "LYFeedBackViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface LYFeedBackViewController () <UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UITextView *inputTextView;
@end

@implementation LYFeedBackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationItem setTitleWithTitle:@"意见反馈" color:[UIColor whiteColor]];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonClicked:)];
    
    RAC(self.navigationItem.rightBarButtonItem,enabled) = [RACSignal
                                                           combineLatest:@[self.inputTextView.rac_textSignal]
                                                           reduce:^(NSString *inputString){
                                                               return @(inputString.length > 0);
                                                           }];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissInputTextView)];
    [self.view addGestureRecognizer:tap];
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

- (void)rightBarButtonClicked:(id)sender {
    [_inputTextView resignFirstResponder];
    
    
}

- (void)dismissInputTextView {
    [_inputTextView resignFirstResponder];
}

@end
