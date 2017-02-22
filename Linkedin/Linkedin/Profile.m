//
//  Profile.m
//  Linkedin
//
//  Created by Hiroshi Tokutomi on 2017-02-21.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import "Profile.h"

@implementation Profile

-(id) initWithFirstName:(NSString*)firstName lastName:(NSString*)lastName address:(NSString*)address age:(int)age phoneNumber:(NSString*)phoneNumber andProfilePic:(NSString*)profilePic
{
    self = [super init];
    if(self){
        self.firstName = firstName;
        self.lastName = lastName;
        self.address = address;
        self.age = age;
        self.phoneNumber = phoneNumber;
        self.profilePic = profilePic;
    }
    return self;
}

-(void) editProfileWithNewFirstName:(NSString*)firstName newLastName:(NSString*)lastName newAddress:(NSString*)address newAge:(int)age newPhoneNumber:(NSString*)phoneNumber andNewProfilePic:(NSString*)profilePic
{
    self.firstName = firstName;
    self.lastName = lastName;
    self.address = address;
    self.age = age;
    self.phoneNumber = phoneNumber;
    self.profilePic = profilePic;
}

-(void) saveProfile{
    NSLog(@"Your account has been updated\n");
}

-(void) printProfile{
    NSLog(@"===\n");
    NSLog(@"First Name is %@\n", self.firstName);
    NSLog(@"===\n");
}

@end
