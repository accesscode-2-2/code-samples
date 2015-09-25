//
//  SocialMediaViewDelegate.h
//  Unit2HW0
//
//  Created by Michael Kavouras on 9/24/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SocialMediaView;

@protocol SocialMediaViewDelegate <NSObject>

- (void)didTapLikeButton:(SocialMediaView *)view;
- (void)didTapShareButton:(SocialMediaView *)view;
- (void)didTapCommentButton:(SocialMediaView *)view;

@end
