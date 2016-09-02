//
//  FullTimeObsRecordHandleViewController.m
//  KidsCareUI_Demo
//
//  Created by haizitong6 on 16/9/2.
//  Copyright © 2016年 haizitong6. All rights reserved.
//

#import "FullTimeObsRecordHandleViewController.h"

@interface FullTimeObsRecordHandleViewController ()

@property(nonatomic, strong)UILabel *label;

@end

@implementation FullTimeObsRecordHandleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createDetailView];
//    [self addOberveKeyboardStatus];
}

- (void)addOberveKeyboardStatus{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
}

- (void)createDetailView{
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;

    UITextView *tf = [[UITextView alloc] initWithFrame:CGRectMake(0, 80, 200, 100)];
    tf.backgroundColor = [UIColor orangeColor];
    tf.text = @"北京大学";
    [self.view addSubview:tf];
    [tf setContentOffset:CGPointZero];
//    [tf becomeFirstResponder];
}

- (void)keyboardWillShow:(NSNotification *)aNotification{
    NSDictionary *userInfo = [aNotification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    int height = keyboardRect.size.height;
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
