//
//  AppDelegate.m
//  FoodTaste
//
//  Created by shown on 16/3/28.
//  Copyright © 2016年 刘朝涛. All rights reserved.
//

#import "AppDelegate.h"
#import "MenuViewController.h"
#import "HomeViewController.h"

#import "PushAnimator.h"
#import "CTInteractive.h"
#import "CTTransitionAnimator.h"
#import "PopAnimator.h"

//#define DMPUBLISHERID        @"56OJ2Xw4uNx8hFmtBA"
//#define DMPLCAEMENTID_SPLASH @"16TLP2WlAp94PNUUWREqEg0z"
#define DMPUBLISHERID        @"56OJyM1ouMGoULfJaL"
#define DMPLCAEMENTID_SPLASH @"16TLwebvAchkAY6iOVhpfHPs"

@interface AppDelegate ()

@property (nonatomic, strong) PushAnimator *pushAnimation;

@property (nonatomic, strong) PopAnimator *popAnimation;

@property (nonatomic, strong) CTInteractive *popInteractive;

@property (nonatomic, strong) CTTransitionAnimator *popInteraction;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
//    [NSThread sleepForTimeInterval:2.0]; //延时2秒，以便用户看清楚启动页
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];
    
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    
    self.homeNav = [[UINavigationController alloc] initWithRootViewController:homeVC];
//    [self.homeNav.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg"] forBarMetrics:UIBarMetricsCompact];
    
    MenuViewController *menuVC = [[MenuViewController alloc] init];
    
    self.mainVC = [[MainViewController alloc] initWith:menuVC mainVC:_homeNav];
    
    self.window.rootViewController = self.mainVC;
    
//    // 设置适合的背景图片
//    // Set background image
//    NSString *defaultImgName = @"Default";
//    CGFloat offset = 0.0f;
//    CGSize adSize;
//    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
//        adSize = CGSizeMake(768, 576);
//        defaultImgName = @"Default-Portrait";
//        offset = 374.0f;
//    } else {
//        adSize = CGSizeMake(320, 400);
//        if ([UIScreen mainScreen].bounds.size.height > 480.0f) {
//            defaultImgName = @"Default-568h";
//            offset = 233.0f;
//        } else {
//            offset = 168.0f;
//        }
//    }
//    
//    BOOL isCacheSplash = YES;
//    
//    NSString *pubID = DMPUBLISHERID;
//    NSString *placementID = DMPLCAEMENTID_SPLASH;
//    UIColor *bgColor = [UIColor colorWithPatternImage:[UIImage imageNamed:defaultImgName]];
//    if (isCacheSplash) {
//        _splashAd = [[DMSplashAdController alloc] initWithPublisherId:pubID placementId:placementID size:adSize offset:233.5f window:self.window background:bgColor animation:YES];
//        _splashAd.delegate = self;
//        if (_splashAd.isReady) {
//            [_splashAd present];
//        }
//    } else {
//        DMSplashAdController *rtsplashAd = nil;
//        rtsplashAd = [[DMSplashAdController alloc] initWithPublisherId:pubID placementId:placementID size:adSize offset:233.5f window:self.window background:bgColor animation:YES];
//        rtsplashAd.delegate = self;
//        [rtsplashAd present];
//    }
    
    return YES;
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPush) {
        return self.pushAnimation;
    } else if (operation == UINavigationControllerOperationPop) {
        return self.popAnimation;
    }
    return nil;
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController
{
    return self.popInteractive.isActing ? self.popInteractive : nil;
}

- (PushAnimator *)pushAnimation
{
    if (!_pushAnimation) {
        _pushAnimation = [[PushAnimator alloc] init];
    }
    return _pushAnimation;
}

- (PopAnimator *)popAnimation
{
    if (!_popAnimation) {
        _popAnimation = [[PopAnimator alloc] init];
    }
    return _popAnimation;
}

- (CTInteractive *)popInteractive
{
    if (!_popInteractive) {
        _popInteractive = [[CTInteractive alloc] init];
    }
    return _popInteractive;
}

- (CTTransitionAnimator *)popInteraction
{
    if (!_popInteraction) {
        _popInteraction = [[CTTransitionAnimator alloc] init];
    }
    return _popInteraction;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
