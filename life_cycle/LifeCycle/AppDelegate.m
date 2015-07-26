//
//  AppDelegate.m
//  LifeCycle
//
//  Created by Michael Kavouras on 7/24/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"***");
    NSLog(@"application did finish launching");
    NSLog(@"***");
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"***");
    NSLog(@"application will resign active");
    NSLog(@"***");
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"***");
    NSLog(@"application did enter background");
    NSLog(@"***");
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"***");
    NSLog(@"application did enter foreground");
    NSLog(@"***");
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"***");
    NSLog(@"application did become active");
    NSLog(@"***");
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"***");
    NSLog(@"application will terminate");
    NSLog(@"***");
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
