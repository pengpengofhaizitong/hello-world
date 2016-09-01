//
//  MornCheckClassListTableViewCell.h
//  demo
//
//  Created by haizitong6 on 16/8/31.
//  Copyright © 2016年 w jf. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ClickBlock) (NSString *idStr);

@interface MornCheckClassListTableViewCell : UITableViewCell

- (void)setData:(NSDictionary *)dic;

@property (nonatomic, copy)ClickBlock clickBlock;

@end
