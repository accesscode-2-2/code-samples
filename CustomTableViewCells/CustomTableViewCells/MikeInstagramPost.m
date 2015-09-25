//
//  MikeInstagramPost.m
//  CustomTableViewCells
//
//  Created by Michael Kavouras on 9/24/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import "MikeInstagramPost.h"

@implementation MikeInstagramPost

- (instancetype)initWithJSON:(NSDictionary *)json {
    
    if (self = [super init]) {
        
        self.tags = json[@"tags"];
        self.commentCount = [json[@"comments"][@"count"] integerValue];
//        self.commentCount = [[[json objectForKey:@"comments"] objectForKey:@"count"] integerValue];
        self.likeCount = [json[@"likes"][@"count"] integerValue];
        self.caption = json[@"caption"];
        self.username = json[@"user"][@"username"];
        self.fullName = json[@"user"][@"full_name"];
        
        return self;
    }
    return nil;
}

@end
