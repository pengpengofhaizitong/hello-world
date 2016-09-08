//
//  FullTimeCreateDetailViewController.m
//  KidsCareUI_Demo
//
//  Created by haizitong6 on 16/9/5.
//  Copyright © 2016年 haizitong6. All rights reserved.
//

#import "FullTimeCreateDetailViewController.h"
#import "ObserveContentView.h"

@interface FullTimeCreateDetailViewController ()
@property (strong, nonatomic) IBOutlet UIView *observeView;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollerView;

@end

@implementation FullTimeCreateDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    ObserveContentView *view = [[[NSBundle mainBundle] loadNibNamed:@"ObserveContentView" owner:self options:nil] lastObject];
    [view setFrame:CGRectMake(0, 100, 320, 400) labelText:@{}];
    [self.view addSubview:view];
    
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
