//
//  LYEveryDayViewController.m
//  lyric
//
//  Created by guotianji on 15/1/26.
//  Copyright (c) 2015年 guotianji. All rights reserved.
//

#import "LYEveryDayViewController.h"
#import "UINavigationItem+Utility.h"
#import "LYRequestAPI.h"
#import "LYLoginModel.h"
#import "KTAlert.h"

@interface LYEveryDayViewController ()

@property (nonatomic, strong) LYLoginModel *loginModel;

@end

@implementation LYEveryDayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.tabBarController.navigationItem setTitleWithTitle:@"Just One Word" color:[UIColor whiteColor]];
    
    
    
    [self autoLoggin];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tabBarController.navigationItem setRightBarButtonItem:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)autoLoggin {
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *account = [userDefault objectForKey:loginAccount];
    NSString *password = [userDefault objectForKey:loginPassword];
    
    if (password && password.length > 0 && account && account.length > 0) {
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
        
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
