//
//  InstagramPostViewController.m
//  LearnAPI
//
//  Created by Michael Kavouras on 9/19/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import "InstagramPostViewController.h"

@interface InstagramPostViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation InstagramPostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@", self.instagramPost);
    
    // get the images dictionary
    NSDictionary *images = [self.instagramPost objectForKey:@"images"];
    
    // get the standard resolution image dictionary
    NSDictionary *sr = [images objectForKey:@"standard_resolution"];
    
    NSString *urlString = [sr objectForKey:@"url"];
    NSURL *url = [NSURL URLWithString:urlString];
    NSData *pictureData = [NSData dataWithContentsOfURL:url];
    UIImage *picture = [UIImage imageWithData:pictureData];
    self.imageView.image = picture;
}



@end
