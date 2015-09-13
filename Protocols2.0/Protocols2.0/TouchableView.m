//
//  TouchableView.m
//  Protocols2.0
//
//  Created by Michael Kavouras on 9/13/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import "TouchableView.h"

@implementation TouchableView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    [self.delegate touchesBeganInView];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    
    if ([self.delegate respondsToSelector:@selector(touchesEndedInView)]) {
        [self.delegate touchesEndedInView];
    }
}

@end
