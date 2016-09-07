//
//  FullTimeCreateEventViewController.m
//  KidsCareUI_Demo
//
//  Created by haizitong6 on 16/9/5.
//  Copyright © 2016年 haizitong6. All rights reserved.
//

#import "FullTimeCreateEventViewController.h"
#import "CreateEventTableViewCell.h"
#import "MornCheckSearchView.h"
#import "FullTimeCreateDetailViewController.h"

#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height

@interface FullTimeCreateEventViewController ()

@property(nonatomic, strong)UITableView *tableView;

@property(nonatomic, strong)UILabel *noDataLabel;

@end

@implementation FullTimeCreateEventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    [self createDetailView];
    [self addOberveKeyboardStatus];
}

- (void)createDetailView{
    MornCheckSearchView *view = [[MornCheckSearchView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight-64)];
    __weak typeof(self)weakSelf = self;
    view.block = ^(int row){
        FullTimeCreateDetailViewController *vc = [[FullTimeCreateDetailViewController alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
    [self.view addSubview:view];
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

- (void)keyboardWillShow:(NSNotification *)aNotification{
    NSDictionary *userInfo = [aNotification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    int height = keyboardRect.size.height;
    [_tableView setFrame:CGRectMake(0, 104, ScreenWidth, ScreenHeight - 104 - height)];
}

- (void)keyboardWillHide:(NSNotification *)aNotification{
    [_tableView setFrame:CGRectMake(0, 104, ScreenWidth, ScreenHeight - 104)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
