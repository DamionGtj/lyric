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

@interface LYEveryDayViewController ()

@end

@implementation LYEveryDayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.tabBarController.navigationItem setTitleWithTitle:@"Just One Word" color:[UIColor whiteColor]];
    
    UIImage *image = [UIImage imageNamed:@"aa.png"];
//    [LYRequestAPI lyricRegister:@"540398756@qq.com" user_Name:@"ceshi" user_Password:@"123456" user_Image:image className:nil completionBlock:^(id object, NSError *error, AFHTTPRequestOperation *operation) {
//        
//    }];
    
//    [LYRequestAPI lyricLogin:@"540398756@qq.com" user_Password:@"123456" className:nil completionBlock:^(id object, NSError *error, AFHTTPRequestOperation *operation) {
//        if (object && [object isKindOfClass:[NSDictionary class]]) {
//            NSString *client_key = [object objectForKey:@"client_key"];
//            [[NSUserDefaults standardUserDefaults]setObject:client_key forKey:@"client_key"];
//            [[NSUserDefaults standardUserDefaults]synchronize];
//        }
//    }];
    
//    [LYRequestAPI lyricGetOneWordWithClassName:nil completionBlock:^(id object, NSError *error, AFHTTPRequestOperation *operation) {
//        
//    }];
    
    NSString *client_key = [[NSUserDefaults standardUserDefaults]objectForKey:@"client_key"];
//    [LYRequestAPI lyricGetLyricLists:@"540398756@qq.com" client_key:client_key className:nil completionBlock:^(id object, NSError *error, AFHTTPRequestOperation *operation) {
//        
//    }];
    
//    [LYRequestAPI lyricAttentionUser:@"540398756@qq.com" client_key:client_key followed_User_Key:@"1540733456@qq.com" className:nil completionBlock:^(id object, NSError *error, AFHTTPRequestOperation *operation) {
//        
//    }];
    
//    [LYRequestAPI lyricGetAttentionList:@"540398756@qq.com" client_key:client_key className:nil completionBlock:^(id object, NSError *error, AFHTTPRequestOperation *operation) {
//        
//    }];
    
//    [LYRequestAPI lyricCancelAttention:@"540398756@qq.com" client_key:client_key unfollow_User_Key:@"1540733456@qq.com" className:nil completionBlock:^(id object, NSError *error, AFHTTPRequestOperation *operation) {
//        
//    }];
    
//    [LYRequestAPI lyricCommentLytic:@"540398756@qq.com" client_key:client_key followed_User_Key:@"1540733456@qq.com" user_Comment_Id:@"1000" comment:@"Aasdfads" className:nil completionBlock:^(id object, NSError *error, AFHTTPRequestOperation *operation) {
//        
//    }];
    
    [LYRequestAPI lyricPulish:@"540398756@qq.com" client_key:client_key lyric:@"若你喜欢怪人，其实我很美" singer:@"陈奕迅" songs:@"打回原形" image:image className:nil completionBlock:^(id object, NSError *error, AFHTTPRequestOperation *operation) {
        
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

@end
