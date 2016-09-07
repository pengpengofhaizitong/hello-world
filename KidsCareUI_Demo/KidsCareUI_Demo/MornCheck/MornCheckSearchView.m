//
//  MornCheckSearchView.m
//  demo
//
//  Created by haizitong6 on 16/8/31.
//  Copyright © 2016年 w jf. All rights reserved.
//

#import "MornCheckSearchView.h"
#import "MornCheckSearchTableViewCell.h"

@interface MornCheckSearchView()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
@property (nonatomic, strong)UILabel *noResultLabel;
@end

@implementation MornCheckSearchView

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
    [self addSubview:tableView];
    
    UISearchBar *sb = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    sb.placeholder = @"输入学生完整姓名";
    sb.delegate = self;
    tableView.tableHeaderView = sb;
}

#pragma mark ---tableViewDelegate---
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel *label  = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    label.text = @"最佳匹配";
    return label;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *mornCheckSearchTableViewId = @"mornCheckSearchTableViewId";
    MornCheckSearchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:mornCheckSearchTableViewId];
    if(!cell){
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MornCheckSearchTableViewCell" owner:self options:nil] lastObject];
        __weak typeof(self)weakSelf = self;
        cell.clickBlock = ^(int row){
            if(weakSelf.block){
                weakSelf.block((int)indexPath.row);
            }
        };
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.block((int)indexPath.row);
}

#pragma mark --- searchBarDelegate ---
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    searchBar.showsCancelButton = YES;
    return YES;
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    searchBar.showsCancelButton = NO;
    searchBar.text = nil;
    [searchBar resignFirstResponder];
}

//点击搜索按钮
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
    if(/* DISABLES CODE */ (1)){
        self.noResultLabel.hidden = NO;
    }else{
        self.noResultLabel.hidden = YES;
    }
}

- (UILabel *)noResultLabel{
    if(!_noResultLabel){
        _noResultLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, self.viewForLastBaselineLayout.frame.size.width, 40)];
        _noResultLabel.text = @"没有找到符合的学生，请重新搜索";
        _noResultLabel.font = [UIFont systemFontOfSize:17];
        [self addSubview:_noResultLabel];
    }
    return _noResultLabel;
}

@end
