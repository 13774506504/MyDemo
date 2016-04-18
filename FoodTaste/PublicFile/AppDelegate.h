//
//  AppDelegate.h
//  FoodTaste
//
//  Created by shown on 16/3/28.
//  Copyright © 2016年 刘朝涛. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "TabBarController.h"
#import "MainViewController.h"
#import "DMSplashAdController.h"
#import "DMRTSplashAdController.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate, DMSplashAdControllerDelegate>
{
    DMSplashAdController *_splashAd;
}
@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) MainViewController *mainVC;

@property (nonatomic, strong) UINavigationController *homeNav;

//@property (nonatomic, strong) TabBarController *tabBar;

@end

