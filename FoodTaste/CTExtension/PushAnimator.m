//
//  PushAnimator.m
//  自定义转场动画
//
//  Created by shown on 16/3/18.
//  Copyright © 2016年 刘朝涛. All rights reserved.
//

#import "PushAnimator.h"

@interface PushAnimator ()

@property (weak, nonatomic) id transitionContext;

@end

@implementation PushAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    self.transitionContext = transitionContext;
    
    UIView *containerView = [transitionContext containerView];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    [containerView addSubview:toVC.view];
    
    CGRect rect = CGRectMake(fromVC.view.center.x, fromVC.view.center.y, 0, 0);
    
    UIBezierPath *originPath = [UIBezierPath bezierPathWithOvalInRect:rect];
    CGPoint extremePoint = CGPointMake(fromVC.view.center.x, fromVC.view.center.y);
    
    float radius = sqrtf(extremePoint.x * extremePoint.x + extremePoint.y * extremePoint.y);
    
    UIBezierPath *finalPath = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(rect, -radius, -radius)];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = finalPath.CGPath;
    toVC.view.layer.mask = maskLayer;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.fromValue = (__bridge id _Nullable)(originPath.CGPath);
    animation.toValue = (__bridge id _Nullable)(finalPath.CGPath);
    animation.duration = [self transitionDuration:transitionContext];
    animation.delegate = self;
    [maskLayer addAnimation:animation forKey:@"path"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    [self.transitionContext completeTransition:![self.transitionContext transitionWasCancelled]];
    [self.transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view.layer.mask = nil;
}

@end
