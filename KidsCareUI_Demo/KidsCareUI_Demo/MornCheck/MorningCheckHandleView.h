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


/**
 *  动画改变大小
 */
- (void)setFrame:(CGRect)frame view:(UIView*)view duration:(float)time;

/**
 *  动画改变中心
 */
- (void)setPosition:(CGPoint)position view:(UIView*)view duration:(float)time;

/**
 *  旋转动画
 */
- (void)setRotation:(float)xOffset view:(UIView*)view duration:(float)time;

/**
 *  缩放动画
 */
- (void)setScale:(float)scale view:(UIView*)view CompletionBlock:(void(^)())block duration:(float)time;


@end
