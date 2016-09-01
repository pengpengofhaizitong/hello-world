//
//  ClassMemberView.m
//  demo
//
//  Created by haizitong6 on 16/8/31.
//  Copyright © 2016年 w jf. All rights reserved.
//

#import "ClassMemberView.h"
#import "ClassMemberTableViewCell.h"

@interface ClassMemberView()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ClassMemberView

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

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    view.backgroundColor = [UIColor orangeColor];
    return view;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *classTableViewCellId = @"classMemberTableViewCellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:classTableViewCellId];
    if(!cell){
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ClassMemberTableViewCell" owner:self options:nil] lastObject];
    }
    return cell;
}


@end
