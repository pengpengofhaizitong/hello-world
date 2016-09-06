//
//  FullTimeObserveReasonViewController.m
//  KidsCareUI_Demo
//
//  Created by haizitong6 on 16/9/5.
//  Copyright © 2016年 haizitong6. All rights reserved.
//

#import "FullTimeObserveReasonViewController.h"

#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height

@interface FullTimeObserveReasonViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation FullTimeObserveReasonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)createDetailView{
    UIView *searchTfBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, 40)];
    searchTfBgView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:searchTfBgView];
    
    UITextField *tf = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth - 120, 40)];
    tf.backgroundColor = [UIColor yellowColor];
    tf.placeholder = @"添加一个新的观察原因，10个字以内";
    [searchTfBgView addSubview:tf];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth - 90, 0, 60, 40)];
    [btn setTitle:@"添加" forState:UIControlStateNormal];
    [searchTfBgView addSubview:btn];
    
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 104, ScreenWidth, ScreenHeight - 104)];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [self.view addSubview:collectionView];
}

#pragma mark -- UICollectionViewDelegate,UICollectionViewDataSource --
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [[UICollectionViewCell alloc]init];
    // Set up the reuse identifier
    cell = [collectionView dequeueReusableCellWithReuseIdentifier: @"oberveReasionCollectionViewCell"
                                                     forIndexPath:indexPath];
    
    return cell;
}
//每个cell的frame
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake([UIScreen mainScreen].bounds.size.width/2, 100);
}
//每个cell之间的距离
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
//cell的行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);//分别为上、左、下、右
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    imgV.backgroundColor = [UIColor orangeColor];
    
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    [cell.contentView addSubview:imgV];
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

@end
