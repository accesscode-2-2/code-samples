//
//  FlagTableViewController.m
//  Flags
//
//  Created by Michael Kavouras on 7/28/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "FlagTableViewController.h"
#import "FlagDetailViewController.h"
#import "WFCountry.h"

@interface FlagTableViewController ()

@property (nonatomic) NSMutableArray *countries;

@end

@implementation FlagTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"World Flags";
    
    self.countries = [[NSMutableArray alloc] init];
    
    // initialize the data in self.countries
    for (NSString *name in [WFCountry allCountries]) {
        WFCountry *country = [[WFCountry alloc] init];
        country.name = name;
        country.imageURLString = [[name lowercaseString] stringByReplacingOccurrencesOfString:@" " withString:@"_"];
        [self.countries addObject:country];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // determine the section and row for our selected cell
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    
    // retrieve the country from self.countries that corrosponds to
    // the selected cell
    WFCountry *country = [self.countries objectAtIndex:indexPath.row];
    
    // access the destinationViewController
    FlagDetailViewController *vc = segue.destinationViewController;
    
    // set the country property on the destinationViewController
    vc.country = country;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.countries.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CountryCellIdentifier" forIndexPath:indexPath];
    
    WFCountry *country = [self.countries objectAtIndex:indexPath.row];
    
    cell.textLabel.text = country.name;
    cell.imageView.image = [country image];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // get the data that we're going to pass
    WFCountry *country = self.countries[indexPath.row];
    
    // declare where your sending the data
    // if initializing from storyboard, make sure the storyboard id
    // is set in the attributes inspector
    FlagDetailViewController *detailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"FlagDetailController"];
    
    // pass the data over
    // make sure that the destination view controller has
    // a property to hold the data that you're passing
    detailViewController.country = country;
    
    // presents the detail view controller
    [self.navigationController pushViewController:detailViewController animated:YES];
    
    
}

@end