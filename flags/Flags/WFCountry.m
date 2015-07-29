//
//  WFCountry.m
//  Flags
//
//  Created by Michael Kavouras on 7/28/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "WFCountry.h"

@implementation WFCountry

- (UIImage *)image {
    return [UIImage imageNamed:self.imageURLString];
}


+ (NSArray *)allCountries {
    return @[
        @"Anguilla",
        @"Antigua and Barbuda",
        @"Argentina",
        @"Aruba",
        @"Bahamas",
        @"Barbados",
        @"Belize",
        @"Bermuda",
        @"Bolivia",
        @"Bonaire",
        @"Bouvet Island",
        @"Brazil",
        @"Canada",
        @"Cayman Islands",
        @"Chile",
        @"Colombia",
        @"Costa Rica",
        @"Cuba",
        @"Curacao",
        @"Dominica",
        @"Dominican Republic",
        @"Ecuador",
        @"El Salvador",
        @"Falkland Islands",
        @"French Guiana",
        @"Grenada",
        @"Guadeloupe",
        @"Guatemala",
        @"Guyana",
        @"Haiti",
        @"Honduras",
        @"Jamaica",
        @"Martinique",
        @"Mexico",
        @"Montserrat",
        @"Nicaragua",
        @"Panama",
        @"Paraguay",
        @"Peru",
        @"Puerto Rico",
        @"Saint Barthelemy",
        @"Saint Kitts",
        @"Saint Lucia",
        @"Saint Martin",
        @"Saint Pierre and Miquelon",
        @"Saint Vincent and the Grenadines",
        @"Sint Maarten",
        @"South Georgia and the South Sandwich Islands",
        @"Suriname",
        @"Trinidad and Tobago",
        @"Turks and Caicos Islands",
        @"United States of America"
    ];
}

@end
