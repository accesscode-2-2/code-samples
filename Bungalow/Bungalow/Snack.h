//
//  Snack.h
//  Bungalow
//
//  Created by Michael Kavouras on 10/3/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface Snack : NSManagedObject

@property (nonatomic) NSString *flavor;
@property (nonatomic) NSString *name;
@property (nonatomic) NSNumber *calories;

+ (NSString *)entityName;













@end
