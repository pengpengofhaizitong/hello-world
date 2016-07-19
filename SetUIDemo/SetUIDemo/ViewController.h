//
//  ViewController.h
//  SetUIDemo
//
//  Created by haizitong6 on 16/6/6.
//  Copyright © 2016年 haizitong6. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (strong, nonatomic) IBOutlet UIView *textview;
@property (weak, nonatomic) IBOutlet UIButton *tabkePhoto;

@end

