//
//  KABlurManager.m
//  Pods
//
//  Created by Alex Hung on 17/10/2016.
//
//

#import "KABlurManager.h"

@interface KABlurManager()

@property (nonatomic, strong) NSMutableArray *ignoredClass;

@end

@implementation KABlurManager

+ (KABlurManager *)sharedManager {
    static KABlurManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init {
    self = [super init];
    
    if (self) {
        [self initData];
    }
    
    return self;
}

- (void)initData {
    self.ignoredClass = [[NSMutableArray alloc]init];
    [self ingoreClass:[UIAlertController class]];
    [self ingoreClass:[UIActivityViewController class]];
}


- (void)ingoreClass:(Class)class {
    NSString *classString = NSStringFromClass(class);
    
    if (![self.ignoredClass containsObject:classString]) {
        [self.ignoredClass addObject:classString];
    }
}

- (void)addClass:(Class)class {
    NSString *classString = NSStringFromClass(class);
    
    if ([self.ignoredClass containsObject:classString]) {
        [self.ignoredClass removeObject:classString];
    }
    
}

- (BOOL)shouldIngoreClass:(Class)class {
       NSString *classString = NSStringFromClass(class);
    
    return [self.ignoredClass containsObject:classString];
}


@end
