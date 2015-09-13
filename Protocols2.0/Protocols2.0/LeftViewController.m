//
//  LeftViewController.m
//  Protocols2.0
//
//  Created by Michael Kavouras on 9/13/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import "LeftViewController.h"
#import "TouchableView.h"

@interface LeftViewController () <MyDelegate>

@property (weak, nonatomic) IBOutlet TouchableView *myCustomView;

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myCustomView.delegate = self;
}

- (void)touchesBeganInView {
    CGPoint center = self.myCustomView.center;
    center.x -= 10;
    self.myCustomView.center = center;

}

@end
