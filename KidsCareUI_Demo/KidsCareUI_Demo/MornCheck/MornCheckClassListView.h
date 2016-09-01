//
//  MornCheckClassListView.h
//  demo
//
//  Created by haizitong6 on 16/8/31.
//  Copyright © 2016年 w jf. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^SelectBlcok) (int row);

@interface MornCheckClassListView : UIView

@property (nonatomic, copy) SelectBlcok selectBlock;

@end
