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
    
    
//    CGFloat newX = self.view.frame.size.width - frameSize.width;
//    CGFloat newY = framePosition.y;
//    CGFloat newWidth = frameSize.width;
//    CGFloat newHeight = frameSize.height;
    
    self.viewToAnimate.layer.cornerRadius = 30.0;
    
    // here's the real stuff
    CGRect frame = self.viewToAnimate.frame;
    CGSize frameSize = frame.size;
    CGPoint framePosition = frame.origin;
    
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
                self.viewToAnimate.frame = thirdFrame;
                self.viewToAnimate.backgroundColor = [UIColor greenColor];
            } completion:^(BOOL finished) {
                
                [UIView animateWithDuration:1.0 animations:^{
                    self.viewToAnimate.frame = fourthFrame;
                    self.viewToAnimate.backgroundColor = [UIColor purpleColor];
                } completion:^(BOOL finished) {
                    
                    [UIView animateWithDuration:1.0 animations:^{
                        self.viewToAnimate.frame = firstFrame;
                    } completion:^(BOOL finished) {

                    }];
                    
                }];
                
            }];
        
        }];
        
    }];
    
//    CGRect newFrame = CGRectMake(self.view.frame.size.width - 100, 200.0, 60.0, 160.0);
    
//    CGRect newFrame = CGRectMake(newX, newY, newWidth, newHeight);
//    
//    [UIView animateWithDuration:1.0 animations:^{
//        self.viewToAnimate.frame = newFrame;
//        self.viewToAnimate.backgroundColor = [UIColor blueColor];
//        self.viewToAnimate.layer.cornerRadius = 30.0;
//    }];
}

@end
