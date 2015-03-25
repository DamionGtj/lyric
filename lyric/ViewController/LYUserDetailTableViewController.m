//
//  LYUserDetailTableViewController.m
//  lyric
//
//  Created by guotianji on 15/3/25.
//  Copyright (c) 2015年 guotianji. All rights reserved.
//

#import "LYUserDetailTableViewController.h"
#import "LYCameraAvailable.h"
#import <MobileCoreServices/UTCoreTypes.h>

@interface LYUserDetailTableViewController () <UIActionSheetDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *avatorImageView;
@end

@implementation LYUserDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if (section == 0) {
        return 3;
    }
    else {
        return 1;
    }
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
            {
                UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照", @"从手机相册选择", nil];
                [actionSheet showInView:self.view];
            }
                break;
            case 1:
            {
                
            }
                break;
            case 2:
            {
                
            }
                break;
                
            default:
                break;
        }
    }
    else if (indexPath.section == 1) {
        
    }
}


#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0:
        {
            [self clickToTakePhoto];
        }
            break;
        case 1:
        {
            [self clickToLibrary];
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - Photo and Library
- (void)clickToTakePhoto {
    if ([LYCameraAvailable isCameraAvailable]){
        // 初始化图片选择控制器
        UIImagePickerController *controller = [[UIImagePickerController alloc] init];
        [controller setSourceType:UIImagePickerControllerSourceTypeCamera];// 设置类型
        
        // 设置所支持的类型，设置只能拍照，或则只能录像，或者两者都可以
        NSArray *arrMediaTypes=[NSArray arrayWithObject:(__bridge NSString *)kUTTypeImage];
        [controller setMediaTypes:arrMediaTypes];
        
        // 设置录制视频的质量
        [controller setVideoQuality:UIImagePickerControllerQualityTypeHigh];
        //设置最长摄像时间
        [controller setVideoMaximumDuration:10.f];
        
        
        
        [controller setAllowsEditing:YES];// 设置是否可以管理已经存在的图片或者视频
        [controller setDelegate:self];// 设置代理
        [self.navigationController presentViewController:controller animated:YES completion:nil];
    } else {
        NSLog(@"Camera is not available.");
    }
}

- (void)clickToLibrary {
    if ([LYCameraAvailable isPhotoLibraryAvailable]){
        UIImagePickerController *controller = [[UIImagePickerController alloc] init];
        [controller setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];// 设置类型
        NSMutableArray *mediaTypes = [[NSMutableArray alloc] init];
        [mediaTypes addObject:(__bridge NSString *)kUTTypeImage];
        
        [controller setMediaTypes:mediaTypes];
        [controller setDelegate:self];// 设置代理
        [self.navigationController presentViewController:controller animated:YES completion:nil];
    }
}

// 当得到照片或者视频后，调用该方法
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    NSLog(@"Picker returned successfully.");
    NSLog(@"%@", info);
    
    [picker dismissViewControllerAnimated:YES completion:^{
        NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
        // 判断获取类型：图片
        if ([mediaType isEqualToString:( NSString *)kUTTypeImage]){
            UIImage *theImage = nil;
            // 判断，图片是否允许修改
            if ([picker allowsEditing]){
                //获取用户编辑之后的图像
                theImage = [info objectForKey:UIImagePickerControllerEditedImage];
            } else {
                // 照片的元数据参数
                theImage = [info objectForKey:UIImagePickerControllerOriginalImage];
            }
            _avatorImageView.image = theImage;
        }
    }];
}

@end
