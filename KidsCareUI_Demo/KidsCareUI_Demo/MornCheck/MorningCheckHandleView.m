//
//  MorningCheckHandleView.m
//  demo
//
//  Created by haizitong6 on 16/8/30.
//  Copyright © 2016年 w jf. All rights reserved.
//

#import "MorningCheckHandleView.h"
#import "YYImage.h"
#import "MornCheckObserveViewController.h"
#import "AppDelegate.h"

@interface MorningCheckHandleView()

@property (weak, nonatomic) IBOutlet UIImageView *headImageV;   //头像
@property (weak, nonatomic) IBOutlet UIImageView *peopleCountImgV;  //人数imgV
@property (weak, nonatomic) IBOutlet UILabel *peopleCountLabel;     //人数
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;            //姓名
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;            //个人信息
@property (weak, nonatomic) IBOutlet UIImageView *takeMedicineImgV; //服药imgV
@property (weak, nonatomic) IBOutlet UIImageView *observeImageV;    //观察imgV
@property (weak, nonatomic) IBOutlet UIImageView *healthImgV;       //健康imgV
@property (weak, nonatomic) IBOutlet UILabel *takeMedicineLabel;    //服药label
@property (weak, nonatomic) IBOutlet UILabel *observeLabel;         //观察label
@property (weak, nonatomic) IBOutlet UILabel *healthLabel;          //健康label

@end

@implementation MorningCheckHandleView

- (void)awakeFromNib{
//    self.peopleCountImgV.image = [YYImage imageNamed:@""];
//    self.takeMedicineImgV.image = [YYImage imageNamed:@""];
//    self.observeImageV.image = [YYImage imageNamed:@""];
//    self.headImageV.image = [YYImage imageNamed:@""];
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 5;
//
//    if(/* DISABLES CODE */ (1)){
//        self.takeMedicineLabel.textColor = [UIColor blackColor];
//        self.observeLabel.textColor = [UIColor blackColor];
//        self.healthLabel.textColor = [UIColor blackColor];
//    }else{
//        self.takeMedicineLabel.textColor = [UIColor redColor];
//        self.observeLabel.textColor = [UIColor redColor];
//        self.healthLabel.textColor = [UIColor redColor];
//    }
}

- (void)viewAssignment:(NSDictionary *)dic{
    
}

- (IBAction)takeMedicineClick:(UIButton *)sender {
    if(self.clickBlock){
        self.clickBlock(0);
    }
}

- (IBAction)observeClick:(UIButton *)sender {
    if(self.clickBlock){
        self.clickBlock(1);
    }
}

- (IBAction)healthClick:(UIButton *)sender {
    if(self.clickBlock){
        self.clickBlock(2);
    }
}



@end