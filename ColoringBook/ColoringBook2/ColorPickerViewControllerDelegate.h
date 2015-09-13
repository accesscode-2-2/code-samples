//
//  ColorPickerViewControllerDelegate.h
//  ColoringBook2
//
//  Created by Michael Kavouras on 9/13/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

// include a reference to ColorPickerViewController class
@class ColorPickerViewController;

@protocol ColorPickerViewControllerDelegate <NSObject>

// required delegate method
- (void)colorPickerViewController:(ColorPickerViewController *)viewController
                     didPickColor:(UIColor *)color;

@end
