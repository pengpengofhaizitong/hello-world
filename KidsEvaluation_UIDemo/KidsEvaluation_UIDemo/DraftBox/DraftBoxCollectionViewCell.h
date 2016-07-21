//
//  DraftBoxCollectionViewCell.h
//  KidsEvaluation_UIDemo
//
//  Created by haizitong6 on 16/7/20.
//  Copyright © 2016年 haizitong6. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol DraftBoxClickViewDetailDelegate <NSObject>

- (void)clickDraftBoxDetail:(UIButton *)button;

@end

@interface DraftBoxCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (nonatomic,weak)id <DraftBoxClickViewDetailDelegate> delegate;
@end
