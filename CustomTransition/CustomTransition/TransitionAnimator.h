//
//  TransitionAnimator.h
//  CustomTransition
//
//  Created by Michael Kavouras on 11/14/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TransitionAnimator : NSObject
<UIViewControllerAnimatedTransitioning>

@property (nonatomic, getter=isPresenting) BOOL presenting;

@end
