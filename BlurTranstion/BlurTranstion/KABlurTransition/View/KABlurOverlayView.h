//
//  KABlurOverlayView.h
//  real-v2-ios
//
//  Created by Alex Hung on 17/5/2016.
//  Copyright © 2016 Real. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KABlurOverlayView : UIView

@property (nonatomic, strong) UIVisualEffectView *visualEffectView;
@property (nonatomic, strong) UIVisualEffect *blurEffect;

- (void)showBlur:(BOOL)show;

@end
