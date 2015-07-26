//
//  ViewController.m
//  Layout
//
//  Created by Michael Kavouras on 7/21/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)buttonTapped:(UIButton *)sender {
    self.textLabel.text = [self randomPhrase];
}

- (NSString *)randomPhrase {
    NSArray *phrases = @[
        @"Jean shorts wolf salvia selvage, swag crucifix cray cold-pressed selfies PBR&B church-key hashtag. Mar",
        @"n shorts narwhal normcore literally. Meh church-key food truck hella, pop-up flexitarian cor",
        @"fanny",
        @"key food truck hella, pop-up flexitarian cornhole pickled fanny pack Pitc",
        @"rust fund, fingerstache beard American Apparel hashtag chillwave flexitarian lomo mlkshk raw denim cliche keffiyeh. Semiotics cardigan seitan sartorial art party Godard, brunch lumbersexual wolf farm-to-table cray Portland master cleanse viny"
    ];
    
    NSInteger index = arc4random_uniform(phrases.count);
    NSString *phrase = phrases[index];
    return phrase;
}


@end
