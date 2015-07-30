//
//  BirdNamesDataSource.m
//  Datas
//
//  Created by Michael Kavouras on 7/30/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "BirdNamesDataSource.h"

@interface BirdNamesDataSource()

@property (nonatomic) NSArray *birds;

@end

@implementation BirdNamesDataSource

- (instancetype)init {
    if (self = [super init]) {
        self.birds = @[@"ostrich", @"cassowary", @"blue jay", @"quetzal"];
        return self;
    }
    
    return nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.birds.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BasicCell" forIndexPath:indexPath];
    
    NSString *birdName = self.birds[indexPath.row];
    cell.textLabel.text = birdName;
    
    return cell;
}


@end
