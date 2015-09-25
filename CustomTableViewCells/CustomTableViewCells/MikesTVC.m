//
//  MikesTVC.m
//  CustomTableViewCells
//
//  Created by Michael Kavouras on 9/24/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import "MikesTVC.h"
#import "MikeInstagramPost.h"
#import "APIManager.h"
#import "InstagramPostTableViewCell.h"

@interface MikesTVC ()

@property (nonatomic) NSMutableArray *searchResults;

@end

@implementation MikesTVC

- (void)fetchInstagramData {
    
    // create an instagram url
    NSURL *instagramURL = [NSURL URLWithString:@"https://api.instagram.com/v1/tags/nofilter/media/recent?client_id=ac0ee52ebb154199bfabfb15b498c067"];
    
    // fetch data from the instagram endpoint and print json response
    [APIManager GETRequestWithURL:instagramURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        NSArray *results = json[@"data"];
        
        // reset my array
        self.searchResults = [[NSMutableArray alloc] init];
        
        // loop through all json posts
        for (NSDictionary *result in results) {
            
            // create new post from json
            MikeInstagramPost *post = [[MikeInstagramPost alloc] initWithJSON:result];
            
            // add post to array
            [self.searchResults addObject:post];
        }
        
        [self.tableView reloadData];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchInstagramData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.searchResults.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    InstagramPostTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"InstagramCellIdentifier" forIndexPath:indexPath];
    
    MikeInstagramPost *post = self.searchResults[indexPath.row];
    
    cell.usernameLabel.text = [NSString stringWithFormat:@"@%@",post.username];
    
    cell.likeCountLabel.text = [NSString stringWithFormat:@"Like: %ld", post.likeCount];
    
    cell.tagCountLabel.text = [NSString stringWithFormat:@"Tags: %ld", post.tags.count];
    
    cell.captionLabel.text = post.caption[@"text"];
    
    return cell;
}





@end
