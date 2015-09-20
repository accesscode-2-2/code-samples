//
//  iTunesMusicViewController.m
//  iTunesAPIPlayground
//
//  Created by Michael Kavouras on 9/20/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import "iTunesMusicViewController.h"
#import "APIManager.h"
#import "iTunesMusicResult.h"
#import <AVFoundation/AVFoundation.h>

@interface iTunesMusicViewController ()
<
UITableViewDataSource,
UITableViewDelegate,
UITextFieldDelegate
>

@property (weak, nonatomic) IBOutlet UITextField *searchTextField;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic) NSMutableArray *searchResults;

@property (nonatomic) AVPlayer *audioPlayer;

@end

@implementation iTunesMusicViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.searchTextField.delegate = self;
}

- (void)makeNewiTunesRequestWithSearchTerm:(NSString *)searchTerm
                             callbackBlock:(void(^)())block {

    // searchTerm (comes from our parameter)
    
    // url (media=music, term=searchTerm)
    NSString *urlString = [NSString stringWithFormat:@"https://itunes.apple.com/search?media=music&term=%@", searchTerm];
    
    // encoded url
    NSString *encodedString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSLog(@"%@", encodedString);
    
    // convert urlString to url
    NSURL *url = [NSURL URLWithString:encodedString];
    
    // make the request
    [APIManager GETRequestWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (data != nil) {
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            
            NSArray *results = [json objectForKey:@"results"];
            self.searchResults = [[NSMutableArray alloc] init];
            for (NSDictionary *result in results) {
                
                iTunesMusicResult *musicObject = [[iTunesMusicResult alloc] init];
                musicObject.artist = [result objectForKey:@"artistName"];
                musicObject.album = [result objectForKey:@"collectionName"];
                musicObject.previewUrl = [result objectForKey:@"previewUrl"];
                
                [self.searchResults addObject:musicObject];
            }
            
            block();
        }
    }];
    
}

#pragma mark - table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.searchResults.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier" forIndexPath:indexPath];
    
    iTunesMusicResult *currentResult = self.searchResults[indexPath.row];
    cell.textLabel.text = currentResult.artist;
    cell.detailTextLabel.text = currentResult.album;
    
    return cell;
}

#pragma mark - table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    iTunesMusicResult *result = self.searchResults[indexPath.row];
    
    self.audioPlayer = [[AVPlayer alloc] initWithPlayerItem:[result audioPreviewItem]];
    [self.audioPlayer play];
}

#pragma mark - text field delegate

// user tapped "return"
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    // dismiss the keyboard
    [self.view endEditing:YES];
    
    // make an api request
    [self makeNewiTunesRequestWithSearchTerm:textField.text callbackBlock:^{
        [self.tableView reloadData];
    }];
    
    return YES;
}

@end
