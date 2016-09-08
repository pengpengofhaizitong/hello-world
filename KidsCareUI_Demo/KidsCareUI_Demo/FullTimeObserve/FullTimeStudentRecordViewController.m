//
//  FullTimeStudentRecordViewController.m
//  KidsCareUI_Demo
//
//  Created by haizitong6 on 16/9/8.
//  Copyright © 2016年 haizitong6. All rights reserved.
//

#import "FullTimeStudentRecordViewController.h"
#import "ObserveContentView.h"
#import "StudentRecordTableViewCell.h"

@interface FullTimeStudentRecordViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIView *detailView;

@property (nonatomic, strong) UITableView *recordContentTableView;
@property (nonatomic, strong) UITableView *observeContentTableView;
@property (nonatomic, strong) UITableView *recordHistoryTableView;

@end

@implementation FullTimeStudentRecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

- (UITableView *)recordContentTableView{
    if(!_recordContentTableView){
        _recordContentTableView = [[UITableView alloc] initWithFrame:self.detailView.bounds];
        _recordContentTableView.delegate = self;
        _recordContentTableView.dataSource = self;
    }
    return _recordContentTableView;
}

- (UITableView *)observeContentTableView{
    if(!_observeContentTableView){
        _observeContentTableView = [[UITableView alloc] initWithFrame:self.detailView.bounds];
        _observeContentTableView.delegate = self;
        _observeContentTableView.dataSource = self;
    }
    return _observeContentTableView;
}

- (UITableView *)recordHistoryTableView{
    if(!_recordHistoryTableView){
        _recordHistoryTableView = [[UITableView alloc] initWithFrame:self.detailView.bounds];
        _recordHistoryTableView.delegate = self;
        _recordHistoryTableView.dataSource = self;
    }
    return _recordHistoryTableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    CGFloat heigh = [StudentRecordTableViewCell calculateCellHeight];
    NSLog(@"heigh = %f",heigh);
    return heigh;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *tableViewCellIdStr = @"fullTimeStudentRcordViewCellId";
    StudentRecordTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableViewCellIdStr];
    if(!cell){
        cell = [[[NSBundle mainBundle] loadNibNamed:@"StudentRecordTableViewCell" owner:self options:nil] lastObject];
        [cell addDetailView];
    }
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
