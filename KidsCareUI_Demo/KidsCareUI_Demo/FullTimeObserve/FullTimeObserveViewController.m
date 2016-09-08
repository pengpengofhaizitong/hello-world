//
//  FullTimeObserveViewController.m
//  KidsCareUI_Demo
//
//  Created by haizitong6 on 16/9/1.
//  Copyright © 2016年 haizitong6. All rights reserved.
//

#import "FullTimeObserveViewController.h"
#import "FullTimeObserveStudentTableViewCell.h"
#import "HelpTipView.h"
#import "DateSelectorView.h"
#import "SelectDateView.h"
#import "FullTimeCreateEventViewController.h"


@interface FullTimeObserveViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIImageView *headImageV;

@property (weak, nonatomic) IBOutlet UIView *calendarView;
@property (weak, nonatomic) IBOutlet UIImageView *calendarImageV;
@property (weak, nonatomic) IBOutlet UILabel *canendarLabel;


@property (weak, nonatomic) IBOutlet UIView *countView;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;



@property (weak, nonatomic) IBOutlet UIView *noDataTipView;
@property (strong, nonatomic) IBOutlet UIView *nowDateView;
@property (weak, nonatomic) IBOutlet UILabel *nowDateLabel;

@property (nonatomic, strong) UIView *dateBackView;

@property (nonatomic, strong)SelectDateView *selectDateView;

@property (nonatomic, strong)HelpTipView *tipView;


@property (strong, nonatomic) IBOutlet UIView *tableViewFootView;


@property(nonatomic, strong)NSDateFormatter *dateFormatter;
@property(nonatomic, strong)NSDateFormatter *weekFormatter;

@end

@implementation FullTimeObserveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
//    self.tableView.hidden = YES;
//    self.countView.hidden = YES;
//    
//    _noDataTipView.hidden = NO;
    
    
//    [self addDateView];
    UIBarButtonItem *cbbi = [[UIBarButtonItem alloc] initWithTitle:@"创建事件" style:UIBarButtonItemStyleDone target:self action:@selector(createEvent:)];
    self.navigationItem.rightBarButtonItem = cbbi;
}

