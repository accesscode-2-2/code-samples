//
//  JackieViewController.m
//  Protocols
//
//  Created by Michael Kavouras on 9/12/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import "JackieViewController.h"

@interface JackieViewController ()

@end

@implementation JackieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Jackie";
    
    if ([self.delegate respondsToSelector:@selector(jackieViewControllerDidLoad)]) {
        [self.delegate jackieViewControllerDidLoad];
    }
}

- (IBAction)topButtonTapped:(id)sender {
    NSString *phrase = @"Fear is the mind killer";
    [self.delegate jackieSayWhat:phrase];
}

- (IBAction)bottomButtonTapped:(id)sender {
    NSString *phrase = @"Birds are actually reptiles, technically speaking";
    [self.delegate jackieSayWhat:phrase];
}

@end
