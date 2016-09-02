//
//  HelpTipView.m
//  KidsCareUI_Demo
//
//  Created by haizitong6 on 16/9/2.
//  Copyright © 2016年 haizitong6. All rights reserved.
//

#import "HelpTipView.h"

@implementation HelpTipView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self addDetailView];
        self.layer.anchorPoint = CGPointMake(0.95, 0);
        self.transform = CGAffineTransformMakeScale(0.01, 0.01);
        self.hidden = YES;
    }
    return self;
}

- (void)addDetailView{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    label.text = @"全日观察事件可由老师和保健老师创建";
    [self addSubview:label];
}

- (void)viewNnarrow{
    __weak typeof(self)weakSelf = self;
    [UIView animateWithDuration:0.3 animations:^{
        weakSelf.transform = CGAffineTransformMakeScale(0.01, 0.01);
    }];
    [self performSelector:@selector(runLater) withObject:self afterDelay:0.3];
}

- (void)viewReduction{
    self.hidden = NO;
    __weak typeof(self)weakSelf = self;
    [UIView animateWithDuration:0.3 animations:^{
        weakSelf.transform = CGAffineTransformMakeScale(1, 1);
    }];
}

- (void)runLater{
    self.hidden = YES;
}

- (void)setViewPoint:(CGPoint)viewPoint{
    self.center = viewPoint;
}

- (void)setLayerAnchorPoint:(CGPoint)anPoint{
    self.layer.anchorPoint = anPoint;
}


@end
