//
//  JackieViewController.h
//  Protocols
//
//  Created by Michael Kavouras on 9/12/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JackieCommunicationProtocol.h"

@interface JackieViewController : UIViewController


// property of type id (any object) that conforms to
// the protocol <JackieCommunciationProtocol> called
// `delegate`
@property (nonatomic, weak) id <JackieCommunicationProtocol> delegate;

@end
