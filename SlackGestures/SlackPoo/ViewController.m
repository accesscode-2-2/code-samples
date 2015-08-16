//
//  ViewController.m
//  SlackPoo
//
//  Created by Michael Kavouras on 8/16/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "ViewController.h"
#import "MKTableViewController.h"

@interface ViewController ()

@property (nonatomic) MKTableViewController *tableViewController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self embedTableViewController];
    [self setupGestures];
}

- (IBAction)rightButtonTapped:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        CGPoint newCenter = self.tableViewController.view.center;
        newCenter.x -= 200;
        self.tableViewController.view.center = newCenter;
    }];
}

- (IBAction)leftButtonTapped:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        CGPoint newCenter = self.tableViewController.view.center;
        newCenter.x += 200;
        self.tableViewController.view.center = newCenter;
    }];
}

- (void)embedTableViewController {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MKTableViewController *tvc = [storyboard instantiateViewControllerWithIdentifier:@"TableViewController"];
    
    [self addChildViewController:tvc];
    tvc.view.frame = self.view.bounds;
    [self.view addSubview:tvc.view];
    [tvc willMoveToParentViewController:self];
    
    self.tableViewController = tvc;
}

- (void)setupGestures {
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panning:)];
    [self.tableViewController.view addGestureRecognizer:panGesture];
}

- (void)panning:(UIPanGestureRecognizer *)gesture {
    
    if (gesture.state == UIGestureRecognizerStateChanged) {
        CGPoint origin = self.view.frame.origin;
        origin.x += [gesture translationInView:self.view].x;
        CGRect newFrame = CGRectMake(origin.x, 0, self.view.frame.size.width, self.view.frame.size.height);
        self.tableViewController.tableView.frame = newFrame;
    }
}

@end
