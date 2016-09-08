//
//  ObserveContentView.h
//  KidsCareUI_Demo
//
//  Created by haizitong6 on 16/9/8.
//  Copyright © 2016年 haizitong6. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ObserveContentView : UIView

+ (ObserveContentView*) sharedInstance;
- (void)setFrame:(CGRect)rect labelText:(NSDictionary *)dic;
@property (weak, nonatomic) IBOutlet UILabel *sprintLabel;

@end
