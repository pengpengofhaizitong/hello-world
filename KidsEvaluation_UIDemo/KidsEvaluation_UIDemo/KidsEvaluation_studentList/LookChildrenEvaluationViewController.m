//
//  LookChildrenEvaluationViewController.m
//  KidsEvaluation_UIDemo
//
//  Created by haizitong6 on 16/7/20.
//  Copyright © 2016年 haizitong6. All rights reserved.
//

#import "LookChildrenEvaluationViewController.h"

@interface LookChildrenEvaluationViewController ()
@property (weak, nonatomic) IBOutlet UIView *headView;
@property (weak, nonatomic) IBOutlet UILabel *classLabel;
@property (weak, nonatomic) IBOutlet UILabel *classNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *studentCountLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation LookChildrenEvaluationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
