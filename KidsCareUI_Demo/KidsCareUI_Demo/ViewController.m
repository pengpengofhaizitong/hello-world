//
//  ViewController.m
//  KidsCareUI_Demo
//
//  Created by haizitong6 on 16/8/30.
//  Copyright © 2016年 haizitong6. All rights reserved.
//

#import "ViewController.h"
#import "MornCheckObserveViewController.h"
#import "MorningCheckViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)observeClick:(id)sender {
    MorningCheckViewController *controller = [[MorningCheckViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
