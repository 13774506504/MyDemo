//
//  MainViewController.h
//  FoodTaste
//
//  Created by shown on 16/3/28.
//  Copyright © 2016年 刘朝涛. All rights reserved.
//

#import "RootViewController.h"

@interface MainViewController : RootViewController

//滑动速度系数-建议在0.5-1之间。默认为0.5
@property (nonatomic, assign) CGFloat speedf;

@property (nonatomic, strong) UIViewController *menuVC;

@property (nonatomic, strong) UIViewController *mainVC;

//侧滑窗是否关闭(关闭时显示为主页)
@property (nonatomic, assign) BOOL closed;

//点击手势控制器，是否允许点击视图恢复视图位置。默认为yes
@property (nonatomic, strong) UITapGestureRecognizer *sideslipTapGes;

- (instancetype)initWith:(UIViewController *)menuVC mainVC:(UIViewController *)mainVC;

/**
 @brief 关闭左视图
 */
- (void)closeLeftView;


/**
 @brief 打开左视图
 */
- (void)openLeftView;

@end
