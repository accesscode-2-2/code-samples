//
//  ViewController.m
//  TimerDemo
//
//  Created by Michael Kavouras on 8/23/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *timerLabel;

@property (nonatomic) NSTimer *timer;

@property (nonatomic) NSDate *startTime;

@property (nonatomic) NSTimeInterval totalSessionTime;

@property (nonatomic) NSTimeInterval totalTime;

@end

@implementation ViewController

- (IBAction)startButtonTapped:(UIButton *)sender {
    
    // set self.startTime to now
    self.startTime = [[NSDate alloc] init];
    
    // setup timer
    self.timer = [NSTimer timerWithTimeInterval:1/60.0 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
    
    // add timer to the run loop
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (IBAction)stopButtonTapped:(UIButton *)sender {
    
    // keep track of the total amount of time that this stopwatch has been running
    self.totalTime = self.totalTime + self.totalSessionTime;
    
    // stop the timer
    [self.timer invalidate];
}

- (void)timerFired:(NSTimer *)timer {
    
    // get the current time
    NSDate *now = [[NSDate alloc] init];
    
    self.totalSessionTime = [now timeIntervalSinceDate:self.startTime];
    NSTimeInterval distance =  self.totalTime + self.totalSessionTime;
    
    self.timerLabel.text = [NSString stringWithFormat:@"%0.2f", distance];
    NSLog(@"%f", distance);
}

@end
