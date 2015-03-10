//
//  LYEveryDayTableViewController.m
//  lyric
//
//  Created by 郭天际 on 15/2/27.
//  Copyright (c) 2015年 guotianji. All rights reserved.
//

#import "LYEveryDayTableViewController.h"
#import "LYEveryDayTableViewCell.h"
#import "LYRequestAPI.h"

@interface LYEveryDayTableViewController ()

@property(nonatomic, strong) NSArray *arr;

@end

@implementation LYEveryDayTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _arr = @[@"注册register.php",@"登录login.php",@"每日一句get_hot_list.php",@"词圈get_follow_list.php",@"关注用户follow.php",@"关注列表get_followers_list.php",@"取消关注unfollow.php",@"评论comment.php",@"发布歌词publish_lyric.php"];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 9;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseIdentity = @"EveryDayTableViewCell";
//    LYEveryDayTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentity forIndexPath:indexPath];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentity forIndexPath:indexPath];
    cell.textLabel.text = _arr[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    UIImage *image = [UIImage imageNamed:@"LyContact_down"];
    NSString *client_key = [[NSUserDefaults standardUserDefaults]objectForKey:@"client_key"];
    switch (indexPath.row) {
        case 0:
        {
            [LYRequestAPI lyricRegister:@"540398756@qq.com" user_Name:@"ceshi" user_Password:@"123456" user_Image:image className:nil completionBlock:^(id object, NSError *error, AFHTTPRequestOperation *operation) {
                
            }];
        }
            break;
        case 1:
        {
            [LYRequestAPI lyricLogin:@"540398756@qq.com" user_Password:@"123456" className:nil completionBlock:^(id object, NSError *error, AFHTTPRequestOperation *operation) {
                if (object && [object isKindOfClass:[NSDictionary class]]) {
                    NSString *client_key = [object objectForKey:@"client_key"];
                    [[NSUserDefaults standardUserDefaults]setObject:client_key forKey:@"client_key"];
                    [[NSUserDefaults standardUserDefaults]synchronize];
                }
            }];
        }
            break;
        case 2:
        {
            [LYRequestAPI lyricGetOneWordWithClassName:nil completionBlock:^(id object, NSError *error, AFHTTPRequestOperation *operation) {
                
            }];
        }
            break;
        case 3:
        {
            [LYRequestAPI lyricGetLyricLists:@"540398756@qq.com" client_key:client_key className:nil completionBlock:^(id object, NSError *error, AFHTTPRequestOperation *operation) {
                
            }];
        }
            break;
        case 4:
        {
            [LYRequestAPI lyricAttentionUser:@"540398756@qq.com" client_key:client_key followed_User_Key:@"1540733456@qq.com" className:nil completionBlock:^(id object, NSError *error, AFHTTPRequestOperation *operation) {
                
            }];
        }
            break;
        case 5:
        {
            [LYRequestAPI lyricGetAttentionList:@"540398756@qq.com" client_key:client_key className:nil completionBlock:^(id object, NSError *error, AFHTTPRequestOperation *operation) {
                
            }];
        }
            break;
        case 6:
        {
            [LYRequestAPI lyricCancelAttention:@"540398756@qq.com" client_key:client_key unfollow_User_Key:@"1540733456@qq.com" className:nil completionBlock:^(id object, NSError *error, AFHTTPRequestOperation *operation) {
                
            }];
        }
            break;
        case 7:
        {
            [LYRequestAPI lyricCommentLytic:@"540398756@qq.com" client_key:client_key followed_User_Key:@"1540733456@qq.com" user_Comment_Id:@"1000" comment:@"Aasdfads" className:nil completionBlock:^(id object, NSError *error, AFHTTPRequestOperation *operation) {
                
            }];
        }
            break;
        case 8:
        {
            [LYRequestAPI lyricPulish:@"540398756@qq.com" client_key:client_key lyric:@"若你喜欢怪人，其实我很美" singer:@"陈奕迅" songs:@"打回原形" image:image className:nil completionBlock:^(id object, NSError *error, AFHTTPRequestOperation *operation) {
                
            }];
        }
            break;
            
        default:
            break;
    }
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
