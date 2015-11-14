//
//  ViewController.m
//  CustomTransition
//
//  Created by Michael Kavouras on 11/13/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "ViewController.h"
#import "TransitionAnimator.h"

@interface ViewController ()
<
UIViewControllerTransitioningDelegate,
UINavigationControllerDelegate
>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.delegate = self;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    segue.destinationViewController.transitioningDelegate = self;
}

# pragma mark - UINavigationControllerDelegate

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC
{
    TransitionAnimator *animator = [[TransitionAnimator alloc] init];
    
    if (operation == UINavigationControllerOperationPush) {
        animator.presenting = YES;
        return animator;
    } else {
        animator.presenting = NO;
        return animator;
    }
    
    return nil;
}

# pragma mark - UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    TransitionAnimator *animator = [[TransitionAnimator alloc] init];
    animator.presenting = YES;
    return animator;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    TransitionAnimator *animator = [[TransitionAnimator alloc] init];
    animator.presenting = NO;
    return animator;
}

@end
