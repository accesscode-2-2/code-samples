//
//  ViewController.m
//  NotificationPractice
//
//  Created by Michael Kavouras on 9/15/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import "ViewController.h"

// This is a constant. Constants are variables that are defined
// at run time and never change. The nice thing about constants
// is that it provides auto completion from Xcode so there's less
// margin for typo errors
NSString * const MyCustomNotificationName = @"MyCustomNotification";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // observe an NSNotification sent by the system
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(myNotificationFired:) name:MyCustomNotificationName object:nil];
    
    // observe an NSNotification that is custom and will be sent by our application
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appBecameActive:) name:UIApplicationDidBecomeActiveNotification object:nil];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSDictionary *myInfo = @{@"name" : @"mike"};
    
    // post an NSNotification
    [[NSNotificationCenter defaultCenter] postNotificationName:MyCustomNotificationName object:self userInfo:myInfo];
}

- (void)myNotificationFired:(NSNotification *)notification {
    NSLog(@"%@", notification);
}

- (void)appBecameActive:(NSNotification *)notification {
    NSLog(@"%@", notification);
}

@end












