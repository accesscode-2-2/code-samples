//
//  iTunesMusicResult.h
//  iTunesAPIPlayground
//
//  Created by Michael Kavouras on 9/20/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface iTunesMusicResult : NSObject

@property (nonatomic) NSString *album;
@property (nonatomic) NSString *artist;
@property (nonatomic) NSString *previewUrl;

- (AVPlayerItem *)audioPreviewItem;

@end
