//
//  UINavigationController+KANavigation.h
//  BlurTranstion
//
//  Created by Alex Hung on 27/5/2016.
//  Copyright © 2016 Alex Hung. All rights reserved.
//


#import <UIKit/UIKit.h>
@class KANavigationControllerDelegate;

@interface UINavigationController (RENavigation) <UINavigationControllerDelegate>

@property (nonatomic, strong, nullable) KANavigationControllerDelegate *controllerDelegate;

- (void)ka_pushViewController:(UIViewController *)viewController animated:(BOOL)animated;

@end
