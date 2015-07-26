//
//  ACExerciseTableViewController.m
//  TableExercise
//
//  Created by Michael Kavouras on 7/26/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "ACExerciseTableViewController.h"

@interface ACExerciseTableViewController ()

@property (nonatomic) NSArray *randomNames;

@end

@implementation ACExerciseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.randomNames = @[@"charles", @"dan", @"artur", @"max", @"jackie", @"kaira", @"justine"];
    
    NSDictionary *pokemon = @[@"charizard"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.randomNames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AccessCodeIdentifier" forIndexPath:indexPath];
    
    NSString *name = self.randomNames[indexPath.row];
    cell.textLabel.text = name;
    
    cell.imageView.image = [UIImage imageNamed:name];
    
    return cell;
}


@end
