//
//  HelpTipView.h
//  KidsCareUI_Demo
//
//  Created by haizitong6 on 16/9/2.
//  Copyright © 2016年 haizitong6. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelpTipView : UIView

/**
 *	设置父视图缩放点
 */
- (void)setViewPoint:(CGPoint)viewPoint;

/**
 *	当前view的缩放点      （anPoint）默认（0.95，0）  ->  (0<=,<=1)
 */
- (void)setLayerAnchorPoint:(CGPoint)anPoint;

/**
 *	缩小
 */
- (void)viewNnarrow;

/**
 *	还原
 */
- (void)viewReduction;

@end
