//
//  ViewController.m
//  LearnAPI
//
//  Created by Michael Kavouras on 9/19/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import "ViewController.h"
#import "InstagramPostViewController.h"

@interface ViewController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic) NSArray *instagramData;

@end

@implementation ViewController

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    InstagramPostViewController *viewController = segue.destinationViewController;
    NSDictionary *currentInstagramItem = self.instagramData[indexPath.row];
    viewController.instagramPost = currentInstagramItem;
    
}

- (void)GETRequestWithURL:(NSURL *)URL
        completionHandler:(void(^)(NSData *data, NSURLResponse *response, NSError *error))completionHandler {
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session dataTaskWithURL:URL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
          completionHandler(data, response, error);
        });
    }];
    
    [task resume];
    
}

- (IBAction)refreshTableView:(id)sender {
    [self fetchInstagramData];
}

- (void)fetchInstagramData {
    
    // create an instagram url
    NSURL *instagramURL = [NSURL URLWithString:@"https://api.instagram.com/v1/tags/nofilter/media/recent?client_id=ac0ee52ebb154199bfabfb15b498c067"];
    
    // fetch data from the instagram endpoint and print json response
    [self GETRequestWithURL:instagramURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        self.instagramData = [json objectForKey:@"data"];
        
        [self.tableView reloadData];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    
    [self fetchInstagramData];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.instagramData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier" forIndexPath:indexPath];
    
    NSDictionary *currentInstagramItem = self.instagramData[indexPath.row];
    NSDictionary *user = [currentInstagramItem objectForKey:@"user"];
    NSString *username = [user objectForKey:@"username"];
    cell.textLabel.text = username;
    
    return cell;
}


@end
