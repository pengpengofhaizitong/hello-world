//
//  TZActionSheetView.m
//  PhotoKitDemo
//
//  Created by haizitong6 on 16/6/3.
//  Copyright © 2016年 haizitong6. All rights reserved.
//

#import "TZActionSheetView.h"

#define Screem_Width [UIScreen mainScreen].applicationFrame.size.width
#define cellHeigh   [UIScreen mainScreen].applicationFrame.size.height/4/3

@implementation TZActionSheetView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];// 先调用父类的initWithFrame方法
    if (self) {
        
       
        
    }
    
    return self;
}


- (void)initWithTitle:(NSString *)titleStr delegate:(id<UIActionSheetDelegate>)delegate cancelButtonTitle:(NSString *)cancelStr destructiveButtonTitle:(NSString *)specialStr
    otherButtonTitles:(NSArray<NSString *>*)otherBtnArr
{
    
    
    
    
    
}


- (void)ShowInView:(UIView *)view
{
    [view addSubview:self];
}

@end
