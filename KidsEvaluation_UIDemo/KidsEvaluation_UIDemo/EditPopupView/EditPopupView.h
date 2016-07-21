//
//  EditPopupView.h
//  KidsEvaluation_UIDemo
//
//  Created by haizitong6 on 16/7/21.
//  Copyright © 2016年 haizitong6. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^SubmitText)(NSString *text);
@interface EditPopupView : UIView

@property (nonatomic, copy) SubmitText submitText;

@end
