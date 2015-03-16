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

@interface LYPublishLyricViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


@property (strong, nonatomic) NSMutableArray *picArray;

@end

@implementation LYPublishLyricViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:RGBCOLOR(49, 182, 239)] forBarMetrics:UIBarMetricsDefault];
    
    [self.navigationItem setTitleWithTitle:@"发布歌词" color:[UIColor whiteColor]];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonClicked:)];
    
    _picArray = [[NSMutableArray alloc]initWithObjects:@"1",@"2", nil];
    
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
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UICollectionView DataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 2;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
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

@end
