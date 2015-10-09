//
//  ViewController.m
//  LearnAnimation
//
//  Created by Michael Kavouras on 9/17/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *viewToAnimate;

@end

@implementation ViewController

- (IBAction)animateButtonTapped:(id)sender {
    
    [self animate];
    
}

- (void)animate {

    // get the frame of our view to animate
    CGRect frame = self.viewToAnimate.frame;
    CGSize frameSize = frame.size;
    
    CGPoint topLeft = CGPointMake(0, 0);
    CGPoint topRight = CGPointMake(self.view.frame.size.width - frameSize.width, 0);
    CGPoint bottomRight = CGPointMake(topRight.x, self.view.frame.size.height - frameSize.height);
    CGPoint bottomLeft = CGPointMake(0, bottomRight.y);
    
    CGRect firstFrame = CGRectMake(topLeft.x, topLeft.y, frameSize.width, frameSize.height);
    CGRect secondFrame = CGRectMake(topRight.x, topRight.y, frameSize.width, frameSize.height);
    CGRect thirdFrame = CGRectMake(bottomRight.x, bottomRight.y, frameSize.width, frameSize.height);
    CGRect fourthFrame = CGRectMake(bottomLeft.x, bottomLeft.y, frameSize.width, frameSize.height);
    
    [UIView animateWithDuration:1.0 animations:^{
        
        // move frame to the first position (top left)
        self.viewToAnimate.frame = firstFrame;
        self.viewToAnimate.backgroundColor = [UIColor redColor];
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:1.0 animations:^{
            
            // move frame to the second position (top right)
            self.viewToAnimate.frame = secondFrame;
            self.viewToAnimate.backgroundColor = [UIColor blueColor];
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:1.0 animations:^{
                
                // move frame to the third position (bottom right)
                self.viewToAnimate.frame = thirdFrame;
                self.viewToAnimate.backgroundColor = [UIColor greenColor];
            } completion:^(BOOL finished) {
                
                [UIView animateWithDuration:1.0 animations:^{
                    
                    // move frame to the fourth position (bottom left)
                    self.viewToAnimate.frame = fourthFrame;
                    self.viewToAnimate.backgroundColor = [UIColor purpleColor];
                } completion:^(BOOL finished) {
                    
                    [UIView animateWithDuration:1.0 animations:^{
                        
                        // move back to first position (top left)
                        self.viewToAnimate.frame = firstFrame;
                    } completion:^(BOOL finished) {

                    }];
                    
                }];
                
            }];
        
        }];
        
    }];
}

@end
