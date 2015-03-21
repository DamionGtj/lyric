//
//  LYPublishLyricViewController.m
//  lyric
//
//  Created by guotianji on 15/3/14.
//  Copyright (c) 2015年 guotianji. All rights reserved.
//

#import "LYPublishLyricViewController.h"
#import "UIImage+Utility.h"
#import "LYPublishLyricCollectionViewCell.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "LYRequestAPI.h"
#import "KTAlert.h"

@interface LYPublishLyricViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (weak, nonatomic) IBOutlet UITextView *lyricTextView;
@property (weak, nonatomic) IBOutlet UITextField *singerTextField;
@property (weak, nonatomic) IBOutlet UITextField *songTextField;

@property (strong, nonatomic) NSMutableArray *picArray;

@end

@implementation LYPublishLyricViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:RGBCOLOR(49, 182, 239)] forBarMetrics:UIBarMetricsDefault];
    
    [self.navigationItem setTitleWithTitle:@"发布歌词" color:[UIColor whiteColor]];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonClicked:)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonClicked:)];
    
    RAC(self.navigationItem.rightBarButtonItem,enabled) = [RACSignal
                              combineLatest:@[self.lyricTextView.rac_textSignal,self.singerTextField.rac_textSignal,self.songTextField.rac_textSignal]
                              reduce:^(NSString *lyric, NSString *singer, NSString *song){
                                  return @(lyric.length > 0 && singer.length > 0 && song.length > 0);
                              }];
    
    
    _picArray = [[NSMutableArray alloc]initWithObjects:@"add", nil];
    
    [_collectionView registerClass:[LYPublishLyricCollectionViewCell class] forCellWithReuseIdentifier:@"LYPublishLyricCollectionViewCell"];
    [_collectionView registerClass:[LYPublishAddCollectionViewCell class] forCellWithReuseIdentifier:@"LYPublishAddCollectionViewCell"];
    [_collectionView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UI and Action
- (void)leftBarButtonClicked:(id)sender {
    
    [_lyricTextView resignFirstResponder];
    [_songTextField resignFirstResponder];
    [_singerTextField resignFirstResponder];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)rightBarButtonClicked:(id)sender {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSString *account = [userDefaults objectForKey:loginAccount];
    NSString *client_key = [userDefaults objectForKey:clientKey];
    NSString *lyric = _lyricTextView.text;
    NSString *singer = _singerTextField.text;
    NSString *song = _songTextField.text;
    
    UIImage *image = [UIImage imageNamed:@"hahah"];
    [LYRequestAPI lyricPulish:account client_key:client_key lyric:lyric singer:singer songs:song image:image className:nil completionBlock:^(id object, NSError *error, AFHTTPRequestOperation *operation) {
        if (object && [object isKindOfClass:[NSDictionary class]]) {
            NSDictionary *result = (NSDictionary*)object;
            if ([result[@"code"] longValue] == 1) {
                [self dismissViewControllerAnimated:YES completion:^{
                    [KTAlert showAlert:KTAlertTypeToast withMessage:@"上传成功" andDuration:1500];
                }];
            }
            else {
                [KTAlert showAlert:KTAlertTypeToast withMessage:result[@"message"] andDuration:1500];
            }
        }
        else if (error) {
            [KTAlert showAlert:KTAlertTypeToast withMessage:@"上传失败" andDuration:1500];
        }
    }];
}


#pragma mark - UICollectionView DataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _picArray.count + 1;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (_picArray.count != 0 && indexPath.row < _picArray.count) {
        static NSString * CellIdentifier = @"LYPublishLyricCollectionViewCell";
        LYPublishLyricCollectionViewCell *cell = (LYPublishLyricCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
        if (!cell) {
            
        }
        return cell;
    }
    else if (indexPath.row == 1) {
        static NSString * CellIdentifier = @"LYPublishAddCollectionViewCell";
        LYPublishAddCollectionViewCell *cell = (LYPublishAddCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
        return cell;
    }
    return nil;
}

#pragma mark - UITextFieldDelegate && UITextViewDelegate
- (void)textFieldDidEndEditing:(UITextField *)textField {
    [_singerTextField resignFirstResponder];
    [_songTextField resignFirstResponder];
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    [_lyricTextView resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == _singerTextField) {
        [_singerTextField resignFirstResponder];
    }
    else if (textField == _songTextField) {
        [_songTextField resignFirstResponder];
    }
    return YES;
}

@end
