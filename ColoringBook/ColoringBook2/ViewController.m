//
//  ViewController.m
//  ColoringBook2
//
//  Created by Michael Kavouras on 9/13/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import "ViewController.h"
#import "ColorPickerViewController.h"
#import "ColorPickerViewControllerDelegate.h"

@interface ViewController () <ColorPickerViewControllerDelegate>

@property (nonatomic) UIButton *selectedButton;

@end

@implementation ViewController

- (IBAction)coloringItemTapped:(UIButton *)sender {
    
    // set self.selectedButton to the button that was just tapped
    self.selectedButton = sender;
    
    // instantiate new view controller from storyboard
    ColorPickerViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ColorPickerViewController"];
    
    // set the delegate property of viewController to self
    viewController.delegate = self;
    
    // present viewController modally
    [self presentViewController:viewController animated:YES completion:nil];
}

#pragma mark ColorPickerViewControllerDelegate

- (void)colorPickerViewController:(ColorPickerViewController *)viewController didPickColor:(UIColor *)color {
    
    self.selectedButton.backgroundColor = color;
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


@end
