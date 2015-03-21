//
//  LYCircleTableViewCell.h
//  lyric
//
//  Created by guotianji on 15/3/14.
//  Copyright (c) 2015年 guotianji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYCircleTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *avatorImageView;
@property (weak, nonatomic) IBOutlet UILabel *lyricLabel;
@property (weak, nonatomic) IBOutlet UIImageView *backGroundImageView;
@property (weak, nonatomic) IBOutlet UIButton *likeBtn;
- (IBAction)clickedLikeBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end
