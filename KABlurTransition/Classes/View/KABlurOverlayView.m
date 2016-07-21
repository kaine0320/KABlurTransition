//
//  KABlurOverlayView.m
//  real-v2-ios
//
//  Created by Alex Hung on 17/5/2016.
//  Copyright © 2016 Real. All rights reserved.
//

#import "KABlurOverlayView.h"

@implementation KABlurOverlayView

- (void)showBlur:(BOOL)show {
    if (show) {
        self.visualEffectView.effect = self.blurEffect;
    } else {
        self.visualEffectView.effect = nil;
    }
    
    if (NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_8_4) {
        self.visualEffectView.alpha = show;
    }
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        self.visualEffectView = [[UIVisualEffectView alloc] initWithEffect:nil];
        self.visualEffectView.frame = frame;
        [self addSubview:self.visualEffectView];
    }
    
    return self;
}

@end
