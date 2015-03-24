//
//  LYLeftMenuTableViewController.m
//  lyric
//
//  Created by 郭天际 on 15/3/8.
//  Copyright (c) 2015年 guotianji. All rights reserved.
//

#import "LYLeftMenuTableViewController.h"
#import "SlideNavigationContorllerAnimatorFade.h"
#import "SlideNavigationContorllerAnimatorSlide.h"
#import "SlideNavigationContorllerAnimatorScale.h"
#import "SlideNavigationContorllerAnimatorScaleAndFade.h"
#import "SlideNavigationContorllerAnimatorSlideAndFade.h"

#import <SDWebImage/UIImageView+WebCache.h>
#import "LYKit.h"

@interface LYLeftMenuTableViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *avatorImageView;
@property (weak, nonatomic) IBOutlet UILabel *nickerLabel;
@property (weak, nonatomic) IBOutlet UILabel *uidLabel;
@end

@implementation LYLeftMenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.slideOutAnimationEnabled = YES;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated {
    [self updateAccountView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI and Action
- (void)updateAccountView {
    
    id object = [LYKit sharedInstance].current_user;
    if (object && [object isKindOfClass:[LYLoginModel class]]) {
        LYLoginModel *current_user = (LYLoginModel*)object;
        
        NSString *uid = [[NSUserDefaults standardUserDefaults]objectForKey:loginAccount];
        
        uid = [uid stringByReplacingOccurrencesOfString:@"@" withString:@"_"];
        uid = [uid stringByReplacingOccurrencesOfString:@"." withString:@"_"];
        NSString *image_url = [NSString stringWithFormat:@"http://52.1.180.135/lyric/img/%@.jpg",uid];
        image_url = [image_url stringByAddingPercentEscapesUsingEncoding:CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingMacChineseSimp)];
        [_avatorImageView sd_setImageWithURL:[NSURL URLWithString:image_url] placeholderImage:[UIImage imageNamed:@""] options:SDWebImageRefreshCached];
        
        NSString *nicker = [[NSUserDefaults standardUserDefaults]objectForKey:loginAccount];
            _nickerLabel.text = nicker;
            _uidLabel.text = [NSString stringWithFormat:@"lyric号：%@",uid];
    }
    else {
        _nickerLabel.text = @"未登陆";
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    UIViewController *vc ;
    
    switch (indexPath.row)
    {
        case 0: {
            vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"LYLoginViewController"];
        }
            break;
            
        case 1: {
            vc = [mainStoryboard instantiateViewControllerWithIdentifier:@""];
        }
            break;
            
        case 2: {
            vc = [mainStoryboard instantiateViewControllerWithIdentifier:@""];
        }
            break;
            
        default:
            break;
    }
    
    [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:vc
                                                             withSlideOutAnimation:self.slideOutAnimationEnabled
                                                                     andCompletion:nil];
}

@end
