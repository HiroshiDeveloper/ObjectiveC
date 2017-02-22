//
//  Account.m
//  Linkedin
//
//  Created by Hiroshi Tokutomi on 2017-02-21.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import "Account.h"

@implementation Account

-(id) initWithUserName:(NSString*)userName andPassword:(NSString*)password
{
    // super : my parent -> NSObject
    self = [super init];
    if(self){
        self.userName = userName;
        self.password = password;
    }
    return self;
}

// methods(APIs)
-(BOOL)isAccountValid
{
    return true;
}


@end
