//
//  CreateEventTableViewCell.h
//  KidsCareUI_Demo
//
//  Created by haizitong6 on 16/9/5.
//  Copyright © 2016年 haizitong6. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ClickBlock) (int row);

@interface CreateEventTableViewCell : UITableViewCell

@property(nonatomic, copy)ClickBlock clickBlock;

@end
