//
//  ViewController.m
//  CustomButtonSubclass
//
//  Created by Michael Kavouras on 9/27/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "ViewController.h"
#import "ABBButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    ABBButton *button = [[ABBButton alloc] init];
    button.frame = CGRectMake(0, 0, 200, 44);
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
