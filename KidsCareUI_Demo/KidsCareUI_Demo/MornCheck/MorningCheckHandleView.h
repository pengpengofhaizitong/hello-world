//
//  MorningCheckHandleView.h
//  demo
//
//  Created by haizitong6 on 16/8/30.
//  Copyright © 2016年 w jf. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ClickBlock) (int type);

@interface MorningCheckHandleView : UIView

@property (nonatomic, copy)ClickBlock clickBlock;

- (void)viewAssignment:(NSDictionary *)dic;

@end
