//
//  ABBButton.m
//  CustomButtonSubclass
//
//  Created by Michael Kavouras on 9/27/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "ABBButton.h"

@implementation ABBButton

- (instancetype)init {
    if (self = [super init]) {
        
        [self setDefaultValues];
        
        return self;
    }
    return nil;
}

// called any time an instance is initialized from Interface Builder
- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setDefaultValues];
}

- (void)setDefaultValues {
    UIColor *customPink = [UIColor colorWithRed:41/255.0 green:113/255.0 blue:178/255.0 alpha:1.0];
    
    self.backgroundColor = customPink;
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}









@end
