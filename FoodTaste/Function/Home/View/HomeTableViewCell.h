//
//  HomeTableViewCell.h
//  FoodTaste
//
//  Created by shown on 16/3/29.
//  Copyright © 2016年 刘朝涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *iconView;   // 图片

@property (nonatomic, strong) UILabel *titleLab;    //标题

@property (nonatomic, strong) UILabel *introLab;    //介绍


- (void)refreshDataWith:(MenuModel *)model;

@end
