//
//  LYLoginViewController.m
//  lyric
//
//  Created by 郭天际 on 15/3/8.
//  Copyright (c) 2015年 guotianji. All rights reserved.
//

#import "LYLoginViewController.h"
#import "LYRequestAPI.h"
#import "KTAlert.h"
#import "ReactiveCocoa.h"
#import "LYLoginModel.h"

#import "LYKit.h"

@interface LYLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *accountTextFiled;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
- (IBAction)clickToLogin:(id)sender;

@property (nonatomic, strong) LYLoginModel *loginModel;

@end

@implementation LYLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self.navigationItem setTitleWithTitle:@"登录" color:[UIColor whiteColor]];
    
    NSString *account = [[NSUserDefaults standardUserDefaults]objectForKey:loginAccount];
    if (account && account.length > 0) {
        _accountTextFiled.text = account;
    }
    
    RAC(_loginBtn,enabled) = [RACSignal
                                  combineLatest:@[self.accountTextFiled.rac_textSignal,self.passwordTextField.rac_textSignal]
                                  reduce:^(NSString *account, NSString *password){
        return @(account.length > 0 && password.length > 0);
    }];
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
- (IBAction)clickToLogin:(id)sender {
    if ([self isInputLegal]) {
        NSString *account = _accountTextFiled.text;
        NSString *password = _passwordTextField.text;
        [LYRequestAPI lyricLogin:account user_Password:password className:@"LYLoginModel" completionBlock:^(id object, NSError *error, AFHTTPRequestOperation *operation) {
            if (object && [object isKindOfClass:[LYLoginModel class]]) {
                self.loginModel = (LYLoginModel*)object;
                [self analysisData];
                
            }
        }];
    }
}

- (void)analysisData {
    if (self.loginModel.code != 1) {
        [KTAlert showAlert:KTAlertTypeToast withMessage:self.loginModel.message andDuration:1500];
    }
    else {
        NSString *client_key = self.loginModel.client_key;
        if (client_key && client_key.length > 0) {
            [[NSUserDefaults standardUserDefaults]setObject:client_key forKey:clientKey];
            [[NSUserDefaults standardUserDefaults]synchronize];
        }
        
        [LYKit sharedInstance].current_user = self.loginModel;
        
        [[NSUserDefaults standardUserDefaults]setObject:_accountTextFiled.text forKey:loginAccount];
        [[NSUserDefaults standardUserDefaults]setObject:_passwordTextField.text forKey:loginPassword];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma mark - Input data Judge
- (BOOL)isInputLegal {
    if (_accountTextFiled.text.length == 0) {
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
    [_accountTextFiled resignFirstResponder];
    [_passwordTextField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == _accountTextFiled) {
        [_accountTextFiled resignFirstResponder];
    }
    else if (textField == _passwordTextField) {
        [_passwordTextField resignFirstResponder];
    }
    return YES;
}
@end
