//
//  PKPokedex.h
//  PKPokedex
//
//  Created by Michael Kavouras on 8/1/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PKPokedex : NSObject

@property (nonatomic) NSArray *aToZPokedex;
@property (nonatomic) NSDictionary *typePokedex;

- (void)initializeData;

@end
