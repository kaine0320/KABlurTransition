//
//  KASlidingAnimatedTransitioning.m
//  BlurTranstion
//
//  Created by Alex Hung on 27/5/2016.
//  Copyright © 2016 Alex Hung. All rights reserved.
//

#import "KASlidingAnimatedTransitioning.h"
#import "KAConstant.h"

// Tries to duplicate the default iOS 7 slide transition for UINavigationController
@implementation KASlidingAnimatedTransitioning

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIView *containerView = [transitionContext containerView],
    *fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view,
    *toView   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    
    CGRect leftRect = containerView.bounds;
    leftRect.origin.x = -containerView.frame.size.width;
    CGRect rightRect = containerView.bounds;
    rightRect.origin.x = containerView.bounds.size.width;
    CGRect centerRect = containerView.bounds;
    
    if ([self navigationControllerOperation] == UINavigationControllerOperationPush) {
        if (!self.slidingToLeft) {
            
            toView.frame = rightRect;
        } else {
            toView.frame = leftRect;
        }
        [containerView addSubview:toView];
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            toView.frame = centerRect;
            toView.alpha = 1.0;
            
            if (!self.slidingToLeft) {
                fromView.frame = leftRect;
            } else {
                fromView.frame = rightRect;
            }
            fromView.alpha = 0.0;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
    } else if ([self navigationControllerOperation] == UINavigationControllerOperationPop) {
        if (self.slidingToLeft) {
            toView.frame = leftRect;
        } else {
            toView.frame = rightRect;
        }
        
        [containerView addSubview:toView];
        [containerView bringSubviewToFront:fromView];
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            toView.frame = centerRect;
            toView.alpha = 1.0;
            
            if (self.slidingToLeft) {
                fromView.frame = rightRect;
            } else {
                fromView.frame = leftRect;
            }
            fromView.alpha = 0.0;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
    }
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return kTransitionDuration;
}

@end
