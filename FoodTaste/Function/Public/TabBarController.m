//
//  TabBarController.m
//  FoodTaste
//
//  Created by shown on 16/3/28.
//  Copyright © 2016年 刘朝涛. All rights reserved.
//

#import "TabBarController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initView];
}

- (void)initView
{
    self.viewControllers = @[self.firstNav];
    
    self.tabBar.barTintColor = [UIColor whiteColor];
}



#pragma mark --- getter

- (HomeViewController *)homeVC
{
    if (!_homeVC) {
        _homeVC = [[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
    }
    return _homeVC;
}

- (UINavigationController *)firstNav
{
    if (!_firstNav) {
        _firstNav = [[UINavigationController alloc] initWithRootViewController:self.homeVC];
    }
    return _firstNav;
}

@end
