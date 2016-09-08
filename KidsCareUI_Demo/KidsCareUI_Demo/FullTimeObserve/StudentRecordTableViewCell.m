//
//  StudentRecordTableViewCell.m
//  KidsCareUI_Demo
//
//  Created by haizitong6 on 16/9/8.
//  Copyright © 2016年 haizitong6. All rights reserved.
//

#import "StudentRecordTableViewCell.h"
#import "ObserveContentView.h"

@interface StudentRecordTableViewCell()
@property (weak, nonatomic) IBOutlet UIView *upLineView;
@property (weak, nonatomic) IBOutlet UIView *downLineView;
@property (weak, nonatomic) IBOutlet UIView *markView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIView *detailContentView;

@end

@implementation StudentRecordTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)addDetailView{
    ObserveContentView *view = [[[NSBundle mainBundle] loadNibNamed:@"ObserveContentView" owner:self options:nil] lastObject];
    [view setFrame:CGRectMake(0, 0, self.detailContentView.frame.size.width, 40) labelText:nil];
    [self.detailContentView addSubview:view];

    self.frame = CGRectMake(0, 0, self.frame.size.width, view.frame.size.height);
}

+ (CGFloat)calculateCellHeight{
    
    ObserveContentView *view = [[[NSBundle mainBundle] loadNibNamed:@"ObserveContentView" owner:self options:nil] lastObject];
    [view setFrame:CGRectMake(0, 0, 480, 40) labelText:nil];
    return view.frame.size.height;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
