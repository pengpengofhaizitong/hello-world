//
//  MornCheckSearchTableViewCell.m
//  demo
//
//  Created by haizitong6 on 16/9/1.
//  Copyright © 2016年 w jf. All rights reserved.
//

#import "MornCheckSearchTableViewCell.h"

@interface MornCheckSearchTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *nameClassLabel;
@property (weak, nonatomic) IBOutlet UIButton *checkStatusBtn;

@end

@implementation MornCheckSearchTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setLableText:(NSDictionary *)dic{
    
}

- (IBAction)checkStatusClick:(UIButton *)sender {
    if(self.clickBlock){
        self.clickBlock(0);
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
