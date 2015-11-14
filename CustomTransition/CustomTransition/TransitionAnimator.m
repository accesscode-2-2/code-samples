//
//  TransitionAnimator.m
//  CustomTransition
//
//  Created by Michael Kavouras on 11/14/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "TransitionAnimator.h"

@implementation TransitionAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    
    // scale transition
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    if (self.isPresenting) {
        
        [[transitionContext containerView] addSubview:fromView];
        [[transitionContext containerView] addSubview:toView];
        
        toView.transform = CGAffineTransformMakeScale(0.0, 0.0);
     
        [UIView animateWithDuration:duration animations:^{
            toView.transform = CGAffineTransformMakeScale(1.0, 1.0);
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    } else {
        
        [[transitionContext containerView] addSubview:toView];
        [[transitionContext containerView] addSubview:fromView];
        
        [UIView animateWithDuration:duration animations:^{
            fromView.alpha = 0.0;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }
    
    
    
    // fade transition
    
    // toView.alpha = 0.0;
    // 
    //
    // NSTimeInterval duration = [self transitionDuration:transitionContext];
    // 
    // [UIView animateWithDuration:duration animations:^{
    //     toView.alpha = 1.0;
    // } completion:^(BOOL finished) {
    //     [transitionContext completeTransition:YES];
    // }];
    
}

@end
