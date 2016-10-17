//
//  ViewController.m
//  KABlurTransition
//
//  Created by Alex Hung on 17/10/2016.
//  Copyright © 2016 Alex Hung. All rights reserved.
//

#import "ViewController.h"
#import "KABlurTransition.h"
#import <PureLayout/PureLayout.h>

@interface ViewController ()

@property (nonatomic, assign) Boolean showBackground;

@end

@implementation ViewController

- (void)awakeFromNib {
    [super awakeFromNib];
    self.showBackground = YES;
}

+ (ViewController *)controllerWithBackground:(Boolean)showBackground {
    ViewController *vc = [[ViewController alloc]init];
    
    if (vc) {
        vc.showBackground = showBackground;
    }
    
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initViews];
}

- (void)initViews {
    UIButton *presentButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [presentButton setTintColor:[UIColor whiteColor]];
    [presentButton setTitle:@"Present" forState:UIControlStateNormal];
    [presentButton addTarget:self action:@selector(presentButtonDidPress:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *pushButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [pushButton setTintColor:[UIColor whiteColor]];
    [pushButton setTitle:@"Push" forState:UIControlStateNormal];
    [pushButton addTarget:self action:@selector(pushButtonDidPress:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *backgroundImageView = [UIImageView newAutoLayoutView];
    
    if (self.showBackground) {
        backgroundImageView.image = [UIImage imageNamed:@"bg"];
    }
    
    backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    backgroundImageView.clipsToBounds = YES;
    
    UIView *buttonContainer = [UIView newAutoLayoutView];
    buttonContainer.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
    
    
    [buttonContainer addSubview:presentButton];
    [buttonContainer addSubview:pushButton];
    
    [pushButton autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [pushButton autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:16];
    [pushButton autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    
    [presentButton autoPinEdge:ALEdgeLeading toEdge:ALEdgeTrailing ofView:pushButton withOffset:16];
    [presentButton autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [presentButton autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    [presentButton autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:16];
    
    [self.view addSubview:backgroundImageView];
    [self.view addSubview:buttonContainer];
    
    [backgroundImageView autoPinEdgesToSuperviewEdges];
    
    
    [buttonContainer autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [buttonContainer autoAlignAxisToSuperviewAxis:ALAxisVertical];
    
    
    if (self.presentingViewController) {
        UIBarButtonItem *dismissBarItem = [[UIBarButtonItem alloc]initWithTitle:@"Dismiss" style:UIBarButtonItemStylePlain target:self action:@selector(dismissButtonDidPress:)];
        self.navigationItem.rightBarButtonItem = dismissBarItem;
    }
}

- (IBAction)dismissButtonDidPress:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)presentButtonDidPress:(id)sender{
    UINavigationController *navVC = [[UINavigationController alloc]initWithRootViewController:[ViewController controllerWithBackground:NO]];
    navVC.view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.1];
    
    [self ka_presentViewController:navVC animated:YES completion:nil];
}

- (IBAction)pushButtonDidPress:(id)sender {
    
    [self.navigationController ka_pushViewController:[ViewController controllerWithBackground:!self.presentingViewController] animated:YES];
}

@end
