//
//  SocialMediaView.h
//  Unit2HW0
//
//  Created by Michael Kavouras on 9/24/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SocialMediaViewDelegate.h"

@interface SocialMediaView : UIView

@property (nonatomic, weak) id<SocialMediaViewDelegate>delegate;

@end
