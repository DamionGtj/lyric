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

@interface LYCircleTableViewController ()

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
    [LYRequestAPI lyricGetLyricLists:account client_key:client_key className:nil completionBlock:^(id object, NSError *error, AFHTTPRequestOperation *operation) {
        if (object && [object isKindOfClass:[NSDictionary class]]) {
            NSDictionary *result = (NSDictionary*)object;
            NSArray *array = [result objectForKey:@"data"];
            for (id add in array) {
                if (add && [add isKindOfClass:[NSDictionary class]]) {
                    
                }
            }
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
    return 6;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseIdenlity = @"LYCircleTableViewCell";
    LYCircleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdenlity forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}

@end
