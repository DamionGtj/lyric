//
//  LYRegisterTableViewController.m
//  lyric
//
//  Created by 郭天际 on 15/3/8.
//  Copyright (c) 2015年 guotianji. All rights reserved.
//

#import "LYRegisterTableViewController.h"
#import "UIImage+Utility.h"
#import "KTAlert.h"
#import "ReactiveCocoa.h"


@interface LYRegisterTableViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UITextField *nickerTextField;
@property (weak, nonatomic) IBOutlet UITextField *accountTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
- (IBAction)clickedRegister:(id)sender;

@end

@implementation LYRegisterTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:RGBCOLOR(255, 108, 0)] forBarMetrics:UIBarMetricsDefault];
    
    [self.navigationItem setTitleWithTitle:@"注册" color:[UIColor whiteColor]];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonClicked:)];
    
    RAC(_registerBtn,enabled) = [RACSignal
                              combineLatest:@[self.nickerTextField.rac_textSignal,self.accountTextField.rac_textSignal,self.passwordTextField.rac_textSignal]
                              reduce:^(NSString* nicker,NSString *account, NSString *password){
                                  return @(nicker.length >0 && account.length > 0 && password.length > 0);
                              }];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark - UIAction
- (IBAction)clickedRegister:(id)sender {
    
}

- (void)leftBarButtonClicked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - InputCheck
- (BOOL)isInputLegal {
    if (_nickerTextField.text.length == 0) {
        [KTAlert showAlert:KTAlertTypeToast withMessage:@"昵称不能为空" andDuration:1500];
        return NO;
    }
    else if (_accountTextField.text.length == 0) {
        [KTAlert showAlert:KTAlertTypeToast withMessage:@"登录名不能为空" andDuration:1500];
        return NO;
    }
    else if (_passwordTextField.text.length == 0) {
        [KTAlert showAlert:KTAlertTypeToast withMessage:@"密码不能为空" andDuration:1500];
        return NO;
    }
    return YES;
}

#pragma mark - UITextFieldDelegate
- (void)textFieldDidEndEditing:(UITextField *)textField {
    [_nickerTextField resignFirstResponder];
    [_accountTextField resignFirstResponder];
    [_passwordTextField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == _nickerTextField) {
        [_nickerTextField resignFirstResponder];
    }
    else if (textField == _accountTextField) {
        [_accountTextField resignFirstResponder];
    }
    else if (textField == _passwordTextField) {
        [_passwordTextField resignFirstResponder];
    }
    return YES;
}
@end
