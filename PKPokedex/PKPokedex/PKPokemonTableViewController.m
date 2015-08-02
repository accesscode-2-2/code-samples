//
//  PKPokemonTableViewController.m
//  PKPokedex
//
//  Created by Michael Kavouras on 8/1/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "PKPokemonTableViewController.h"
#import "PKDetailViewController.h"
#import "PKPokedex.h"

@interface PKPokemonTableViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@property (nonatomic) PKPokedex *model;

@end

@implementation PKPokemonTableViewController

#pragma mark - Life cycle methods

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.model = [[PKPokedex alloc] init];
    [self.model initializeData];
    
    self.navigationItem.title = @"Pokedex";
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (self.segmentedControl.selectedSegmentIndex == 0) {
        return 1;
    } else {
        return [self.model.typePokedex allKeys].count;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.segmentedControl.selectedSegmentIndex
        == 0) {
       return self.model.aToZPokedex.count;
    } else {
        NSArray *keys = [self.model.typePokedex allKeys];
        NSString *key = [keys objectAtIndex:section];
        NSArray *values = [self.model.typePokedex objectForKey:key];
        return values.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PokemonCellIdentifier" forIndexPath:indexPath];
    
    NSString *pokemonName = [self objectForIndexPath:indexPath];
    cell.textLabel.text = pokemonName;
    cell.imageView.image = [UIImage imageNamed:[pokemonName lowercaseString]];
   
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (self.segmentedControl.selectedSegmentIndex == 1) {
        NSArray *keys = [self.model.typePokedex allKeys];
        return keys[section];
    } else {
      return nil;
    }
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return [@"a.b.c.d.e.f.g.h.i.j.k.l.m.n.o.p.q.r.s.t.u.v.w.x.y.z" componentsSeparatedByString:@"."];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"preparing...");
    
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    
    NSString *pokemonName = [self objectForIndexPath:indexPath];
    
    PKDetailViewController *detailViewController = segue.destinationViewController;
    detailViewController.pokemonName = [pokemonName capitalizedString];
}

#pragma mark - IBAction

- (IBAction)segmentSelected:(UISegmentedControl *)sender {
    [self.tableView reloadData];
}

- (NSString *)objectForIndexPath:(NSIndexPath *)indexPath {
    if (self.segmentedControl.selectedSegmentIndex == 0) {
        return self.model.aToZPokedex[indexPath.row];
    } else {
        NSArray *keys = [self.model.typePokedex allKeys];
        NSString *key = [keys objectAtIndex:indexPath.section];
        NSArray *values = [self.model.typePokedex objectForKey:key];
        return values[indexPath.row];
    }
}

@end
