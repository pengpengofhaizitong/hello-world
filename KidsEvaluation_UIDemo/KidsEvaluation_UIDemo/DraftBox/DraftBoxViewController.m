//
//  DraftBoxViewController.m
//  KidsEvaluation_UIDemo
//
//  Created by haizitong6 on 16/7/20.
//  Copyright © 2016年 haizitong6. All rights reserved.
//

#import "DraftBoxViewController.h"
#import "DraftBoxCollectionViewCell.h"

@interface DraftBoxViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,DraftBoxClickViewDetailDelegate>
@property (weak, nonatomic) IBOutlet UILabel *RecordCountLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation DraftBoxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    CGSize contentSize = _collectionView.contentSize;
    for(int i=0;i<5;i++){
        UIView *verticalLine12 = [[UIView alloc]initWithFrame:CGRectMake(contentSize.width*i/4 - 0.5, 0, 1, contentSize.height )];
        verticalLine12.backgroundColor = [UIColor lightGrayColor];//colorWithRed:225/225.0f green:227/225.0f blue:233/225.0f alpha:1.0];
        [_collectionView addSubview:verticalLine12];
    }
}

#pragma mark -- UICollectionViewDelegate,UICollectionViewDataSource --
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UINib *nib = [UINib nibWithNibName:@"DraftBoxCollectionViewCell"
                                bundle: [NSBundle mainBundle]];
    [collectionView registerNib:nib forCellWithReuseIdentifier:@"draftBoxCollectionViewCell"];
    DraftBoxCollectionViewCell *cell = [[DraftBoxCollectionViewCell alloc]init];
    
    // Set up the reuse identifier
    cell = [collectionView dequeueReusableCellWithReuseIdentifier: @"draftBoxCollectionViewCell"
                                                     forIndexPath:indexPath];
    cell.delegate = self;

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

#pragma mark -- DraftBoxClickViewDetailDelegate --
- (void)clickDraftBoxDetail:(UIButton *)button{
    UIView *superView = [button superview];
    DraftBoxCollectionViewCell *cell = (DraftBoxCollectionViewCell *)[superView superview];
    NSIndexPath *path = [_collectionView indexPathForCell:cell];
    NSLog(@"path = %ld - %ld",(long)path.section,(long)path.row);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
