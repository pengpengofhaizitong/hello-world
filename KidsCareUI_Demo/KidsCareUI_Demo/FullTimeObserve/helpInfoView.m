//
//  helpInfoView.m
//  KidsCareUI_Demo
//
//  Created by haizitong6 on 16/9/1.
//  Copyright © 2016年 haizitong6. All rights reserved.
//

#import "helpInfoView.h"

@implementation helpInfoView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self addDetailView];
    }
    return self;
}

- (void)addDetailView{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    label.text = @"全日观察事件可由老师和保健老师创建";
    [self addSubview:label];
}

- (void)viewNnarrow{
    
}

- (void)viewReduction{
    
}

@end
