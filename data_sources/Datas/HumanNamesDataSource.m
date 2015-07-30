//
//  HumanNamesDataSource.m
//  Datas
//
//  Created by Michael Kavouras on 7/30/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "HumanNamesDataSource.h"

@interface HumanNamesDataSource()

@property (nonatomic) NSArray *names;

@end

@implementation HumanNamesDataSource

- (instancetype)init {
    if (self = [super init]) {
        self.names = @[@"jackie", @"mike", @"max", @"carl", @"rachel", @"franklin"];
        return self;
    }
    
    return nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.names.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BasicCell" forIndexPath:indexPath];
    
    NSString *birdName = self.names[indexPath.row];
    cell.textLabel.text = birdName;
    
    return cell;
}

@end
