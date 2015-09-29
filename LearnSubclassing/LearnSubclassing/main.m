//
//  main.m
//  LearnSubclassing
//
//  Created by Michael Kavouras on 9/27/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

// declaration/definition of ClassA

@interface ClassA: NSObject // NSObject is the superclass

@property (nonatomic) NSString *firstName;
@property (nonatomic) NSString *lastName;

@end

@implementation ClassA

- (instancetype)init {
    if (self = [super init]) {
        self.firstName = @"mike";
        self.lastName = @"kavouras";
        return self;
    }
    return nil;
}

@end


// declaration/definition of ClassB

@interface ClassB: ClassA

@end

@implementation ClassB

- (instancetype)init {
    if (self = [super init]) {
        self.firstName = @"charles";
        self.lastName = @"kang";
        return self;
    }
    return nil;
}

@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        ClassA *firstClass = [[ClassA alloc] init];
        NSLog(@"firstClass.firstName = %@", firstClass.firstName);
        NSLog(@"firstClass.lastName = %@", firstClass.lastName);
        
        ClassB *secondClass = [[ClassB alloc] init];
        NSLog(@"secondClass.firstName = %@", secondClass.firstName);
        NSLog(@"secondClass.lastName = %@", secondClass.lastName);
    }
    return 0;
}
