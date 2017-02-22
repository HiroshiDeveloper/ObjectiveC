//
//  Account.h
//  Linkedin
//
//  Created by Hiroshi Tokutomi on 2017-02-21.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Account : NSObject

@property (strong, nonatomic) NSString* userName;
@property (strong, nonatomic) NSString* password;

// constructors
-(id) initWithUserName:(NSString*)userName andPassword:(NSString*)password;

// methods(APIs)
-(BOOL)isAccountValid;

@end
