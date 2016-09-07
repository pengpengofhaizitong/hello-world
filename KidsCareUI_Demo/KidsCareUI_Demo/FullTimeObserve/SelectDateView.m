//
//  SelectDateView.m
//  KidsCareUI_Demo
//
//  Created by haizitong6 on 16/9/5.
//  Copyright © 2016年 haizitong6. All rights reserved.
//

#import "SelectDateView.h"

#define ScreenWidth  [UIScreen mainScreen].bounds.size.width

@interface SelectDateView()

@property(nonatomic, strong)NSDateFormatter *dateFormatter;
@property(nonatomic, strong)NSDateFormatter *weekFormatter;
@property(nonatomic, strong)UIScrollView *scrView;

@end

@implementation SelectDateView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self createDetailView];
    }
    return self;
}

- (void)createDetailView{
    _scrView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 0)];
    _scrView.contentSize = CGSizeMake(320, 40*7);
    [_scrView setContentOffset:CGPointMake(0, 40*7)];
    for(int i=0;i<7;i++){
        NSTimeInterval secondsPerDay = -i * 24*60*60;
        NSDate *curDate = [NSDate dateWithTimeIntervalSinceNow:secondsPerDay];
        NSString *dateStr = [self.dateFormatter stringFromDate:curDate];//几月几号
        NSString *weekStr = [self.weekFormatter stringFromDate:curDate];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 40*i, ScreenWidth, 40)];
        label.text = @"2016年12月12日 星期四";
        label.backgroundColor = [UIColor redColor];
        label.text = [NSString stringWithFormat:@"%@ %@",dateStr,weekStr];
        [_scrView addSubview:label];
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 40*i, ScreenWidth, 40)];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = 10000+i;
        [_scrView addSubview:btn];
    }
    
    [self addSubview:_scrView];
}

- (void)setViewFrame:(CGRect)frame{
    if(frame.size.height == 0){
        [UIView animateWithDuration:0.5 animations:^{
            [self setFrame:frame];
            [_scrView setFrame:self.bounds];
            [_scrView setContentOffset:CGPointMake(0, 40*7)];
        }];
        [self performSelector:@selector(runLater) withObject:self afterDelay:0.5];

    }else{
        self.hidden = NO;
        [UIView animateWithDuration:0.5 animations:^{
            [self setFrame:frame];
            [_scrView setFrame:self.bounds];
            [_scrView setContentOffset:CGPointMake(0, 0)];
        }];
    }
}

- (void)runLater{
    self.hidden = YES;
}

- (void)btnClick:(UIButton *)btn{
    
}

- (NSDateFormatter *)dateFormatter{
    if(!_dateFormatter){
        _dateFormatter = [[NSDateFormatter alloc] init];
        [_dateFormatter setDateFormat:@"yyyy年MM月dd日"];
    }
    return _dateFormatter;
}

- (NSDateFormatter *)weekFormatter{
    if(!_weekFormatter){
        _weekFormatter = [[NSDateFormatter alloc] init];
        [_weekFormatter setDateFormat:@"EEEE"];//星期几 @"HH:mm 'on' EEEE MMMM d"];
    }
    return _weekFormatter;
}


@end
