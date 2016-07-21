//
//  KANavigationControllerDelegate.h
//  BlurTranstion
//
//  Created by Alex Hung on 27/5/2016.
//  Copyright © 2016 Alex Hung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface KANavigationControllerDelegate : NSObject <UINavigationControllerDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, weak) IBOutlet UINavigationController *navigationController;
@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *interactionController;

- (id)initWithNavgationController:(UINavigationController *)navVC;

@end
