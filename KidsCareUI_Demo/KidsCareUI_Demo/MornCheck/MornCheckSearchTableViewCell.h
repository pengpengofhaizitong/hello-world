//
//  MornCheckSearchTableViewCell.h
//  demo
//
//  Created by haizitong6 on 16/9/1.
//  Copyright © 2016年 w jf. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ClickBlock) (int row);

@interface MornCheckSearchTableViewCell : UITableViewCell

- (void)setLableText:(NSDictionary *)dic;

@property(nonatomic, copy)ClickBlock clickBlock;

@end
