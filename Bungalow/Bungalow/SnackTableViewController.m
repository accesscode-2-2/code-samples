//
//  SnackTableViewController.m
//  Bungalow
//
//  Created by Michael Kavouras on 10/3/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "SnackTableViewController.h"
#import "AppDelegate.h"
#import "Snack.h"

@interface SnackTableViewController () <NSFetchedResultsControllerDelegate>

@property (nonatomic) NSFetchedResultsController *fetchedResultsController;

@end

@implementation SnackTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    
    // create the criteria for our fetch request
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:[Snack entityName]];
    
    // create a sort descriptor sorting by flavor descending
    NSSortDescriptor *flavorSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"flavor" ascending:NO];
    
    // set the sortDescriptors on the fetch request
    fetchRequest.sortDescriptors = @[ flavorSortDescriptor ];
    
    // create the object to perform the fetch request
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:delegate.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    
    // actually perform the fetch
    [self.fetchedResultsController performFetch:nil];
    
    self.fetchedResultsController.delegate = self;
    
    [self.tableView reloadData];
    
    // loop and print
    for (Snack *snack in self.fetchedResultsController.fetchedObjects) {
        NSLog(@"%@", snack.flavor);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.fetchedResultsController.fetchedObjects.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SnackCellIdentifier" forIndexPath:indexPath];
    
    Snack *snack = self.fetchedResultsController.fetchedObjects[indexPath.row];
    
    cell.textLabel.text = snack.name;
    cell.detailTextLabel.text = snack.flavor;
    
    return cell;
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath
{
    [self.tableView reloadData];
}

@end
