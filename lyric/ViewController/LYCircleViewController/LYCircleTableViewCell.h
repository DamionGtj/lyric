//
//  LYCircleTableViewCell.h
//  lyric
//
//  Created by guotianji on 15/3/14.
//  Copyright (c) 2015年 guotianji. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYFollowListModel.h"

@protocol LYCircleTableViewCellDelegate <NSObject>

- (void)didClickedLikeBtn:(LYFollowListItemModel*)model atIndex:(NSIndexPath*)indexPath;

@end


@interface LYCircleTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *avatorImageView;
@property (weak, nonatomic) IBOutlet UILabel *lyricLabel;
@property (weak, nonatomic) IBOutlet UIImageView *backGroundImageView;
@property (weak, nonatomic) IBOutlet UIButton *likeBtn;
- (IBAction)clickedLikeBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (strong, nonatomic) LYFollowListItemModel *model;
/**
 *  Cell所在的位置，用于Cell delegate回调
 */
@property (nonatomic, strong) NSIndexPath *indexPath;

@property (nonatomic, assign) id <LYCircleTableViewCellDelegate> delegate;

- (void)bindData:(LYFollowListItemModel*)item;

@end
