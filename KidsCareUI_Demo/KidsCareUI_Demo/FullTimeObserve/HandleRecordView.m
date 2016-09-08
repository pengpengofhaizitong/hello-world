//
//  HandleRecordView.m
//  KidsCareUI_Demo
//
//  Created by haizitong6 on 16/9/8.
//  Copyright © 2016年 haizitong6. All rights reserved.
//

#import "HandleRecordView.h"

@interface HandleRecordView()
@property (weak, nonatomic) IBOutlet UILabel *handleLabel;
@property (weak, nonatomic) IBOutlet UILabel *beginObeTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastObeTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *leaveTimeLabel;

@end

@implementation HandleRecordView


- (void)setLabelText:(NSDictionary *)dic{
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.leaveTimeLabel.frame.origin.y + self.leaveTimeLabel.frame.size.height)];
}


@end
