//
//  ViewController.m
//  KidsEvaluation_UIDemo
//
//  Created by haizitong6 on 16/7/20.
//  Copyright © 2016年 haizitong6. All rights reserved.
//

#import "ViewController.h"
#import "DraftBoxViewController.h"
#import "EditPopupView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)next:(id)sender {
    DraftBoxViewController *viewC = [[DraftBoxViewController alloc] init];
    [self.navigationController pushViewController:viewC animated:YES];
}
- (IBAction)popUpView:(id)sender {
//    EditPopupView *editView = [[EditPopupView alloc] initWithFrame:self.view.frame];
    
    EditPopupView *editView = [[[NSBundle mainBundle] loadNibNamed:@"EditPopupView" owner:self options:nil] lastObject];
//    [editView addViewToWindow];
//    EditPopupView *editV = [[EditPopupView alloc] initWithFrame:self.view.frame coverView:self];
    editView.submitText = ^(NSString *text){
        NSLog(@"text = %@",text);
    };
    editView.frame = self.view.frame;
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    [window addSubview:editView];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
