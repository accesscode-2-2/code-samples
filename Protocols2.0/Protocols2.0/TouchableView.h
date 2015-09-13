//
//  TouchableView.h
//  Protocols2.0
//
//  Created by Michael Kavouras on 9/13/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyDelegate.h"

@interface TouchableView : UIView

@property (nonatomic, weak) id <MyDelegate> delegate;

@end
