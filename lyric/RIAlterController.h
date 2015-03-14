//
//  ALDAlterController.h
//  eDuShi
//
//  Created by lsw on 14-12-4.
//  Copyright (c) 2014年 Aladdin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RIButtonItem.h"


typedef enum {
    RIButtonItemType_Cancel         = 1,
    RIButtonItemType_Destructive       ,
    RIButtonItemType_Other
}RIButtonItemType;

typedef enum {
    ALDAlertControllerType_AlertView    = 1,
    ALDAlertControllerType_ActionSheet
}ALDAlertControllerType;

@interface RIAlterController : NSObject



- (id)initWithTitle:(NSString *)title message:(NSString *)message viewController:(UIViewController *)inViewController;
- (void)addButton:(RIButtonItem *)button type:(RIButtonItemType)itemType;

//Show ActionSheet in all versions
- (void)showInView:(UIView *)view;

//Show AlertView in all versions
- (void)show;

@end
