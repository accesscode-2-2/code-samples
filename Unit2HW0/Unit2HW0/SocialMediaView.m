//
//  SocialMediaView.m
//  Unit2HW0
//
//  Created by Michael Kavouras on 9/24/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import "SocialMediaView.h"

@implementation SocialMediaView

- (IBAction)likeButtonTapped:(id)sender {
    [self.delegate didTapLikeButton:self];
}

- (IBAction)shareButtonTapped:(id)sender {
    [self.delegate didTapShareButton:self];
}

- (IBAction)commentButtonTapped:(id)sender {
    [self.delegate didTapCommentButton:self];
}

@end
