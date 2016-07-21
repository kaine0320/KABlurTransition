//
//  KABlurAnimatedTransitioning.m
//  BlurTranstion
//
//  Created by Alex Hung on 27/5/2016.
//  Copyright © 2016 Alex Hung. All rights reserved.
//

#import "KABlurAnimatedTransitioning.h"
#import "KABlurOverlayView.h"
#import "KAConstant.h"
static NSInteger blurOverlayTag = 30689;

@implementation KABlurAnimatedTransitioning

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIView *containerView = [transitionContext containerView],
    *fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view,
    *toView   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    
    CGRect centerRect = containerView.bounds;
    CGRect bottomRect = containerView.bounds;
    bottomRect.origin.y = containerView.bounds.size.height;
    
    __block KABlurOverlayView *blurOverlay;
    
    if (self.isAppearing) {
        blurOverlay = [self blurOverlayWithFrame:containerView.bounds];
        [blurOverlay showBlur:NO];
        [fromView addSubview:blurOverlay];
        [containerView addSubview:toView];
        toView.frame = bottomRect;
        fromView.frame = centerRect;
    } else {
        bottomRect.origin.x = fromView.frame.origin.x;
        blurOverlay = [toView viewWithTag:blurOverlayTag];
        [blurOverlay showBlur:YES];
    }
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        if (self.isAppearing) {
            [blurOverlay showBlur:YES];
            toView.frame = centerRect;
        } else {
            [blurOverlay showBlur:NO];
            fromView.frame = bottomRect;
        }
    } completion:^(BOOL finished) {
        if (finished) {
            if (!self.isAppearing) {
                [fromView removeFromSuperview];
                [blurOverlay removeFromSuperview];
                blurOverlay = nil;
            }
            [transitionContext completeTransition:YES];
        }
    }];
    
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return kTransitionDuration;
}

- (KABlurOverlayView *)blurOverlayWithFrame:(CGRect)bounds {
    KABlurOverlayView *overlay = [[KABlurOverlayView alloc]initWithFrame:bounds];
    overlay.tag = blurOverlayTag;
    
    return overlay;
}

@end
