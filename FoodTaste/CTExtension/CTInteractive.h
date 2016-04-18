//
//  CTInteractive.h
//  自定义转场动画
//
//  Created by shown on 16/3/18.
//  Copyright © 2016年 刘朝涛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CTInteractive : NSObject<UIViewControllerInteractiveTransitioning>

@property (nonatomic, assign) BOOL isActing;    //判断动画正在进行中

- (void)writeToViewcontroller:(UIViewController *)toVc;/** 写入二级ViewController*/

- (void)updateInteractiveTransition:(CGFloat)percentComplete;/** 更新交互进度*/

- (void)cancelInteractiveTransition;/** 取消切换*/

- (void)finishInteractiveTransition;/** 完成切换*/

@end
