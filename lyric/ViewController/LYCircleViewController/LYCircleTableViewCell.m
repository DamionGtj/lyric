//
//  LYCircleTableViewCell.m
//  lyric
//
//  Created by guotianji on 15/3/14.
//  Copyright (c) 2015年 guotianji. All rights reserved.
//

#import "LYCircleTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation LYCircleTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)bindData:(LYFollowListItemModel*)item {
    self.model = item;
    [self configureAvator:item.user_key];
    [self configureLyricLabel:item.content singer:item.singer song:item.songs];
    [self configureBGImageView:item.img_address];
    [self configureLikeBtn:item.like];
    [self configureTimeLabel:item.time];
}

- (IBAction)clickedLikeBtn:(id)sender {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(didClickedLikeBtn:atIndex:)]) {
        [self.delegate didClickedLikeBtn:self.model atIndex:self.indexPath];
    }
}

- (void)configureAvator:(NSString*)avatorUrl {
    avatorUrl = [avatorUrl stringByReplacingOccurrencesOfString:@"@" withString:@"_"];
    avatorUrl = [avatorUrl stringByReplacingOccurrencesOfString:@"." withString:@"_"];
    NSString *image_url = [NSString stringWithFormat:@"http://52.1.180.135/lyric/img/%@.jpg",avatorUrl];
    image_url = [image_url stringByAddingPercentEscapesUsingEncoding:CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingMacChineseSimp)];
    [_avatorImageView sd_setImageWithURL:[NSURL URLWithString:image_url] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
    }];
}

- (void)configureLyricLabel:(NSString*)lyric singer:(NSString*)singer song:(NSString*)song {
    NSString *result = [[NSString alloc]initWithFormat:@"%@     ————%@《%@》",lyric,singer,song];
    _lyricLabel.text = result;
}

- (void)configureTimeLabel:(long long)time {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"MM月dd日  HH:mm"];
    NSString *timeString = [dateFormatter stringFromDate:date];
    _timeLabel.text = timeString;
}

- (void)configureLikeBtn:(NSInteger)sum {
    [_likeBtn setTitle:[NSString stringWithFormat:@"赞（%ld）",(long)sum] forState:UIControlStateNormal];
}

- (void)configureBGImageView:(NSString*)bgImageUrl {
    NSString *image_url = [NSString stringWithFormat:@"http://%@",bgImageUrl];
    image_url = [image_url stringByAddingPercentEscapesUsingEncoding:CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingMacChineseSimp)];
    [_backGroundImageView sd_setImageWithURL:[NSURL URLWithString:image_url] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
    }];
}

@end



