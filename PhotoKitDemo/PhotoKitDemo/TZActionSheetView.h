//
//  TZActionSheetView.h
//  PhotoKitDemo
//
//  Created by haizitong6 on 16/6/3.
//  Copyright © 2016年 haizitong6. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TZActionSheetView.h"

@protocol TZActionSheetDelegate <NSObject>

- (void)TZActionSheet:(UIView *)view clickedButtonAtIndex:(NSInteger)buttonIndex;

@end


@interface TZActionSheetView : UIView

- (void)initWithTitle:(NSString *)titleStr delegate:(id<UIActionSheetDelegate>)delegate cancelButtonTitle:(NSString *)cancelStr destructiveButtonTitle:(NSString *)specialStr
                                           otherButtonTitles:(NSArray<NSString *>*)otherBtnArr;

- (void)ShowInView:(UIView *)view;

@end
