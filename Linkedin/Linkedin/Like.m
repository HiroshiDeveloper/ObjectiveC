//
//  Like.m
//  Linkedin
//
//  Created by Hiroshi Tokutomi on 2017-02-21.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import "Like.h"

@implementation Like

-(id)initWithLikeId:(int)likeId likeOwner:(User*)likeOwner date:(NSDate*)date
{
    self = [super init];
    if(self)
    {
        self.likeId = likeId;
        self.likeOwner = likeOwner;
        self.date = date;
    }
    return self;
}

@end
