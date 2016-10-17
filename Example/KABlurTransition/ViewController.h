//
//  ViewController.h
//  KABlurTransition
//
//  Created by Alex Hung on 17/10/2016.
//  Copyright © 2016 Alex Hung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)presentButtonDidPress:(id)sender;

- (IBAction)pushButtonDidPress:(id)sender;

+ (ViewController *)controllerWithBackground:(Boolean)showBackground;

@end

