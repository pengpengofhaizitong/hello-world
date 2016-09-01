//
//  MornCheckClassListView.m
//  demo
//
//  Created by haizitong6 on 16/8/31.
//  Copyright © 2016年 w jf. All rights reserved.
//

#import "MornCheckClassListView.h"
#import "MornCheckClassListTableViewCell.h"

@interface MornCheckClassListView()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation MornCheckClassListView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self addTableView];
    }
    return self;
}

- (void)addTableView{
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.bounds];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = 60;
    [self addSubview:tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *mornCheckClassListCellIdStr = @"mornCheckClassListTabView";
    MornCheckClassListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:mornCheckClassListCellIdStr];
    if(cell == nil){
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MornCheckClassListTableViewCell" owner:self options:nil] lastObject];
//        [cell setData:nil];
        cell.backgroundColor = [UIColor redColor];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(self.selectBlock){
        self.selectBlock((int)indexPath.row);
    }
}

@end
