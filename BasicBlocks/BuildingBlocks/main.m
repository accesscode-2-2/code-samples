//
//  main.m
//  BuildingBlocks
//
//  Created by Michael Kavouras on 9/17/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MySimpleClass : NSObject

- (void)runTaskAndExecuteBlock:(void(^)(void))callbackBlock;
- (void)runTaskAndAdd5:(void(^)(int))callbackBlock;

@end

@implementation MySimpleClass

- (void)runTaskAndAdd5:(void(^)(int))callbackBlock {
    NSLog(@"running a different task...");
    
    sleep(3);
    
    callbackBlock(7);
}

- (void)runTaskAndExecuteBlock:(void (^)(void))callbackBlock {
    
    // do a bunch of really crazy stuff
    NSLog(@"running really long task...");
    
    sleep(3);
    callbackBlock();
}

@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        MySimpleClass *simpleClass = [[MySimpleClass alloc] init];
        
        void (^myBlock)(void) = ^{
            NSLog(@"done with long task");
        };
        
        [simpleClass runTaskAndExecuteBlock:myBlock];
        
        [simpleClass runTaskAndExecuteBlock:^{
            NSLog(@"done with another really long task");
        }];
        
        int i = 10;
        int b = 3;
        
//        int myOtherNumber = 100;
        [simpleClass runTaskAndExecuteBlock:^{
            NSLog(@"so happy %d", i);
            NSLog(@"not so happy %d", b);
            NSLog(@"this is another log");
            sleep(1);
            NSLog(@"things");
        }];
        
        int num = 5;
        void(^addFiveBlock)(int) = ^(int number) {
            NSLog(@"%d", number + num);
        };
        
        [simpleClass runTaskAndAdd5:addFiveBlock];
        
        // create a block with a nil value
        void (^ourFirstBlock)(void);
        
        
        // give ourFirstBlock a value
        ourFirstBlock = ^{
        };
        
        // execute ourFirstBlock
        ourFirstBlock();
        
        // create a block with nil value. returns a double and takes
        // two parameters
        double (^addTwoNumbers)(double, double);
        
        // give addTwoNumbers a value
        addTwoNumbers = ^(double firstNumber, double secondNumber) {
            return firstNumber + secondNumber;
        };
        
        double sum = addTwoNumbers(3, 4);
        NSLog(@"%f", sum);
        
        
        // declaring a variable of type int called myNumber with a value of 10
        int myNumber = 10;
        
        // declaring a variable of type void(void) called testBlock
        void (^testBlock)(void) = ^{
            NSLog(@"%d", myNumber);
        };
        
        testBlock();
        
        
        
        
        
        
        
        
        
        
        
        
        
        

    }
    return 0;
}
