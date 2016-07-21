//
//  DraftBoxCollectionViewCell.m
//  KidsEvaluation_UIDemo
//
//  Created by haizitong6 on 16/7/20.
//  Copyright © 2016年 haizitong6. All rights reserved.
//

#import "DraftBoxCollectionViewCell.h"

@implementation DraftBoxCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self drawWireFrames];
}

- (void)drawWireFrames{
    self.layer.borderColor = [[UIColor grayColor] CGColor];
    self.layer.borderWidth = 0.5;
}

- (IBAction)ViewDetailClick:(UIButton *)sender {
    NSLog(@"sender-%@",self);
    [self.delegate clickDraftBoxDetail:sender];
}

@end
