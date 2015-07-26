//
//  ViewController.m
//  TeachAPersonToFish
//
//  Created by Michael Kavouras on 7/25/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *bloodOrangeView;

@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;
@property (weak, nonatomic) IBOutlet UISlider *alphaSlider;

@end

@implementation ViewController

- (IBAction)sliderChanged:(UISlider *)sender {
    CGFloat red = self.redSlider.value;
    CGFloat green = self.greenSlider.value;
    CGFloat blue = self.blueSlider.value;
    CGFloat alpha = self.alphaSlider.value;
    
    UIColor *newColor = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    
    self.bloodOrangeView.backgroundColor = newColor;
}

@end









