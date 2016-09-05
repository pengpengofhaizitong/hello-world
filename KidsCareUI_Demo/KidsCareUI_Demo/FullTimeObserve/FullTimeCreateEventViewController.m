//
//  FullTimeCreateEventViewController.m
//  KidsCareUI_Demo
//
//  Created by haizitong6 on 16/9/5.
//  Copyright © 2016年 haizitong6. All rights reserved.
//

#import "FullTimeCreateEventViewController.h"
#import "CreateEventTableViewCell.h"

#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height

@interface FullTimeCreateEventViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong)UITableView *tableView;

@end

@implementation FullTimeCreateEventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createDetailView];
    [self addOberveKeyboardStatus];
}

- (void)createDetailView{
    UIView *searchTfBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, 40)];
    searchTfBgView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:searchTfBgView];
    
    UITextField *tf = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth - 120, 40)];
    tf.backgroundColor = [UIColor yellowColor];
    [searchTfBgView addSubview:tf];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth - 90, 0, 60, 40)];
    [btn setTitle:@"查询" forState:UIControlStateNormal];
    [searchTfBgView addSubview:btn];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 104, ScreenWidth, ScreenHeight - 104)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *createEventCellId = @"createEventCellId";
    CreateEventTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:createEventCellId];
    if(!cell){
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CreateEventTableViewCell" owner:self options:nil] lastObject];
        cell.clickBlock = ^(int row){
            NSLog(@"row = %d",row);
        };
    }
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
