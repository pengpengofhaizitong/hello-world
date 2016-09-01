//
//  ClassMemberTableViewCell.m
//  demo
//
//  Created by haizitong6 on 16/8/31.
//  Copyright © 2016年 w jf. All rights reserved.
//

#import "ClassMemberTableViewCell.h"

@interface ClassMemberTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *headImgV;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *medicBtn;
@property (weak, nonatomic) IBOutlet UIButton *observeBtn;
@property (weak, nonatomic) IBOutlet UIButton *healthBtn;

@end

@implementation ClassMemberTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (IBAction)medicBtnClick:(UIButton *)sender {
    
}

- (IBAction)observeClick:(UIButton *)sender {
    
}

- (IBAction)healthClick:(UIButton *)sender {
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
