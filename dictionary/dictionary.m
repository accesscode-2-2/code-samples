//
//  main.m
//  Dictionaries
//
//  Created by Michael Kavouras on 7/14/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        NSString *charizardKey = @"charizard";
        NSMutableArray *arr = [[NSMutableArray alloc] init];

        NSDictionary *pokemon = @{
            @"charizard" : @"fire",
            @"blastoise" : @"water",
            @"venosaur"  : @"plant",
            @"pikachu"   : @"electric",
            @"ditto"     : @"normal",
            @"alakazam"  : @"psychic"
        };

        NSLog(@"%@", pokemon);


        NSString *charizard = [pokemon objectForKey:@"charizard"];

        NSLog(@"%@", charizard);
        NSLog(@"%@", pokemon[@"ditto"]);

        NSMutableDictionary *computers = [[NSMutableDictionary alloc] init];
        [computers setObject:@"2000" forKey:@"mac"];
        [computers setObject:@"400" forKey:@"chromebook"];
        [computers setObject:@"700" forKey:@"dell"];
        [computers setObject:@"350" forKey:@"toshiba"];

        NSLog(@"%@", computers);

        [computers setObject:@"100" forKey:@"chromebook"];

        NSLog(@"%@", computers);

        [computers removeObjectForKey:@"toshiba"];

        NSLog(@"%@", computers);

        for (NSString *name in pokemon) {
            NSString *key = name;
            NSString *value = [pokemon objectForKey:key];
            NSLog(@"key: %@, value: %@", key, value);
        }
    }
    return 0;
}
