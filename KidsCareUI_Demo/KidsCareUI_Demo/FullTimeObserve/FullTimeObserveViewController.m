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

@interface FullTimeObserveViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *HelpTipBtn;

@property (nonatomic, strong)HelpTipView *tipView;

@end

@implementation FullTimeObserveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (HelpTipView *)tipView{
    if(!_tipView){
        CGRect frame = [self.HelpTipBtn convertRect:self.view.bounds toView:nil];
        CGFloat originX = frame.origin.x + self.HelpTipBtn.frame.size.width/2;
        CGFloat originY = frame.origin.y + self.HelpTipBtn.frame.size.height;
        
        _tipView = [[HelpTipView alloc] initWithFrame:CGRectMake(0, 0, 320, 200)];
        _tipView.backgroundColor = [UIColor orangeColor];
        [self.view addSubview:_tipView];
        _tipView.center = CGPointMake(originX, originY);
    }
    return _tipView;
}

- (IBAction)tipClick:(UIButton *)sender {
    if(self.tipView.hidden){
        [self.tipView viewReduction];
    }else{
        [self.tipView viewNnarrow];
    }
    
    DateSelectorView *view = [[DateSelectorView alloc] initWithFrame:self.view.bounds];
    view.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:view];
     
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
