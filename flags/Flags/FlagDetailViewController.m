//
//  FlagDetailViewController.m
//  Flags
//
//  Created by Michael Kavouras on 7/28/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "FlagDetailViewController.h"

@interface FlagDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *countryNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *flagImageView;

@end

@implementation FlagDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.flagImageView.image = [self.country image];
    self.countryNameLabel.text = self.country.name;
}

@end
