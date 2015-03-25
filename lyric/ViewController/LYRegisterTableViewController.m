//
//  LYRegisterTableViewController.m
//  lyric
//
//  Created by 郭天际 on 15/3/8.
//  Copyright (c) 2015年 guotianji. All rights reserved.
//

#import "LYRegisterTableViewController.h"
#import "UIImage+Utility.h"
#import "KTAlert.h"
#import "ReactiveCocoa.h"
#import "LYRequestAPI.h"
#import "LYRegisterModel.h"
#import "ALDAlertViewController.h"
#import <MobileCoreServices/UTCoreTypes.h>
#import "LYCameraAvailable.h"


@interface LYRegisterTableViewController () <UITextFieldDelegate, UIGestureRecognizerDelegate, UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UITextField *nickerTextField;
@property (weak, nonatomic) IBOutlet UITextField *accountTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
- (IBAction)clickedRegister:(id)sender;

@property (nonatomic, strong) LYRegisterModel *registerModel;

@end

@implementation LYRegisterTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:RGBCOLOR(49, 182, 239)] forBarMetrics:UIBarMetricsDefault];
    
    [self.navigationItem setTitleWithTitle:@"注册" color:[UIColor whiteColor]];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonClicked:)];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapHeaderImageView)];
    [_headerImageView addGestureRecognizer:tap];
    
    RAC(_registerBtn,enabled) = [RACSignal
                              combineLatest:@[self.nickerTextField.rac_textSignal,self.accountTextField.rac_textSignal,self.passwordTextField.rac_textSignal]
                              reduce:^(NSString* nicker,NSString *account, NSString *password){
                                  return @(nicker.length >0 && account.length > 0 && password.length > 0);
                              }];
    
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
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark - UI and Action
- (IBAction)clickedRegister:(id)sender {
    [LYRequestAPI lyricRegister:_accountTextField.text user_Name:_nickerTextField.text user_Password:_passwordTextField.text user_Image:_headerImageView.image className:@"LYRegisterModel" completionBlock:^(id object, NSError *error, AFHTTPRequestOperation *operation) {
        if (object && [object isKindOfClass:[LYRegisterModel class]]) {
            self.registerModel = (LYRegisterModel*)object;
            [self analysisData];
        }
    }];
}

- (void)analysisData {
    if (self.registerModel.code != 1) {
        [KTAlert showAlert:KTAlertTypeToast withMessage:self.registerModel.message andDuration:1500];
    }
    else {
        [ALDAlertViewController creatAlertViewWithTitle:@"提示" message:@"注册成功，您的邮箱或电话即为您的用户名" viewController:self cancelItemTitle:@"确定" ortherItemTitle:nil cancelAction:^{
            [[NSUserDefaults standardUserDefaults]setObject:_accountTextField.text forKey:loginAccount];
            [[NSUserDefaults standardUserDefaults]synchronize];
            [self leftBarButtonClicked:nil];
        } ortherAction:^{
            
        }];
    }
}

- (void)leftBarButtonClicked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)tapHeaderImageView {
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照", @"从手机相册选择", nil];
    [actionSheet showInView:self.view];
}

#pragma mark - InputCheck
- (BOOL)isInputLegal {
    if (_nickerTextField.text.length == 0) {
        [KTAlert showAlert:KTAlertTypeToast withMessage:@"昵称不能为空" andDuration:1500];
        return NO;
    }
    else if (_accountTextField.text.length == 0) {
        [KTAlert showAlert:KTAlertTypeToast withMessage:@"登录名不能为空" andDuration:1500];
        return NO;
    }
    else if (_passwordTextField.text.length == 0) {
        [KTAlert showAlert:KTAlertTypeToast withMessage:@"密码不能为空" andDuration:1500];
        return NO;
    }
    return YES;
}

#pragma mark - UITextFieldDelegate
- (void)textFieldDidEndEditing:(UITextField *)textField {
    [_nickerTextField resignFirstResponder];
    [_accountTextField resignFirstResponder];
    [_passwordTextField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == _nickerTextField) {
        [_nickerTextField resignFirstResponder];
    }
    else if (textField == _accountTextField) {
        [_accountTextField resignFirstResponder];
    }
    else if (textField == _passwordTextField) {
        [_passwordTextField resignFirstResponder];
    }
    return YES;
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
            _headerImageView.image = theImage;
        }
    }];
}


@end
