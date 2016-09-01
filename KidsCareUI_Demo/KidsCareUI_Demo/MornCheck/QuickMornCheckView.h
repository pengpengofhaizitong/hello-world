//
//  QuickMornCheckView.h
//  demo
//
//  Created by haizitong6 on 16/8/31.
//  Copyright © 2016年 w jf. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ClickBlock) (int type);

@interface QuickMornCheckView : UIView

- (void)adjustView;

- (void)setViewFrame:(CGRect)rect isShowDetermineBtn:(BOOL)show viewAssignment:(NSDictionary *)dic;

@property (nonatomic, copy)ClickBlock clickBlock;

@end
