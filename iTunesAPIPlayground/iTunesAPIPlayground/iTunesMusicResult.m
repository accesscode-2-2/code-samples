//
//  iTunesMusicResult.m
//  iTunesAPIPlayground
//
//  Created by Michael Kavouras on 9/20/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import "iTunesMusicResult.h"

@implementation iTunesMusicResult

- (AVPlayerItem *)audioPreviewItem {
    return [AVPlayerItem playerItemWithURL:[NSURL URLWithString:self.previewUrl]];
}

@end
