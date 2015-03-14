//
//  ALDAlterController.m
//  eDuShi
//
//  Created by lsw on 14-12-4.
//  Copyright (c) 2014年 Aladdin. All rights reserved.
//

#import "RIAlterController.h"
#import "UIActionSheet+Blocks.h"
#import "UIAlertView+Blocks.h"

@interface RIAlterController()

@property (nonatomic, strong) NSString              *title;
@property (nonatomic, strong) NSString              *message;
@property (nonatomic, weak) UIViewController        *inViewController;
@property (nonatomic, strong) NSMutableDictionary   *buttonInfoDict;
@property (nonatomic, strong) UIAlertController *alertController;
@end
@implementation RIAlterController
- (id)initWithTitle:(NSString *)title message:(NSString *)message viewController:(UIViewController *)inViewController
{
    if (self = [super init]) {
        self.title = title;
        self.message = message;
        self.inViewController = inViewController;
    }
    return self;
}

- (NSMutableDictionary *)buttonInfoDict
{
    if (_buttonInfoDict == nil) {
        _buttonInfoDict = [NSMutableDictionary dictionary];
    }
    return _buttonInfoDict;
}

- (void)addButton:(RIButtonItem *)button type:(RIButtonItemType)itemType
{
    if (button == nil || ![button isKindOfClass:[RIButtonItem class]]) {
        return;
    }
    switch (itemType) {
        case RIButtonItemType_Cancel:
        {
            [self.buttonInfoDict setObject:button forKey:@"RIButtonItemType_Cancel"];
        }
            break;
        case RIButtonItemType_Destructive:
        {
            [self.buttonInfoDict setObject:button forKey:@"RIButtonItemType_Destructive"];
        }
            break;
        case RIButtonItemType_Other:
        {
            NSMutableArray *otherArray = self.buttonInfoDict[@"RIButtonItemType_Other"];
            if (otherArray == nil) {
                otherArray = [NSMutableArray array];
            }
            [otherArray addObject:button];
            [self.buttonInfoDict setObject:otherArray forKey:@"RIButtonItemType_Other"];
        }
            break;
            
        default:
            break;
    }
}

- (void)showInView:(UIView *)view
{
    if (iOS8) {
        [self showIOS8ViewWithType:ALDAlertControllerType_ActionSheet];
        
    } else {
        [self ios7showInView:view];
    }
}

- (void)show
{
    if (iOS8) {
        [self showIOS8ViewWithType:ALDAlertControllerType_AlertView];
        
    } else {
        [self ios7Show];
    }
}

- (void)showIOS8ViewWithType:(ALDAlertControllerType)viewType
{
    if (self.inViewController == nil) {
        return;
    }
    
    self.alertController = nil;
    switch (viewType) {
        case ALDAlertControllerType_AlertView:
        {
            self.alertController = [UIAlertController alertControllerWithTitle:self.title message:self.message preferredStyle:UIAlertControllerStyleAlert];
        }
            break;
        case ALDAlertControllerType_ActionSheet:
        {
            self.alertController = [UIAlertController alertControllerWithTitle:self.title message:self.message preferredStyle:UIAlertControllerStyleActionSheet];
        }
            break;
            
        default:
            break;
    }
    
    RIButtonItem *cancelItem = self.buttonInfoDict[@"RIButtonItemType_Cancel"];
    if (cancelItem != nil) {
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelItem.label style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            cancelItem.action();
        }];
        [self.alertController addAction:cancelAction];
    }
    
    RIButtonItem *destructiveItem = self.buttonInfoDict[@"RIButtonItemType_Destructive"];
    if (destructiveItem != nil) {
        UIAlertAction *destructiveAction = [UIAlertAction actionWithTitle:cancelItem.label style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
            destructiveItem.action();
        }];
        [self.alertController addAction:destructiveAction];
    }
    
    NSArray *otherItems = self.buttonInfoDict[@"RIButtonItemType_Other"];
    if (otherItems != nil && otherItems.count > 0) {
        for (RIButtonItem *buttonItem in otherItems) {
            UIAlertAction *otherAction = [UIAlertAction actionWithTitle:buttonItem.label style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                buttonItem.action();
            }];
            [self.alertController addAction:otherAction];
        }
    }
    
    [self performSelectorOnMainThread:@selector(presentViewController) withObject:nil waitUntilDone:YES];

}
- (void)presentViewController
{
    [self.inViewController presentViewController:self.alertController
                                        animated:YES completion:^{
                                            
                                        }];
}

- (void)ios7showInView:(UIView *)view
{
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:self.title cancelButtonItem:self.buttonInfoDict[@"RIButtonItemType_Cancel"] destructiveButtonItem:self.buttonInfoDict[@"RIButtonItemType_Destructive"] otherButtonItems: nil];
    
    NSArray *otherItems = self.buttonInfoDict[@"RIButtonItemType_Other"];
    if (otherItems != nil && otherItems.count > 0) {
        for (RIButtonItem *buttonItem in otherItems) {
            [actionSheet addButtonItem:buttonItem];
        }
    }
    [actionSheet showInView:view];
}

- (void)ios7Show
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:self.title message:self.message cancelButtonItem:self.buttonInfoDict[@"RIButtonItemType_Cancel"] otherButtonItems:nil];
    
    RIButtonItem *destructiveItem = self.buttonInfoDict[@"RIButtonItemType_Destructive"];
    if (destructiveItem != nil) {
        [alertView addButtonItem:destructiveItem];
    }
    
    NSArray *otherItems = self.buttonInfoDict[@"RIButtonItemType_Other"];
    if (otherItems != nil && otherItems.count > 0) {
        for (RIButtonItem *buttonItem in otherItems) {
            [alertView addButtonItem:buttonItem];
        }
    }
    
    [alertView show];
}

@end
