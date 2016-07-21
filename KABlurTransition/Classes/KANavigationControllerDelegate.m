//
//  KANavigationControllerDelegate.m
//  BlurTranstion
//
//  Created by Alex Hung on 27/5/2016.
//  Copyright © 2016 Alex Hung. All rights reserved.
//

#import "KANavigationControllerDelegate.h"
#import "KASlidingAnimatedTransitioning.h"

#define transitonVelocityThershold  400.0f
#define transitionDistanceThreshold  ([UIScreen mainScreen].bounds.size.width/3)

@interface KANavigationControllerDelegate ()

@property (nonatomic, strong) UIViewController *leftViewController;
@property (nonatomic, strong) UIViewController *rightViewController;
@property (nonatomic, weak) UIViewController *fromViewController;
@property (nonatomic, weak) UIViewController *toViewController;

@end

@implementation KANavigationControllerDelegate

#pragma mark - Setup
- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
    
}

- (void)setup {
    
}

- (id)initWithNavgationController:(UINavigationController *)navVC {
    self = [super init];
    
    if (self) {
        self.navigationController = navVC;
        [self setup];
    }
    
    return self;
}

#pragma mark - UINavigationControllerDelegate

- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>)animationController {
    return self.interactionController;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC {
    self.fromViewController = fromVC;
    self.toViewController = toVC;
    KASlidingAnimatedTransitioning *transitioning = [[KASlidingAnimatedTransitioning alloc]init];
    
    if (operation == UINavigationControllerOperationPush) {
        transitioning.slidingToLeft = NO;
    } else {
        transitioning.slidingToLeft = YES;
    }
    transitioning.navigationControllerOperation = operation;
    
    return transitioning;
}

@end
