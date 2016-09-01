//
//  FullTimeObserveViewController.m
//  KidsCareUI_Demo
//
//  Created by haizitong6 on 16/9/1.
//  Copyright © 2016年 haizitong6. All rights reserved.
//

#import "FullTimeObserveViewController.h"
#import "FullTimeObserveStudentTableViewCell.h"

@interface FullTimeObserveViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation FullTimeObserveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
