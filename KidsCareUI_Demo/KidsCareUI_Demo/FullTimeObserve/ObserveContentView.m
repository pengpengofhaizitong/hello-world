//
//  ObserveContentView.m
//  KidsCareUI_Demo
//
//  Created by haizitong6 on 16/9/8.
//  Copyright © 2016年 haizitong6. All rights reserved.
//

#import "ObserveContentView.h"

static ObserveContentView *sharedObj = nil; //第一步：静态实例，并初始化。

@interface ObserveContentView()
@property (weak, nonatomic) IBOutlet UILabel *spiritLabel;
@property (weak, nonatomic) IBOutlet UILabel *appetiteLabel;
@property (weak, nonatomic) IBOutlet UILabel *urinateCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *urinateStatusLabel;
@property (weak, nonatomic) IBOutlet UILabel *bowelsCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *bowelsStatusLabel;
@property (weak, nonatomic) IBOutlet UILabel *amBodyTemLabel;
@property (weak, nonatomic) IBOutlet UILabel *pmBodyTemLabel;
@property (weak, nonatomic) IBOutlet UILabel *otherSymptomsLabel;

@end

@implementation ObserveContentView

+ (ObserveContentView*) sharedInstance  //第二步：实例构造检查静态实例是否为nil
{
    @synchronized (self)
    {
        if (sharedObj == nil)
        {
        }
    }
    return sharedObj;
}

- (void)setFrame:(CGRect)rect labelText:(NSDictionary *)dic{
    self.bowelsCountLabel.text = @"7ci 7ci ";
    [self.bowelsCountLabel sizeToFit];
    NSLog(@"self.bowelsCountLabel.heigh = %f",self.bowelsCountLabel.frame.size.height);
    
    self.bowelsStatusLabel.text = @"peng";
    [self.bowelsStatusLabel sizeToFit];
    NSLog(@"self.bowel = %f",self.bowelsStatusLabel.frame.size.height);
//    NSLog(@"amBodyTemLabel = %@",self.amBodyTemLabel);
    
    self.otherSymptomsLabel.text = @"其他症状的记录，其他症状的记录其他症状的记录，其他症状的记录其他症状的记录，其他症状的记录其他症状的记录，其他症状的记录其他症状的记录，其他症状的记录其他症状的记录，其他症状的记录其他症状的记录，其他症状的记录其他症状的记录，其他症状的记录其他症状的记录，其他症状的记录其他症状的记录，其他症状的记录其他症状的记录，其他症状的记录其他症状的记录，其他症状的记录其他症状的记录，其他症状的记录其他症状的记录，";
    [self.otherSymptomsLabel sizeToFit];
    NSLog(@"self.otherSymptomsLabel = %f",self.otherSymptomsLabel.frame.size.height);
    
    if(self.otherSymptomsLabel.frame.size.height > 20){
        [self setFrame:CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, self.otherSymptomsLabel.frame.origin.y + self.otherSymptomsLabel.frame.size.height)];
    }
    
}

+ (void)calculateLabelHeight:(CGFloat)width{
    
    NSString *string = @"其他症状的记录，其他症状的记录其他症状的记录，其他症状的记录其他症状的记录，其他症状的记录其他症状的记录，其他症状的记录其他症状的记录，其他症状的记录其他症状的记录，其他症状的记录其他症状的记录，其他症状的记录其他症状的记录，其他症状的记录其他症状的记录，其他症状的记录其他症状的记录，其他症状的记录其他症状的记录，其他症状的记录其他症状的记录，其他症状的记录其他症状的记录，其他症状的记录其他症状的记录，";
    NSDictionary *attrs = @{NSFontAttributeName : [UIFont systemFontOfSize:17]};
    CGSize maxSize = CGSizeMake(width-210, MAXFLOAT);
    CGSize size = [string boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    
}

@end
