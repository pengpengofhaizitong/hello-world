//
//  MorningCheckViewController.m
//  demo
//
//  Created by haizitong6 on 16/8/31.
//  Copyright © 2016年 w jf. All rights reserved.
//

#import "MorningCheckViewController.h"
#import "QuickMornCheckView.h"
#import "MornCheckClassListView.h"
#import "MornCheckSearchView.h"
#import "MornCheckObserveViewController.h"
#import "ClassMemeberViewController.h"

#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height

@interface MorningCheckViewController ()


@property (weak, nonatomic) IBOutlet UILabel *quickCheckLab;
@property (weak, nonatomic) IBOutlet UIImageView *quickCheckImgV;
@property (weak, nonatomic) IBOutlet UIImageView *classCheckImgV;
@property (weak, nonatomic) IBOutlet UILabel *classCheckLab;
@property (weak, nonatomic) IBOutlet UIImageView *searchImgV;
@property (weak, nonatomic) IBOutlet UILabel *searchLab;

@property (nonatomic, strong) QuickMornCheckView *quickCheckView;
@property (nonatomic, strong) MornCheckClassListView *classCheckView;
@property (nonatomic, strong) MornCheckSearchView *searchView;
@property (nonatomic, strong) QuickMornCheckView *determinCheckView;

@property (nonatomic, assign) BOOL isClassMemberViewShow;    //展示班级学生列表  默认为NO
@property (nonatomic, assign) BOOL isCheckOperationViewShow; //搜索->晨检
@property (nonatomic, assign) BOOL isFromNextVC;             //判断是否从下一级返回

@property (strong, nonatomic) IBOutlet UIView *noStudentNeedCheckView;
@property (weak, nonatomic) IBOutlet UIImageView *noStudentImgV;
@property (weak, nonatomic) IBOutlet UILabel *noStudentLab1;
@property (weak, nonatomic) IBOutlet UILabel *noStudentLab2;

@end

@implementation MorningCheckViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.quickCheckView.hidden = NO;
//    [self noStudentView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if(_isFromNextVC){
        _isFromNextVC = NO;
        if(_quickCheckView){
            [_quickCheckView adjustView];
        }
    }
}

- (void)noStudentView{
    [_noStudentNeedCheckView setFrame:CGRectMake(0, 64, screenWidth, screenHeight-64-50)];
    [self.view addSubview:_noStudentNeedCheckView];
    if(/* DISABLES CODE */ (1)){
        self.noStudentImgV.image = [UIImage imageNamed:@""];
        self.noStudentLab1.text = @"好棒！";
        self.noStudentLab2.text = @"所有学生都完成晨检了！";
    }else{
        self.noStudentImgV.image = [UIImage imageNamed:@""];
        self.noStudentLab1.text = @"啊哦！";
        self.noStudentLab2.text = @"还没有学生需要晨检！";
    }
}

- (QuickMornCheckView *)quickCheckView{
    if(!_quickCheckView){
        _quickCheckView = [[[NSBundle mainBundle] loadNibNamed:@"QuickMornCheckView" owner:self options:nil] lastObject];
        [_quickCheckView setViewFrame:CGRectMake(0, 64, screenWidth, screenHeight-64-50) isShowDetermineBtn:NO viewAssignment:@{}];
        _quickCheckView.backgroundColor = [UIColor redColor];
        
        __weak typeof(self)weakSelf = self;
        _quickCheckView.clickBlock = ^(int type){
            MornCheckObserveViewController *vc = [[MornCheckObserveViewController alloc] init];
            [weakSelf.navigationController pushViewController:vc animated:YES];
            weakSelf.isFromNextVC = YES;
        };
        [self.view addSubview:_quickCheckView];
    }
    return _quickCheckView;
}

- (MornCheckClassListView *)classCheckView{
    if(!_classCheckView){
        _classCheckView = [[MornCheckClassListView alloc] initWithFrame:CGRectMake(0, 64, screenWidth, screenHeight-64-50)];
        __weak typeof(self)weakSelf = self;
        _classCheckView.selectBlock = ^(int row){
//            weakSelf.classMemberView.hidden = NO;
//            weakSelf.classCheckView.hidden = YES;
//            weakSelf.isClassMemberViewShow = YES;
            ClassMemeberViewController *vc = [[ClassMemeberViewController alloc] init];
            [weakSelf.navigationController pushViewController:vc animated:YES];
        };
        [self.view addSubview:_classCheckView];
    }
    return _classCheckView;
}

- (MornCheckSearchView *)searchView{
    if(!_searchView){
        _searchView = [[MornCheckSearchView alloc] initWithFrame:CGRectMake(0, 64, screenWidth, screenHeight-64-50)];
        __weak typeof(self)weakSelf = self;
        _searchView.block = ^(int row){
            weakSelf.determinCheckView.hidden = NO;
            weakSelf.isCheckOperationViewShow = YES;
        };
        [self.view addSubview:_searchView];
    }
    return _searchView;
}

- (QuickMornCheckView *)determinCheckView{
    if(!_determinCheckView){
        _determinCheckView = [[[NSBundle mainBundle] loadNibNamed:@"QuickMornCheckView" owner:self options:nil] lastObject];
        [_determinCheckView setViewFrame:CGRectMake(0, 64, screenWidth, screenHeight-64-50) isShowDetermineBtn:YES viewAssignment:@{}];
        _determinCheckView.backgroundColor = [UIColor redColor];
//        __weak typeof(self)weakSelf = self;
        _determinCheckView.clickBlock = ^(int type){

        };
        [self.view addSubview:_determinCheckView];
    }
    return _determinCheckView;
}

//快速晨检
- (IBAction)quickCheckClick:(UIButton *)sender {
    self.quickCheckView.hidden = NO;
    self.classCheckView.hidden = YES;
    self.searchView.hidden = YES;

    if(_isCheckOperationViewShow){
        self.determinCheckView.hidden = YES;
    }
}

//按班级晨检
- (IBAction)classCheckClick:(UIButton *)sender {
    self.quickCheckView.hidden = YES;
    self.classCheckView.hidden = NO;
    self.searchView.hidden = YES;
    if(_isCheckOperationViewShow){
        self.determinCheckView.hidden = YES;
    }
}

//搜索
- (IBAction)searchClick:(UIButton *)sender {
    self.quickCheckView.hidden = YES;
    self.classCheckView.hidden = YES;
    self.searchView.hidden = NO;
    if(_isCheckOperationViewShow){
        self.determinCheckView.hidden = NO;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
