//
//  ViewController.m
//  Protocols2.0
//
//  Created by Michael Kavouras on 9/13/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import "ViewController.h"
#import "MyDelegate.h"
#import "TouchableView.h"

@interface ViewController () <MyDelegate>

@property (weak, nonatomic) IBOutlet TouchableView *myCustomView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Hey, view. I'm your delegate
    self.myCustomView.delegate = self;
}

- (void)touchesBeganInView {
    CGPoint center = self.myCustomView.center;
    center.x += 10;
    self.myCustomView.center = center;
}

- (void)touchesEndedInView {
    NSLog(@"touches ended");
}


@end
