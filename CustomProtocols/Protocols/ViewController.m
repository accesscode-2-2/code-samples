//
//  ViewController.m
//  Protocols
//
//  Created by Michael Kavouras on 9/12/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import "ViewController.h"
#import "JackieCommunicationProtocol.h"
#import "JackieViewController.h"

@interface ViewController () <JackieCommunicationProtocol>

@end

@implementation ViewController

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    JackieViewController *viewController = segue.destinationViewController;
    
    viewController.delegate = self;
}

#pragma mark - JackieCommunicationProtocol

- (void)jackieViewControllerDidLoad {
    NSLog(@"jackie view controller loaded");
}

- (void)jackieSayWhat:(NSString *)whatJackieSaid {
    NSLog(@"%@", whatJackieSaid);
}

@end
