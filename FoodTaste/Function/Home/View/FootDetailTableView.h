//
//  FootDetailTableView.h
//  FoodTaste
//
//  Created by shown on 16/3/29.
//  Copyright © 2016年 刘朝涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FootDetailTableView : UITableView<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *dataArr;

@end
