//
//  MKTableViewController.m
//  SlackPoo
//
//  Created by Michael Kavouras on 8/16/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "MKTableViewController.h"

@interface MKTableViewController ()

@end

@implementation MKTableViewController

- (IBAction)leftBarButtonTapped:(UIBarButtonItem *)sender {
    NSLog(@"left");
    [self setNeedsStatusBarAppearanceUpdate];
    [UIView animateWithDuration:0.3 animations:^{
        CGPoint newCenter = self.tableView.center;
        newCenter.x += 200;
        self.tableView.center = newCenter;
    }];
}

- (IBAction)rightBarButtonTapped:(UIBarButtonItem *)sender {
    [UIView animateWithDuration:0.3 animations:^{
        CGPoint newCenter = self.tableView.center;
        newCenter.x -= 200;
        self.tableView.center = newCenter;
    }];
}

@end
