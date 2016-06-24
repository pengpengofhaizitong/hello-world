//
//  ViewController.m
//  SetUIDemo
//
//  Created by haizitong6 on 16/6/6.
//  Copyright © 2016年 haizitong6. All rights reserved.
//

#import "ViewController.h"
#import "InformManagementViewController.h"
#import "NotificaionManageViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}
- (IBAction)intoNextVC:(UIButton *)sender {
    
//    InformManagementViewController *informVC = [[InformManagementViewController alloc] init];
//    [self.navigationController pushViewController:informVC animated:YES];

//    NotificaionManageViewController *notVC = [[NotificaionManageViewController alloc] init];
//    [self.navigationController pushViewController:notVC animated:YES];
    
    UIAlertController *actionSheetController = [UIAlertController alertControllerWithTitle:@"action选项"
                                                                                   message:nil
                                                                            preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *action0 = [UIAlertAction actionWithTitle:@"选项一"
                                                      style:UIAlertActionStyleDefault
                                                    handler:^(UIAlertAction * action) {
                                                        
                                                    }];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"选项二"
                                                     style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction * action) {
                                                       
                                                   }];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"选项三"
                                                      style:UIAlertActionStyleDefault
                                                    handler:^(UIAlertAction * action) {
                                                        
                                                    }];
    UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"取消"
                                                           style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction * action) {}];
    [actionSheetController addAction:action0];
    [actionSheetController addAction:action];
    [actionSheetController addAction:action1];
    [actionSheetController addAction:actionCancel];
    [actionSheetController.view setTintColor:[UIColor greenColor]];
    [self presentViewController:actionSheetController animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
