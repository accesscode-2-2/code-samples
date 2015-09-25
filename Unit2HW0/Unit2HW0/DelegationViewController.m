//
//  DelegationViewController.m
//  Unit2HW0
//
//  Created by Michael Kavouras on 9/24/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import "DelegationViewController.h"
#import "SocialMediaViewDelegate.h"
#import "SocialMediaView.h"

@interface DelegationViewController () <SocialMediaViewDelegate>

@property (weak, nonatomic) IBOutlet SocialMediaView *socialView;

@end

@implementation DelegationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.socialView.delegate = self;
}

- (void)didTapLikeButton:(SocialMediaView *)view {
    self.view.backgroundColor = [UIColor redColor];
}

- (void)didTapShareButton:(SocialMediaView *)view {
    self.view.backgroundColor = [UIColor greenColor];
}

- (void)didTapCommentButton:(SocialMediaView *)view {
    self.view.backgroundColor = [UIColor blueColor];
}

@end
