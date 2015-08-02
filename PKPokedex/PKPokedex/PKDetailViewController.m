//
//  PKDetailViewController.m
//  PKPokedex
//
//  Created by Michael Kavouras on 8/1/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "PKDetailViewController.h"

@interface PKDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation PKDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nameLabel.text = self.pokemonName;
    
    NSString *imageName = [self.pokemonName lowercaseString];
    self.imageView.image = [UIImage imageNamed:imageName];
    
    self.navigationItem.title = self.pokemonName;
}

@end








