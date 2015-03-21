//
//  Macro.h
//  lyric
//
//  Created by guotianji on 15/1/26.
//  Copyright (c) 2015年 guotianji. All rights reserved.
//

#ifndef lyric_Macro_h
#define lyric_Macro_h

#pragma mark ---- G－C－D
#define BACK(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define MAIN(block) dispatch_async(dispatch_get_main_queue(),block)

#pragma mark - 颜色

#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define HEXCOLOR(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define SCREEN_HEIGHT [[UIScreen mainScreen] applicationFrame].size.height
#define SCREEN_WIDTH  [[UIScreen mainScreen] applicationFrame].size.width
#define StatusbarHeight ((iOS7 && __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1)?20.f:0.f)
#define NavigationBarHeight 44

#pragma mark ---- File  functions
#define PATH_OF_APP_HOME    NSHomeDirectory()
#define PATH_OF_TEMP        NSTemporaryDirectory()
#define PATH_OF_DOCUMENT    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

#define iOS7 ([[[UIDevice currentDevice]systemVersion] floatValue] >= 7.0 && [[[UIDevice currentDevice]systemVersion] floatValue] < 8)?YES:NO
#define iOS8 ([[[UIDevice currentDevice]systemVersion] floatValue] >= 8.0)?YES:NO
#define Over_iOS7 ([[[UIDevice currentDevice]systemVersion] floatValue] >= 7.0)?YES:NO

#define iPhone6P (([[UIScreen mainScreen] bounds].size.height)>=736)
#define iPhone6 (([[UIScreen mainScreen] bounds].size.height)>=667)
#define iPhone5 (([[UIScreen mainScreen] bounds].size.height)>=568)
#define iPhone4 (([[UIScreen mainScreen] bounds].size.height)>=480)



#define loginAccount @"loginAccount"
#define clientKey   @"client_key"
#define loginPassword @"loginPassword"

#endif
