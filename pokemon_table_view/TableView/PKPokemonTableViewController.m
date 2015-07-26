//
//  PKPokemonTableViewController.m
//  PKTableViews
//
//  Created by Michael Kavouras on 7/26/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "PKPokemonTableViewController.h"

@interface PKPokemonTableViewController ()

@property (nonatomic) NSArray *tableData;

@end

@implementation PKPokemonTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *fire  = @[@"charizard", @"magmar", @"flareon"];
    NSArray *water = @[@"squirtle", @"polywhirl", @"magikarp", @"mudkip"];
    NSArray *grass = @[@"scyther", @"treecko"];
    
    self.tableData = @[fire, water, grass];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.tableData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ((NSArray *)self.tableData[section]).count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PokemonIdentifier" forIndexPath:indexPath];
    
    NSArray *pokemonArray = self.tableData[indexPath.section];
    
    cell.textLabel.text = (NSString *)pokemonArray[indexPath.row];
    
    return cell;
}

@end
