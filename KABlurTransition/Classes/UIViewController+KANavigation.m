//
//  UIViewController+KANavigation.m
//  BlurTranstion
//
//  Created by Alex Hung on 27/5/2016.
//  Copyright © 2016 Alex Hung. All rights reserved.
//


#import "UIViewController+KANavigation.h"
#import "UINavigationController+KANavigation.h"
#import "KABlurAnimatedTransitioning.h"
#import "KABlurManager.h"

@implementation UIViewController (RENavigation)

- (void)ka_presentViewController:(UIViewController *)presentedVC animated:(BOOL)animated completion:(void (^)(void))completion {
    
    Class vcClass = [presentedVC class];
    
    if ([[KABlurManager sharedManager]shouldIngoreClass:vcClass]) {
        
        presentedVC.transitioningDelegate = nil;
        [self presentViewController:presentedVC animated:animated completion:completion];
        
    } else {
        
        presentedVC.modalPresentationStyle = UIModalPresentationCustom;
        presentedVC.transitioningDelegate = self;
        [self presentViewController:presentedVC animated:animated completion:completion];
    }
}

#pragma mark - UIViewControllerTransitioningDelegate

- (id <UIViewControllerAnimatedTransitioning> _Nullable)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    KABlurAnimatedTransitioning *transition = [[KABlurAnimatedTransitioning alloc]init];
    transition.isAppearing = YES;
    
    return transition;
}

- (id <UIViewControllerAnimatedTransitioning> _Nullable)animationControllerForDismissedController:(UIViewController*)dismissed {
    KABlurAnimatedTransitioning *transition = [[KABlurAnimatedTransitioning alloc]init];
    transition.isAppearing = NO;
    
    return transition;
}

@end
