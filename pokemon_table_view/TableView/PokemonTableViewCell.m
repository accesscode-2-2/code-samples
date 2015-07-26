//
//  PokemonTableViewCell.m
//  TableView
//
//  Created by Michael Kavouras on 7/26/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "PokemonTableViewCell.h"

@implementation PokemonTableViewCell

- (void)awakeFromNib {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
