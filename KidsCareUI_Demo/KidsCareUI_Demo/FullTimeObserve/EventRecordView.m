//
//  EventRecordView.m
//  KidsCareUI_Demo
//
//  Created by haizitong6 on 16/9/8.
//  Copyright © 2016年 haizitong6. All rights reserved.
//

#import "EventRecordView.h"

@interface EventRecordView()
@property (weak, nonatomic) IBOutlet UILabel *happenTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *happenPlaceLabel;
@property (weak, nonatomic) IBOutlet UILabel *happenReasonLabel;

@end

@implementation EventRecordView

- (void)setLabelText:(NSDictionary *)dic{
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.happenReasonLabel.frame.origin.y + self.happenReasonLabel.frame.size.height)];
}

@end
