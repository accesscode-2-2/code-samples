//
//  ViewController.m
//  LifeCycle
//
//  Created by Michael Kavouras on 7/24/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loader;

@end

@implementation ViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        NSLog(@"%@: init", self.titleLabel.text);
        return self;
    }
    return nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@: view did load", self.titleLabel.text);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.loader startAnimating];
    NSLog(@"%@: view will appear", self.titleLabel.text);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [UIView animateWithDuration:2.0 animations: ^{
        self.loader.alpha = 1.0;
    }];
    NSLog(@"%@: view did appear", self.titleLabel.text);
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    NSLog(@"%@: view will layout subviews", self.titleLabel.text);
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    NSLog(@"%@: view did layout subviews", self.titleLabel.text);
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"%@: view will disappear", self.titleLabel.text);
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"%@: view did disappear", self.titleLabel.text);
    [super viewDidDisappear:animated];
}

- (void)dealloc {
    NSLog(@"%@: dealloc", self.titleLabel.text);
}

@end
