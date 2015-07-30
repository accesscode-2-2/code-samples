//
//  JackieTableViewController.m
//  Datas
//
//  Created by Michael Kavouras on 7/30/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "JackieTableViewController.h"
#import "BirdNamesDataSource.h"
#import "HumanNamesDataSource.h"

@interface JackieTableViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@property (nonatomic) id<UITableViewDataSource>dataSource;

@end

@implementation JackieTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSource = [[BirdNamesDataSource alloc] init];
    self.tableView.dataSource = self.dataSource;
}

- (IBAction)segmentedControlChanged:(UISegmentedControl *)sender {
    [self.tableView reloadData];
    
    if (sender.selectedSegmentIndex == 0) {
        self.dataSource = [[BirdNamesDataSource alloc] init];
    } else {
        self.dataSource = [[HumanNamesDataSource alloc] init];
    }
    
    self.tableView.dataSource = self.dataSource;
    [self.tableView reloadData];
}

@end
