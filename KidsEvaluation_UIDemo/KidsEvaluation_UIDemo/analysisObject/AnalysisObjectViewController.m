
//
//  AnalysisObjectViewController.m
//  KidsEvaluation_UIDemo
//
//  Created by haizitong6 on 16/7/21.
//  Copyright © 2016年 haizitong6. All rights reserved.
//

#import "AnalysisObjectViewController.h"
#import "AnalysisObjectCollectionViewCell.h"

#define ScreenFrame self.view.frame.size

@interface AnalysisObjectViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation AnalysisObjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self drawDetailView];
}

- (void)drawDetailView{
    UICollectionView *collectionV = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, ScreenFrame.width, ScreenFrame.height)];
    collectionV.delegate = self;
    collectionV.dataSource = self;
    [self.view addSubview:collectionV];
}


#pragma mark -- UICollectionViewDelegate,UICollectionViewDataSource --
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UINib *nib = [UINib nibWithNibName:@"AnalysisObjectCollectionViewCell"
                                bundle: [NSBundle mainBundle]];
    [collectionView registerNib:nib forCellWithReuseIdentifier:@"analysisObjectCollectionViewCell"];
    AnalysisObjectCollectionViewCell *cell = [[AnalysisObjectCollectionViewCell alloc]init];
    
    // Set up the reuse identifier
    cell = [collectionView dequeueReusableCellWithReuseIdentifier: @"analysisObjectCollectionViewCell"
                                                     forIndexPath:indexPath];
    
    return cell;

}

//每个cell的frame
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake([UIScreen mainScreen].bounds.size.width/4, 60);
}
//每个cell之间的距离
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
//cell的行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);//分别为上、左、下、右
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
