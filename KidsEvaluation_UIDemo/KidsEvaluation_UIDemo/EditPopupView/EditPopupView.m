//
//  EditPopupView.m
//  KidsEvaluation_UIDemo
//
//  Created by haizitong6 on 16/7/21.
//  Copyright © 2016年 haizitong6. All rights reserved.
//

#import "EditPopupView.h"

@interface EditPopupView()<UITextViewDelegate>
{
    UITextView *_textView;
    __weak IBOutlet UITextView *_editTextView;
    __weak IBOutlet UIView *_editView;
    NSLayoutConstraint *_constraint;
}
@end

@implementation EditPopupView


- (IBAction)cancelBtnClick:(UIButton *)sender {
    
    [self removeFromSuperview];
}

- (IBAction)OKBtnClick:(UIButton *)sender {
    
    self.submitText(_editTextView.text);
}


- (IBAction)btnClick:(UIButton *)sender {
    [self endEditing:YES];
    
}

- (void)textViewDidBeginEditing:(UITextView *)textView{
    [UIView animateWithDuration:0.3 animations:^{
        _editView.frame = CGRectMake(_editView.frame.origin.x, _editView.frame.origin.y-_editView.frame.size.height/2, _editView.frame.size.width, _editView.frame.size.height);
    }];
    
}

- (void)textViewDidEndEditing:(UITextView *)textView{
    [UIView animateWithDuration:0.3 animations:^{
        _editView.frame = CGRectMake(_editView.frame.origin.x, _editView.frame.origin.y+_editView.frame.size.height/2, _editView.frame.size.width, _editView.frame.size.height);
    }];
}



@end
