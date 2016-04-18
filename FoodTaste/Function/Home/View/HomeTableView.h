//
//  HomeTableView.h
//  FoodTaste
//
//  Created by shown on 16/3/29.
//  Copyright © 2016年 刘朝涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeTableViewCell.h"

@interface HomeTableView : UITableView<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataArr;

@property (nonatomic, copy) void(^tableViewBlock)(MenuModel *model);

@end
