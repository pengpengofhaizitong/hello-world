//
//  FullTimeObserveStudentTableViewCell.m
//  KidsCareUI_Demo
//
//  Created by haizitong6 on 16/9/1.
//  Copyright © 2016年 haizitong6. All rights reserved.
//

#import "FullTimeObserveStudentTableViewCell.h"

@interface FullTimeObserveStudentTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *headImageV;
@end

@implementation FullTimeObserveStudentTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    _headImageV.layer.masksToBounds = YES;
    _headImageV.layer.cornerRadius = _headImageV.frame.size.width/2;
}

- (void)cellFillData:(NSDictionary *)dic{
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
