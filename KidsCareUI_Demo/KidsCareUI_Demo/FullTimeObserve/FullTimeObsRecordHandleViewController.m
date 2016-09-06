//
//  FullTimeObsRecordHandleViewController.m
//  KidsCareUI_Demo
//
//  Created by haizitong6 on 16/9/2.
//  Copyright © 2016年 haizitong6. All rights reserved.
//

#import "FullTimeObsRecordHandleViewController.h"

#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
#define CountTextLabelHeight  40

#define MAX_Text_Count  10

@interface FullTimeObsRecordHandleViewController ()<UITextViewDelegate>

@property(nonatomic, strong)UITextView *textV;

@property(nonatomic, strong)UILabel *remainTextCountLabel;

@end

@implementation FullTimeObsRecordHandleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createDetailView];
    [self addOberveKeyboardStatus];
}

- (void)addOberveKeyboardStatus{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (UILabel *)remainTextCountLabel{
    if(!_remainTextCountLabel){
        _remainTextCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, (ScreenHeight -CountTextLabelHeight), ScreenWidth, CountTextLabelHeight)];
        _remainTextCountLabel.backgroundColor = [UIColor redColor];
        [self.view addSubview:_remainTextCountLabel];
        _remainTextCountLabel.text = [NSString stringWithFormat:@"%d",MAX_Text_Count];
        _remainTextCountLabel.textAlignment = NSTextAlignmentRight;
    }
    return _remainTextCountLabel;
}

- (void)createDetailView{
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;

    _textV = [[UITextView alloc] initWithFrame:CGRectMake(0, 80, 200, 100)];
    _textV.backgroundColor = [UIColor orangeColor];
    _textV.delegate = self;
    _textV.text = @"北京大学";
    [self.view addSubview:_textV];
    [_textV becomeFirstResponder];
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    return YES;
}

- (void)textViewDidChange:(UITextView *)textView{
    if(textView.text.length > 10){
        _remainTextCountLabel.text = @"还可以输入0个字";
        textView.text = [textView.text substringToIndex:10];
    }else{
        _remainTextCountLabel.text = [NSString stringWithFormat:@"还可以输入%d个字",MAX_Text_Count - (int)textView.text.length];
    }
}


- (void)keyboardWillShow:(NSNotification *)aNotification{
    NSDictionary *userInfo = [aNotification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    int height = keyboardRect.size.height;
    [self.remainTextCountLabel setFrame:CGRectMake(0,  (ScreenHeight - height -CountTextLabelHeight), ScreenWidth, CountTextLabelHeight)];
    [self.textV setFrame:CGRectMake(0,  64, ScreenWidth, ScreenHeight-64-height-CountTextLabelHeight)];
}

- (void)keyboardWillHide:(NSNotification *)aNotification{
    [self.remainTextCountLabel setFrame:CGRectMake(0,  (ScreenHeight -CountTextLabelHeight), ScreenWidth, CountTextLabelHeight)];
    [self.textV setFrame:CGRectMake(0,  64, ScreenWidth, ScreenHeight-64-CountTextLabelHeight)];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
