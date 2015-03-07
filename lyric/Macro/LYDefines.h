//
//  LYDefines.h
//  lyric
//
//  Created by guotianji on 15/3/7.
//  Copyright (c) 2015年 guotianji. All rights reserved.
//

//系统版本定义
#define IS_OS_7_OR_LATER [[[UIDevice currentDevice]systemVersion]floatValue ]>= 7.0

#define TopBarHeight 40.0f

#define NavigationBarHeightWithoutStatusBar 44.0f

//#define NavigationBarHeight 64.0f

//#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

//#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

//常量
#pragma mark - Constant

//财通券商ID
extern NSString *const kBrokerIDCT;
//浙商
extern NSString *const kBrokerIDZS;
//财富
extern NSString *const kBrokerIDCF;
//大同
extern NSString *const kBrokerIDDT;
//东吴
extern NSString *const kBrokerIDDW;

//请求URL的域名，测试地址和正式地址就在这里修改
extern NSString *const kBaseUrl;

//数据库名字
extern NSString *const kDBFileName;

//服务器返回错误名称key
extern NSString *const kServerErrorNumber;

//服务器返回的错误信息的key
extern NSString *const kServerErrorInfo;

//错误domain
extern NSString *const kStockAccountErrorDomain;

//Post请求的类型，action
extern NSString *const kRequestAction;

//cookies
extern NSString *const kCookies;

//配置文件key
extern NSString *const kRouterController;
extern NSString *const kMessageInfo;
extern NSString *const kBackControllerRouterKey;
extern NSString *const kIndex;

//图片key
extern NSString *const kFrontImageID;
extern NSString *const kBackImageID;
extern NSString *const kFaceImageID;


//错误提示信息
extern NSString *const kQueryAnychatVideoPortErro;

//认证类型
typedef NS_ENUM(NSInteger , SAAuthenticationType) {
    //开户
    SAAuthenticationTypeAccountCreate = 1,
    //转户
    SAAuthenticationTypeAccountTransfer =3,
};

//拍照类型
typedef NS_ENUM(NSInteger , SAPictureType)
{
    //身份证正面
    SAPictureTypeFrontIdentityCard = 0,
    SAPictureTypeBackIdentityCard = 1,
    SAPictureTypeFacingHead = 2,
    
};

//证书类型（自建证书、中登证书）
typedef NS_ENUM(NSInteger , SACertType) {
    SACertTypeOwner = 0,
    SACertTypeZhongdeng = 1,
};
