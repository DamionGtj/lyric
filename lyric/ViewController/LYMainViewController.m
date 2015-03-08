//
//  LYMainViewController.m
//  lyric
//
//  Created by 郭天际 on 15/3/8.
//  Copyright (c) 2015年 guotianji. All rights reserved.
//

#import "LYMainViewController.h"

@interface LYMainViewController ()

@end

@implementation LYMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

/*----------------------------------------------------*/
#pragma mark - Overriden Methods -
/*----------------------------------------------------*/

- (NSString *)segueIdentifierForIndexPathInLeftMenu:(NSIndexPath *)indexPath
{
    NSString *identifier = @"";
    switch (indexPath.row) {
        case 0:
            identifier = @"firstRow";
            break;
        case 1:
            identifier = @"secondRow";
            break;
    }
    
    return identifier;
}

/**
 * NOTE! If you override this method, then segueIdentifierForIndexPathInLeftMenu will be ignored
 * Return instantiated navigation controller that will opened
 * when cell at indexPath will be selected from left menu
 * @param indexPath of left menu table
 * @return UINavigationController instance for input indexPath
 */
/*
 - (UINavigationController *)navigationControllerForIndexPathInLeftMenu:(NSIndexPath *)indexPath
 {
 NSString *storyboardId = @"";
 
 switch (indexPath.row) {
 case 0:
 storyboardId = @"FirstNC";
 break;
 case 1:
 storyboardId = @"SecondNC";
 break;
 }
 
 UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
 UINavigationController *nc = [storyboard instantiateViewControllerWithIdentifier:storyboardId];
 return nc;
 }
 */



- (CGFloat)leftMenuWidth
{
    return 250;
}

- (void)configureLeftMenuButton:(UIButton *)button
{
    CGRect frame = button.frame;
    frame = CGRectMake(0, 0, 25, 13);
    button.frame = frame;
    button.backgroundColor = [UIColor clearColor];
    [button setImage:[UIImage imageNamed:@"simpleMenuButton"] forState:UIControlStateNormal];
}

- (void) configureSlideLayer:(CALayer *)layer
{
    layer.shadowColor = [UIColor blackColor].CGColor;
    layer.shadowOpacity = 1;
    layer.shadowOffset = CGSizeMake(0, 0);
    layer.shadowRadius = 5;
    layer.masksToBounds = NO;
    layer.shadowPath =[UIBezierPath bezierPathWithRect:self.view.layer.bounds].CGPath;
}

- (UIViewAnimationOptions) openAnimationCurve {
    return UIViewAnimationOptionCurveEaseOut;
}

- (UIViewAnimationOptions) closeAnimationCurve {
    return UIViewAnimationOptionCurveEaseOut;
}

- (AMPrimaryMenu)primaryMenu
{
    return AMPrimaryMenuLeft;
}


// Enabling Deepnes on left menu
- (BOOL)deepnessForLeftMenu
{
    return YES;
}

// Enabling darkness while left menu is opening
- (CGFloat)maxDarknessWhileLeftMenu
{
    return 0.5;
}

@end
