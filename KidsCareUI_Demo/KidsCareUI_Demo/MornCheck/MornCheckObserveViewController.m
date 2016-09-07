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
    
    for(UIView *view in self.detailObserveView.subviews){
        if([view isKindOfClass:[UIButton class]]){
            if(view.tag > 0 && view.tag < 40){
                view.layer.masksToBounds = YES;//允许圆角
                view.layer.cornerRadius = view.frame.size.height/2;//圆角的弧度
                view.layer.borderColor = [[UIColor blackColor] CGColor];
                view.layer.borderWidth = 0.5/[UIScreen mainScreen].scale;
                UIButton *btn = (UIButton *)view;
                [btn setTitleColor:[UIColor colorWithRed:55/255.0f green:55/255.0f blue:55/255.0f alpha:1] forState:UIControlStateNormal];
                [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
            }
        }
    }
}

#pragma mark --常规指标检测--
- (IBAction)conventionalDetectionClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    if(sender.selected){
        [sender setBackgroundColor:[UIColor redColor]];
    }else{
        [sender setBackgroundColor:[UIColor whiteColor]];
    }
}

#pragma makr --异常指标检测--
- (IBAction)anomalyDetection:(UIButton *)sender {
    sender.selected = !sender.selected;
    if(sender.selected){
        [sender setBackgroundColor:[UIColor redColor]];
    }else{
        [sender setBackgroundColor:[UIColor whiteColor]];
    }
}

#pragma makr --家长带诉--
- (IBAction)parentSpeakClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    if(sender.selected){
        [sender setBackgroundColor:[UIColor redColor]];
        UIButton *btn = (UIButton *)[self.detailObserveView viewWithTag:(21+22)-sender.tag];
        [btn setBackgroundColor:[UIColor whiteColor]];
        btn.selected = NO;
    }else{
        [sender setBackgroundColor:[UIColor whiteColor]];
    }
}

#pragma mark --处理方法--
- (IBAction)handleMethodClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    if(sender.selected){
        [sender setBackgroundColor:[UIColor redColor]];
        UIButton *btn = (UIButton *)[self.detailObserveView viewWithTag:(31+32)-sender.tag];
        [btn setBackgroundColor:[UIColor whiteColor]];
        btn.selected = NO;
    }else{
        [sender setBackgroundColor:[UIColor whiteColor]];
    }

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

- (IBAction)saveClick:(UIButton *)sender {
    
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
