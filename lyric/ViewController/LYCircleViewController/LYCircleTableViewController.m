//
//  LYCircleTableViewController.m
//  lyric
//
//  Created by guotianji on 15/3/14.
//  Copyright (c) 2015年 guotianji. All rights reserved.
//

#import "LYCircleTableViewController.h"
#import "LYCircleTableViewCell.h"
#import "LYRequestAPI.h"
#import "LYPublishLyricViewController.h"
#import "SlideNavigationController.h"
#import "LYFollowListModel.h"
#import "LYDetailLyricViewController.h"

@interface LYCircleTableViewController ()

@property (nonatomic, strong) NSArray *followList;

@end

@implementation LYCircleTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    NSString *client_key = [[NSUserDefaults standardUserDefaults]objectForKey:clientKey];
    NSString *account = [[NSUserDefaults standardUserDefaults]objectForKey:loginAccount];
    [LYRequestAPI lyricGetLyricLists:account client_key:client_key className:@"LYFollowListModel" completionBlock:^(id object, NSError *error, AFHTTPRequestOperation *operation) {
        if (object && [object isKindOfClass:[LYFollowListModel class]]) {
            self.followList = [(LYFollowListModel*)object data];
            [self.tableView reloadData];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI and Action


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return _followList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseIdenlity = @"LYCircleTableViewCell";
    LYCircleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdenlity forIndexPath:indexPath];
    
    LYFollowListItemModel *item = (LYFollowListItemModel*)[_followList objectAtIndex:indexPath.row];
    cell.indexPath = indexPath;
    cell.delegate = self;
    [cell bindData:item];
    // Configure the cell...
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    LYFollowListItemModel *item = [_followList objectAtIndex:indexPath.row];
    
    LYDetailLyricViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LYDetailLyricViewController"];
    viewController.item = item;
    [self.navigationController pushViewController:viewController animated:YES];
    
}

#pragma mark - LYCircleTableViewCellDelegate

- (void)didClickedLikeBtn:(LYFollowListItemModel *)model atIndex:(NSIndexPath *)indexPath {
    LYFollowListItemModel *item = [_followList objectAtIndex:indexPath.row];
    item.like++;
    [self.tableView reloadData];
}

@end
