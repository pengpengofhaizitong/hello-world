//
//  FullTimeHomeViewController.m
//  KidsCareUI_Demo
//
//  Created by haizitong6 on 16/9/2.
//  Copyright © 2016年 haizitong6. All rights reserved.
//

#import "FullTimeHomeViewController.h"
#import "FullTimeObserveViewController.h"
#import "FullTimeObsRecordHandleViewController.h"
#import "FullTimeCreateEventViewController.h"

@interface FullTimeHomeViewController ()

@end

@implementation FullTimeHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)fulltime:(id)sender {
    FullTimeObserveViewController *vc = [[FullTimeObserveViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)recordHandle:(id)sender {
    FullTimeObsRecordHandleViewController *vc = [[FullTimeObsRecordHandleViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)createrEventClick:(UIButton *)sender {
    FullTimeCreateEventViewController *vc = [[FullTimeCreateEventViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
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
