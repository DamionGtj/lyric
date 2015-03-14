//
//  ALDAlertViewController.m
//  eDuShi
//
//  Created by guotianji on 14/12/30.
//  Copyright (c) 2014年 aladdin. All rights reserved.
//

#import "ALDAlertViewController.h"
#import "RIAlterController.h"
#import "AppDelegate.h"

@implementation ALDAlertViewController

+(void)creatAlertViewWithTitle:(NSString *)title message:(NSString *)message viewController:(UIViewController *)viewController cancelItemTitle:(NSString *)cancel ortherItemTitle: (NSString *)ortherTitle cancelAction:(void(^)(void))cancelAction ortherAction:(void(^)(void))otherAction
{
    RIAlterController *alertView = [[RIAlterController alloc] initWithTitle:title message:message viewController:viewController];
    
    if (cancel)
    {
        RIButtonItem *cancelItem = [RIButtonItem itemWithLabel:cancel action:^{
            cancelAction();
            
        }];
        
        [alertView addButton:cancelItem type:RIButtonItemType_Cancel];
    }
    if(ortherTitle)
    {
        RIButtonItem *okItem = [RIButtonItem itemWithLabel:ortherTitle action:^{
            otherAction();
            
        }];
        [alertView addButton:okItem type:RIButtonItemType_Other];
        
    }
    
    [alertView show];
}

@end
