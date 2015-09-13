//
//  JackieCommunicationProtocol.h
//  Protocols
//
//  Created by Michael Kavouras on 9/12/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JackieCommunicationProtocol <NSObject>

@required

- (void)jackieSayWhat:(NSString *)whatJackieSaid;

@optional

- (void)jackieViewControllerDidLoad;

@end
