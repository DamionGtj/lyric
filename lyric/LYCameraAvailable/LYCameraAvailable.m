//
//  LYCameraAvailable.m
//  lyric
//
//  Created by guotianji on 15/3/25.
//  Copyright (c) 2015年 guotianji. All rights reserved.
//

#import "LYCameraAvailable.h"

@implementation LYCameraAvailable

#pragma mark - 摄像头和相册相关的公共类


// 判断设备是否有摄像头
+ (BOOL) isCameraAvailable{
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}

// 判断是否支持某种多媒体类型：拍照，视频
+ (BOOL) cameraSupportsMedia:(NSString *)paramMediaType sourceType:(UIImagePickerControllerSourceType)paramSourceType{
    __block BOOL result = NO;
    if ([paramMediaType length] == 0){
        NSLog(@"Media type is empty.");
        return NO;
    }
    NSArray *availableMediaTypes =[UIImagePickerController availableMediaTypesForSourceType:paramSourceType];
    [availableMediaTypes enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL*stop) {
        NSString *mediaType = (NSString *)obj;
        if ([mediaType isEqualToString:paramMediaType]){
            result = YES;
            *stop= YES;
        }
        
    }];
    return result;
}


#pragma mark - 相册文件选取相关
// 相册是否可用
+ (BOOL) isPhotoLibraryAvailable{
    return [UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypePhotoLibrary];
}

@end
