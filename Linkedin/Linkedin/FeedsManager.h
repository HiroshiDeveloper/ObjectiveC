//
//  FeedsManager.h
//  Linkedin
//
//  Created by Hiroshi Tokutomi on 2017-02-21.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Account.h"

@interface FeedsManager : NSObject

// properties

// constructures

// methods
-(NSArray*) loadFeedsForAccount:(Account*)account amount:(int)numberOfFeeds;

@end
