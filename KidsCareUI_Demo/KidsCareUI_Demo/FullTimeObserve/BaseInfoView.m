//
//  BaseInfoView.m
//  KidsCareUI_Demo
//
//  Created by haizitong6 on 16/9/8.
//  Copyright © 2016年 haizitong6. All rights reserved.
//

#import "BaseInfoView.h"

@interface BaseInfoView()

@property (weak, nonatomic) IBOutlet UILabel *recordTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *recordDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *recordPeopleLabel;
@property (weak, nonatomic) IBOutlet UILabel *recordLastLabel;


@end

@implementation BaseInfoView

- (void)setLabel:(NSDictionary *)dic{
    
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.recordLastLabel.frame.origin.y + self.recordLastLabel.frame.size.height)];
    
}

@end
