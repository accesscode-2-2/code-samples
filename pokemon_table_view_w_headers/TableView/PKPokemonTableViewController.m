//
//  PKPokemonTableViewController.m
//  PKTableViews
//
//  Created by Michael Kavouras on 7/26/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "PKPokemonTableViewController.h"

@interface PKPokemonTableViewController ()

@property (nonatomic) NSDictionary *tableData;

@end

@implementation PKPokemonTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *fire = @[ @"charizard", @"magmar", @"flareon" ];
    NSArray *water = @[ @"squirtle", @"polywhirl", @"magikarp", @"mudkip" ];
    NSArray *grass = @[ @"scyther", @"treecko" ];
    
    self.tableData = @{@"fire" : fire, @"water" : water, @"grass" : grass};
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.tableData allKeys].count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *keys = [self.tableData allKeys];
    NSString *key = keys[section];
    NSArray *pokemonArray = [self.tableData objectForKey:key];
    return pokemonArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PokemonCellIdentifier" forIndexPath:indexPath];
    
    NSArray *keys = [self.tableData allKeys];
    NSString *key = keys[indexPath.section];
    NSArray *pokemonArray = [self.tableData objectForKey:key];
    
    cell.textLabel.text = (NSString *)pokemonArray[indexPath.row];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSArray *keys = [self.tableData allKeys];
    NSString *key = keys[section];
    NSArray *pokemonArray = [self.tableData objectForKey:key];
    return key;
}


@end
