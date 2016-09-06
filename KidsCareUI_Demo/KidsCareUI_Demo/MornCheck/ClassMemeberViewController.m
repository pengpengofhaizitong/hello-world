//
//  ClassMemeberViewController.m
//  KidsCareUI_Demo
//
//  Created by haizitong6 on 16/9/6.
//  Copyright © 2016年 haizitong6. All rights reserved.
//

#import "ClassMemeberViewController.h"
#import "ClassMemberCollectionViewCell.h"

@interface ClassMemeberViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ClassMemeberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UINib *nib = [UINib nibWithNibName:@"ClassMemberCollectionViewCell" bundle: [NSBundle mainBundle]];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:@"classMemberCollectionViewCell"];
}


#pragma mark -- UICollectionViewDelegate,UICollectionViewDataSource --
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
//    ClassMemberCollectionViewCell *cell = [[ClassMemberCollectionViewCell alloc]init];
    // Set up the reuse identifier
    ClassMemberCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: @"classMemberCollectionViewCell"
                                                     forIndexPath:indexPath];
    return cell;
}
//每个cell的frame
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake([UIScreen mainScreen].bounds.size.width/4, 100);
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

- (IBAction)healthClick:(UIButton *)sender {
    
}

- (IBAction)medicineClick:(UIButton *)sender {
    
}

- (IBAction)observeClick:(UIButton *)sender {
    
}

- (IBAction)againstSelectClick:(UIButton *)sender {
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
