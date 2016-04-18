//
//  CTTransitionAnimator.h
//  自定义转场动画
//
//  Created by shown on 16/3/18.
//  Copyright © 2016年 刘朝涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CTTransitionAnimator : UIPercentDrivenInteractiveTransition

@property (assign , nonatomic) BOOL isActing;/** 判断动画正在进行中*/

- (void)writeToViewcontroller:(UIViewController *)toVc;/** 写入二级ViewController*/

@end
