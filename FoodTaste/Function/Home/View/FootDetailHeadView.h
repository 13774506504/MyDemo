//
//  FootDetailHeadView.h
//  FoodTaste
//
//  Created by shown on 16/3/29.
//  Copyright © 2016年 刘朝涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FootDetailHeadView : UIView

@property (nonatomic, strong) UILabel *titleLab;    //标题

@property (nonatomic, strong) UIImageView *iconView;    //图片

@property (nonatomic, strong) UILabel *introLab;    //简介

@property (nonatomic, strong) UILabel *ingredientsLab;  //材料

@property (nonatomic, strong) UILabel *burdenLab;   //配料

@property (nonatomic, strong) UILabel *lab; //步骤

@property (nonatomic, strong) MenuModel *model;

- (instancetype)initWithFrame:(CGRect)frame Model:(MenuModel *)model;

@end
