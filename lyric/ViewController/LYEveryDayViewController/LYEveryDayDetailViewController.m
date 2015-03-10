//
//  LYEveryDayDetailViewController.m
//  lyric
//
//  Created by guotianji on 15/3/10.
//  Copyright (c) 2015年 guotianji. All rights reserved.
//

#import "LYEveryDayDetailViewController.h"

#import "LYRequestAPI.h"
#import "LYEveryDayModel.h"
#import "ReactiveCocoa.h"

@interface LYEveryDayDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *illastrationImageView;
@property (weak, nonatomic) IBOutlet UILabel *providerLabel;
@property (weak, nonatomic) IBOutlet UILabel *dayLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *singerLabel;
@property (weak, nonatomic) IBOutlet UIButton *likeBtn;

- (IBAction)clickedLikeBtn:(id)sender;

@property (nonatomic, strong) LYEveryDayModel *everDayModel;
@end

@implementation LYEveryDayDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [LYRequestAPI lyricGetOneWordWithClassName:@"LYEveryDayModel" completionBlock:^(id object, NSError *error, AFHTTPRequestOperation *operation) {
        if (object && [object isKindOfClass:[LYEveryDayModel class]]) {
            self.everDayModel = (LYEveryDayModel*)object;
        }
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

- (IBAction)clickedLikeBtn:(id)sender {
    
}
@end
