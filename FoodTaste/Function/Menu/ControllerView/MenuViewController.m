//
//  MenuViewController.m
//  FoodTaste
//
//  Created by shown on 16/3/28.
//  Copyright © 2016年 刘朝涛. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initView];
}
/**
 *  初始化视图
 */
- (void)initView
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:@"menu_bg.jpg"];
    [self.view addSubview:imageView];
    
    [self.view addSubview:self.tableView];
}

#pragma mark --- <UITableViewDelegate, UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Identifier = @"Identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.font = [UIFont systemFontOfSize:CTMake(20)];
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }

    if (indexPath.row == 0) {
        cell.textLabel.text = @"我的收藏";
    } else if (indexPath.row == 1) {
        cell.textLabel.text = @"设置";
    } else if (indexPath.row == 2) {
        cell.textLabel.text = @"关于";
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return CTMake(180);
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, CTMake(180))];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

#pragma mark --- getter
- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.bounces = NO;
    }
    return _tableView;
}

@end
