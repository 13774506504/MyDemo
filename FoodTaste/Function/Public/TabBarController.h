//
//  TabBarController.h
//  FoodTaste
//
//  Created by shown on 16/3/28.
//  Copyright © 2016年 刘朝涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"

@interface TabBarController : UITabBarController

@property (nonatomic, strong) HomeViewController *homeVC;

@property (nonatomic, strong) UINavigationController *firstNav;

@end
