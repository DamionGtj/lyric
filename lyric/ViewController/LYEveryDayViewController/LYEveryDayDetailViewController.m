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

#import <SDWebImage/UIImageView+WebCache.h>

@interface LYEveryDayDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *illastrationImageView;
@property (weak, nonatomic) IBOutlet UILabel *providerLabel;
@property (weak, nonatomic) IBOutlet UILabel *dayLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *singerLabel;
@property (weak, nonatomic) IBOutlet UIButton *likeBtn;
@property (weak, nonatomic) IBOutlet UILabel *lyricLabel;

- (IBAction)clickedLikeBtn:(id)sender;

@property (nonatomic, strong) LYEveryDayModel *everyDayModel;
@property (nonatomic, strong) LYDetailModel *detailModel;
@end

@implementation LYEveryDayDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [LYRequestAPI lyricGetOneWordWithClassName:@"LYEveryDayModel" completionBlock:^(id object, NSError *error, AFHTTPRequestOperation *operation) {
        if (object && [object isKindOfClass:[LYEveryDayModel class]]) {
            self.everyDayModel = (LYEveryDayModel*)object;
            self.detailModel = (LYDetailModel*)self.everyDayModel.resultDic;
            [self reFreshUI];
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

#pragma mark - UI and Action
- (void)reFreshUI {
    NSString *image_url = [NSString stringWithFormat:@"http://%@",self.detailModel.img_url];
    image_url = [image_url stringByAddingPercentEscapesUsingEncoding:CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingMacChineseSimp)];
    [_illastrationImageView sd_setImageWithURL:[NSURL URLWithString:image_url] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
    }];
    
    _providerLabel.text = self.detailModel.provider;
    
    _singerLabel.text = [NSString stringWithFormat:@"%@《%@》",self.detailModel.singer,self.detailModel.song_name];
    
    _lyricLabel.text = self.detailModel.lyric;
    
    NSDate *nowDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"MMM,YYYY"];
    NSString *dateText = [dateFormatter stringFromDate:nowDate];
    [dateFormatter setDateFormat:@"d"];
    NSString *dayText = [dateFormatter stringFromDate:nowDate];
    
    _dateLabel.text = dateText;
    _dayLabel.text = dayText;
}

- (IBAction)clickedLikeBtn:(id)sender {
    
}
@end
