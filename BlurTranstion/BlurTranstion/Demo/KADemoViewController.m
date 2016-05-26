//
//  KADemoViewController.m
//  BlurTranstion
//
//  Created by Alex Hung on 27/5/2016.
//  Copyright © 2016 Alex Hung. All rights reserved.
//

#import "KADemoViewController.h"
#import "KANavigation.h"

@implementation KADemoViewController

- (IBAction)pushButtonDidPress:(id)sender{
    [self.navigationController pushVC:[[KADemoViewController alloc]initWithNibName:@"KADemoViewController" bundle:nil] animated:YES];
}

- (IBAction)presentButtonDidPress:(id)sender{
    KADemoViewController *demoVC = [[KADemoViewController alloc]initWithNibName:@"KADemoPresentViewController" bundle:nil];
    UINavigationController *navVC = [[UINavigationController alloc]initWithRootViewController:demoVC];
    demoVC.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Dismiss" style:UIBarButtonItemStylePlain target:self action:@selector(dismissButtonDidPress)];
    [self presentVC:navVC animated:YES completion:nil];
}

- (void)dismissButtonDidPress{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
