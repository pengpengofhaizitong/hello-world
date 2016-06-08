//
//  ViewController.m
//  SetUIDemo
//
//  Created by haizitong6 on 16/6/6.
//  Copyright © 2016年 haizitong6. All rights reserved.
//

#import "ViewController.h"
#import "InformManagementViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}
- (IBAction)intoNextVC:(UIButton *)sender {
    
    InformManagementViewController *informVC = [[InformManagementViewController alloc] init];
    [self.navigationController pushViewController:informVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
