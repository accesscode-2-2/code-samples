//
//  MyDelegate.h
//  Protocols2.0
//
//  Created by Michael Kavouras on 9/13/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MyDelegate <NSObject>

@required
- (void)touchesBeganInView;

@optional
- (void)touchesEndedInView;

@end
