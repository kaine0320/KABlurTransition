//
//  KABlurManager.h
//  Pods
//
//  Created by Alex Hung on 17/10/2016.
//
//

#import <Foundation/Foundation.h>

@interface KABlurManager : NSObject

+ (KABlurManager *)sharedManager;

- (void)ingoreClass:(Class)class;

- (void)addClass:(Class)class;

- (BOOL)shouldIngoreClass:(Class)class;

@end
