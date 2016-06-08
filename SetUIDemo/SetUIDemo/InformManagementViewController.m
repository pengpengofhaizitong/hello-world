//
//  InformManagementViewController.m
//  SetUIDemo
//
//  Created by haizitong6 on 16/6/6.
//  Copyright © 2016年 haizitong6. All rights reserved.
//

#import "InformManagementViewController.h"


#define isYuan (1)

#ifdef isYuan

#define itemArray @[@"通知声音",@"请在iPhone的\"设置\",\"通知\"中进行修改",@"新消息推送通知",@"通知",@"聊天",@"添加好友请求",@"考勤信息"]

#else


#endif


#define GrayBackGroundColor [UIColor colorWithRed:240/255.0f green:240/255.0f blue:240/255.0f alpha:1]

#define cellHigh  (50)

@interface InformManagementViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation InformManagementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _tableView.tableFooterView = [[UIView alloc] init];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
}

- (BOOL)getSystemVersion{
    CGFloat systemVer = [[[UIDevice currentDevice] systemVersion] floatValue];
    BOOL isNotifyAlert = NO, isNotifySound = NO;
    if (systemVer >= 8.0)
    {
        UIUserNotificationType types = [[UIApplication sharedApplication] currentUserNotificationSettings].types;
        isNotifyAlert = (types & UIUserNotificationTypeAlert) == UIUserNotificationTypeAlert;
        isNotifySound = (types & UIUserNotificationTypeSound) == UIUserNotificationTypeSound;
    }
    else
    {
        UIRemoteNotificationType types = [[UIApplication sharedApplication] enabledRemoteNotificationTypes];
        isNotifyAlert = (types & UIRemoteNotificationTypeAlert) == UIRemoteNotificationTypeAlert;
        isNotifySound = (types & UIRemoteNotificationTypeSound) == UIRemoteNotificationTypeSound;
    }
    return isNotifySound;
}


- (void)switchClick:(UISwitch *)sender {
    UITableViewCell *cell = (UITableViewCell *)[sender superview];
    NSIndexPath *path = [_tableView indexPathForCell:cell];
    NSInteger section = path.section;
    NSInteger row = path.row;
    
#ifdef isYuan
    [self clickForRow:row Section:section];
#else
    
#endif

}

-(void)clickForRow:(NSInteger)row Section:(NSInteger)section{
    NSLog(@"tableView.frame=%@",_tableView);
    NSLog(@"section = %ld\nrow = %ld",section,row);
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"InformmanagementCellIdentifier"];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"InformmanagementCellIdentifier"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }

    NSMutableString *mutStr = [[NSMutableString alloc] init];
    [mutStr appendString:@"  "];
    [mutStr appendString:[itemArray objectAtIndex:indexPath.row]];
    cell.textLabel.text = mutStr;
    if(indexPath.row == 0){
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, cellHigh)];
        BOOL onOrOff = [self getSystemVersion];
        if(onOrOff){
            label.text = @"打开";
        }else{
            label.text = @"关闭";
        }
        label.textAlignment = NSTextAlignmentRight;
        cell.accessoryView = label;
    }else if (indexPath.row == 1){
        cell.contentView.backgroundColor = GrayBackGroundColor;
        cell.textLabel.font = [UIFont systemFontOfSize:13];
    }else if (indexPath.row == 2){
        cell.contentView.backgroundColor = GrayBackGroundColor;
    }else if(indexPath.row > 2){
        UISwitch *switchV = [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
        [switchV addTarget:self action:@selector(switchClick:) forControlEvents:UIControlEventValueChanged];
        cell.accessoryView = switchV;
        
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        
        UIView *dividerView = [[UIView alloc] initWithFrame:CGRectMake(0, cellHigh-1, tableView.frame.size.width, 1)];
        dividerView.backgroundColor = GrayBackGroundColor;
        [cell.contentView addSubview:dividerView];
    }

    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return itemArray.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return cellHigh;
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
