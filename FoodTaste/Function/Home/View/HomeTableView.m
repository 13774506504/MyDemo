//
//  HomeTableView.m
//  FoodTaste
//
//  Created by shown on 16/3/29.
//  Copyright © 2016年 刘朝涛. All rights reserved.
//  首页的tableview

#import "HomeTableView.h"

@implementation HomeTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if (self = [super initWithFrame:frame style:style])
    {
        self.backgroundColor = [UIColor clearColor];
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

#pragma mark --- <UITableViewDelegate,UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
//    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"HomeCell";
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[HomeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    MenuModel *model = _dataArr[indexPath.row];
    [cell refreshDataWith:model];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CTMake(104);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_tableViewBlock) {
        MenuModel *model = _dataArr[indexPath.row];
        _tableViewBlock(model);
    }
}

@end