- (void)createEvent:(UIButton *)btn{
    FullTimeCreateEventViewController *vc = [[FullTimeCreateEventViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (UIView *)dateBackView{
    if(!_dateBackView){
        _dateBackView = [[UIView alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:_dateBackView];
        
        UIButton *backBtn = [[UIButton alloc] initWithFrame:_dateBackView.bounds];
        backBtn.backgroundColor = [UIColor blackColor];
        backBtn.alpha = 0.3;
        [backBtn addTarget:self action:@selector(cancelDateBackBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_dateBackView addSubview:backBtn];
        
        [self.nowDateView setFrame:CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, 100)];
        [_dateBackView addSubview:self.nowDateView];
        
        NSDate *date = [NSDate date];
        [self.dateFormatter setDateFormat:@"yyyy年MM月dd日"];
        NSString *dateStr = [self.dateFormatter stringFromDate:date];//几月几号
        NSString *weekStr = [self.weekFormatter stringFromDate:date];
        NSString *todayDateStr = [NSString stringWithFormat:@"%@ %@",dateStr,weekStr];
        self.nowDateLabel.text = todayDateStr;
        for(int i=0;i<7;i++){
            NSTimeInterval secondsPerDay = -(6-i) * 24*60*60;
            NSDate *curDate = [NSDate dateWithTimeIntervalSinceNow:secondsPerDay];
            [self.dateFormatter setDateFormat:@"d"];
            NSString *dateStr = [self.dateFormatter stringFromDate:curDate];//几月几号
            
            NSLog(@"curDate = %@\n%@",curDate,dateStr);
            UIButton *btn = (UIButton *)[self.nowDateView viewWithTag:i+1];
            if(i == 6){
                [btn setBackgroundColor:[UIColor orangeColor]];
            }
            [btn setTitle:[NSString stringWithFormat:@"%@",dateStr] forState:UIControlStateNormal];
            btn.layer.masksToBounds = YES;
            btn.layer.cornerRadius = btn.frame.size.height/2;
            
            NSString *weekStr = [self.weekFormatter stringFromDate:curDate];
            int week = [self getWeekDate:weekStr];
            UILabel *label = (UILabel *)[self.nowDateView viewWithTag:10+1+i];
            label.text = [NSString stringWithFormat:@"%@",[self conversionToString:week]];
        }
        [self.view addSubview:_dateBackView];
    }
    return _dateBackView;
}

- (void)cancelDateBackBtnClick:(UIButton *)btn{
    self.dateBackView.hidden = YES;
}

//- (HelpTipView *)tipView{
//    if(!_tipView){
//        CGRect frame = [self.HelpTipBtn convertRect:self.view.bounds toView:nil];
//        CGFloat originX = frame.origin.x + self.HelpTipBtn.frame.size.width/2;
//        CGFloat originY = frame.origin.y + self.HelpTipBtn.frame.size.height;
//        
//        _tipView = [[HelpTipView alloc] initWithFrame:CGRectMake(0, 0, 320, 200)];
//        _tipView.backgroundColor = [UIColor orangeColor];
//        [self.view addSubview:_tipView];
//        _tipView.center = CGPointMake(originX, originY);
//    }
//    return _tipView;
//}

- (IBAction)canendarBtnClick:(UIButton *)sender {
    self.dateBackView.hidden = NO;
}

- (IBAction)selectDateBtnClick:(UIButton *)sender {
    for(int i=0;i<7;i++){
        UIButton *btn = (UIButton *)[self.nowDateView viewWithTag:i+1];
        if(i+1 == sender.tag){
            [btn setBackgroundColor:[UIColor orangeColor]];
        }else{
            [btn setBackgroundColor:[UIColor clearColor]];
        }
    }
}

#pragma mark --编辑--
- (IBAction)footViewEditClick:(UIButton *)sender {
    
}

#pragma mark --联系家长--
- (IBAction)footViewContactPar:(UIButton *)sender {
    
}


//- (IBAction)dateSwitchClick:(UIButton *)sender {
//    sender.selected = !sender.selected;
//    if(sender.selected){
//        if(!_selectDateView){
//            _selectDateView = [[SelectDateView alloc] initWithFrame:CGRectMake(0, 64+60, 320, 0)];
//            _selectDateView.backgroundColor = [UIColor orangeColor];
//            [self.view addSubview:_selectDateView];
//        }
//        [_selectDateView setViewFrame:CGRectMake(0, 64+60, 320, 40*7)];
//    }else{
//        [_selectDateView setViewFrame:CGRectMake(0, 64+60, 320, 0)];
//    }
//}
//
//- (IBAction)tipClick:(UIButton *)sender {
//    if(self.tipView.hidden){
//        [self.tipView viewReduction];
//    }else{
//        [self.tipView viewNnarrow];
//    }
//    
//    DateSelectorView *view = [[DateSelectorView alloc] initWithFrame:self.view.bounds];
//    view.backgroundColor = [UIColor yellowColor];
//    [self.view addSubview:view];
//     
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *fullTimeObserveStudentCellId = @"fullTimeObserveStudentCellId";
    FullTimeObserveStudentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:fullTimeObserveStudentCellId];
    if(!cell){
        cell = [[[NSBundle mainBundle] loadNibNamed:@"FullTimeObserveStudentTableViewCell" owner:self options:nil] lastObject];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (NSDateFormatter *)dateFormatter{
    if(!_dateFormatter){
        _dateFormatter = [[NSDateFormatter alloc] init];
    }
    return _dateFormatter;
}

- (NSDateFormatter *)weekFormatter{
    if(!_weekFormatter){
        _weekFormatter = [[NSDateFormatter alloc] init];
        [_weekFormatter setDateFormat:@"EEEE"];//星期几 @"HH:mm 'on' EEEE MMMM d"];
    }
    return _weekFormatter;
}

- (int)getWeekDate:(NSString *)weekStr{
    int week = 0;
    if(weekStr){
        if([weekStr isEqualToString:@"Monday"] || [weekStr isEqualToString:@"星期一"]){
            week = 0;
        }else if([weekStr isEqualToString:@"Tuesday"] || [weekStr isEqualToString:@"星期二"]){
            week = 1;
        }else if([weekStr isEqualToString:@"Wednesday"] || [weekStr isEqualToString:@"星期三"]){
            week = 2;
        }else if([weekStr isEqualToString:@"Thursday"] || [weekStr isEqualToString:@"星期四"]){
            week = 3;
        }else if([weekStr isEqualToString:@"Friday"] || [weekStr isEqualToString:@"星期五"]){
            week = 4;
        }else if([weekStr isEqualToString:@"Saturday"] || [weekStr isEqualToString:@"星期六"]){
            week = 5;
        }else if([weekStr isEqualToString:@"Sunday"] || [weekStr isEqualToString:@"星期日"]){
            week = 6;
        }
    }
    return week;
}

- (NSString *)conversionToString:(int)week{
    NSString *string = @"";
    if(week == 0){
        string = @"一";
    }else if (week == 1){
        string = @"二";
    }else if (week == 2){
        string = @"三";
    }else if (week == 3){
        string = @"四";
    }else if (week == 4){
        string = @"五";
    }else if (week == 5){
        string = @"六";
    }else if (week == 6){
        string = @"日";
    }
    return string;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
