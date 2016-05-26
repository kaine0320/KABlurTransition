//
//  KABlurAnimatedTransitioning.h
//  BlurTranstion
//
//  Created by Alex Hung on 27/5/2016.
//  Copyright © 2016 Alex Hung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface KABlurAnimatedTransitioning : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) BOOL isAppearing;

@end
