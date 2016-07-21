//
//  UINavigationController+KANavigation.m
//  BlurTranstion
//
//  Created by Alex Hung on 27/5/2016.
//  Copyright © 2016 Alex Hung. All rights reserved.
//


#import "UINavigationController+KANavigation.h"
#import "UIViewController+KANavigation.h"
#import "KASlidingAnimatedTransitioning.h"
#import "KANavigationControllerDelegate.h"
#import <objc/runtime.h>

static void * KANavigationControllerDelegateKey = &KANavigationControllerDelegateKey;

@implementation UINavigationController (RENavigation)

- (KANavigationControllerDelegate *)controllerDelegate {
    return objc_getAssociatedObject(self, @selector(controllerDelegate));
}

- (void)setControllerDelegate:(KANavigationControllerDelegate *)controllerDelegate {
    objc_setAssociatedObject(self, @selector(controllerDelegate), controllerDelegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)pushVC:(UIViewController *)vc animated:(BOOL)animated {
    if (!self.controllerDelegate) {
        self.controllerDelegate = [[KANavigationControllerDelegate alloc]initWithNavgationController:self];
    }
    self.delegate = self.controllerDelegate;
    [self pushViewController:vc animated:animated];
}

@end
