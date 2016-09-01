//
//  MornCheckObserveViewController.m
//  KidsCareUI_Demo
//
//  Created by haizitong6 on 16/8/30.
//  Copyright © 2016年 haizitong6. All rights reserved.
//

#import "MornCheckObserveViewController.h"

@interface MornCheckObserveViewController ()
@property (strong, nonatomic) IBOutlet UIView *detailObserveView;
@property (strong, nonatomic) IBOutlet UIView *takeMedicineView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *headImgV;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageClassLabel;


@end

@implementation MornCheckObserveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self addObserveView];
//    [self addTakeMedicineView];
}

- (void)addObserveView{
    
    self.detailObserveView.layer.masksToBounds = YES;
    self.detailObserveView.layer.cornerRadius = 5;
    self.detailObserveView.layer.borderColor = [[UIColor grayColor] CGColor];
    self.detailObserveView.layer.borderWidth = 0.5/[UIScreen mainScreen].scale;
    
    self.headImgV.layer.masksToBounds = YES;
    self.headImgV.layer.cornerRadius = self.headImgV.frame.size.width/2;
    
    self.detailObserveView.frame = CGRectMake(10, 5, [UIScreen mainScreen].bounds.size.width-20, 590);
    self.scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 600);
    [self.scrollView addSubview:self.detailObserveView];
}

- (void)addTakeMedicineView{

    self.takeMedicineView.frame = CGRectMake(10, 5, [UIScreen mainScreen].bounds.size.width-20, 280);
    self.scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 300);
    [self.scrollView addSubview:self.takeMedicineView];
    
    CALayer *layer = [self.takeMedicineView layer];
    layer.shadowOffset = CGSizeMake(4, 4);
    layer.shadowRadius = 5.0;
    layer.shadowColor = [UIColor blackColor].CGColor;
    layer.shadowOpacity = 0.5;
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
