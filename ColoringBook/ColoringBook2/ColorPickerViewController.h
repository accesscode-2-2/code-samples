//
//  ColorPickerViewController.h
//  ColoringBook2
//
//  Created by Michael Kavouras on 9/13/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColorPickerViewControllerDelegate.h"

@interface ColorPickerViewController : UIViewController

@property (nonatomic, weak) id <ColorPickerViewControllerDelegate> delegate;

@end
