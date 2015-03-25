//
//  LYCameraAvailable.h
//  lyric
//
//  Created by guotianji on 15/3/25.
//  Copyright (c) 2015年 guotianji. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYCameraAvailable : NSObject

// 判断设备是否有摄像头
+ (BOOL) isCameraAvailable;

// 判断是否支持某种多媒体类型：拍照，视频
+ (BOOL) cameraSupportsMedia:(NSString *)paramMediaType sourceType:(UIImagePickerControllerSourceType)paramSourceType;


#pragma mark - 相册文件选取相关
// 相册是否可用
+ (BOOL) isPhotoLibraryAvailable;

@end
