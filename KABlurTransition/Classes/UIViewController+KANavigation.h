//
//  UIViewController+KANavigation.h
//  BlurTranstion
//
//  Created by Alex Hung on 27/5/2016.
//  Copyright © 2016 Alex Hung. All rights reserved.
//


#import <UIKit/UIKit.h>
@class REDemoMainViewController, REDemoPushViewController, REDemoPresentViewController;

@interface UIViewController (RENavigation) <UIViewControllerTransitioningDelegate>

- (void)ka_presentViewController:(UIViewController *)presentedVC animated:(BOOL)animated completion:(void (^)(void))completion;
@end
