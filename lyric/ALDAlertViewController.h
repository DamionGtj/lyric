//
//  ALDAlertViewController.h
//  eDuShi
//
//  Created by guotianji on 14/12/30.
//  Copyright (c) 2014年 aladdin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ALDAlertViewController : NSObject

+(void)creatAlertViewWithTitle:(NSString *)title message:(NSString *)message viewController:(UIViewController *)viewController cancelItemTitle:(NSString *)cancel ortherItemTitle: (NSString *)ortherTitle cancelAction:(void(^)(void))cancelAction ortherAction:(void(^)(void))otherAction;

@end
