//
//  ViewController.m
//  Gestures
//
//  Created by Michael Kavouras on 11/8/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) UIView *myView;
@property (nonatomic) CGFloat currentScale;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.currentScale = 1.0;
    
    [self addRedView];
    
    
    [self addPinchGesture];
    [self addPanGesture];
//    [self addSwipeGesture];
    
}

- (void)addRedView {
    // instantiate a new UIView with a frame
    self.myView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    
    // add it as a subview to self.view
    [self.view addSubview:self.myView];
    
    // set the background color to red
    self.myView.backgroundColor = [UIColor redColor];
}


# pragma mark -
# pragma mark Pinch gesture

- (void)addPinchGesture {
    UIPinchGestureRecognizer *gesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinching:)];
    
    [self.myView addGestureRecognizer:gesture];
}

- (void)pinching:(UIPinchGestureRecognizer *)pinching {
    
    // calculate the scale (currentScale * pinching.scale)
    CGFloat scale = self.currentScale * pinching.scale;
    
    // set the scale transform (x, y) = (scale, scale)
    self.myView.transform = CGAffineTransformMakeScale(scale, scale);
    
    // update the currentScale property with our final scale state
    if (pinching.state == UIGestureRecognizerStateEnded) {
        self.currentScale = scale;
    }
}


# pragma mark -
# pragma mark Pan gesture

- (void)addPanGesture {
   
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    
    [self.view addGestureRecognizer:panGesture];
}

- (void)handlePan:(UIPanGestureRecognizer *)gesture {
    
//    NSLog(@"%ld", (long)gesture.state);
    
    CGPoint translation = [gesture translationInView:self.view];
    NSLog(@"%@", NSStringFromCGPoint(translation));
    
    CGPoint location = [gesture locationInView:self.view];
    NSLog(@"%@", NSStringFromCGPoint(location));
    
    
    self.myView.center = location;
}

# pragma mark - 
# pragma mark Swipe gesture

- (void)swiping:(UISwipeGestureRecognizer *)gesture {
//    NSLog(@"%@", gesture);
}

-(void)addSwipeGesture {
    // create a gesture
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] init];
    
    // set the properties
    swipeGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    
    // set the target and the action
    [swipeGesture addTarget:self action:@selector(swiping:)];
    
    // add to a UI element
    [self.myView addGestureRecognizer:swipeGesture];
}

@end
