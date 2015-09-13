//
//  CharlesTableViewController.m
//  Protocols
//
//  Created by Michael Kavouras on 9/12/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import "CharlesTableViewController.h"
#import "JackieCommunicationProtocol.h"
#import "JackieViewController.h"

@interface CharlesTableViewController ()<JackieCommunicationProtocol>

@end

@implementation CharlesTableViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    JackieViewController *viewController = segue.destinationViewController;
    
    viewController.delegate = self;
}

- (void)jackieSayWhat:(NSString *)whatJackieSaid {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"hi" message:whatJackieSaid delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles: nil];
    [alertView show];
}

@end
