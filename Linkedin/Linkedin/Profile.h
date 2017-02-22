//
//  Profile.h
//  Linkedin
//
//  Created by Hiroshi Tokutomi on 2017-02-21.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Profile : NSObject

// propeties
@property (strong, nonatomic) NSString* firstName;
@property (strong, nonatomic) NSString* lastName;
@property (strong, nonatomic) NSString* address;
@property int age;
@property (strong, nonatomic) NSString* phoneNumber;
@property (strong, nonatomic) NSString* profilePic;

// constructions
-(id) initWithFirstName:(NSString*)firstName lastName:(NSString*)lastName address:(NSString*)address age:(int)age phoneNumber:(NSString*)phoneNumber andProfilePic:(NSString*)profilePic;

// methods
-(void) editProfileWithNewFirstName:(NSString*)firstName newLastName:(NSString*)lastName newAddress:(NSString*)address newAge:(int)age newPhoneNumber:(NSString*)phoneNumber andNewProfilePic:(NSString*)profilePic;
-(void) saveProfile;
-(void) printProfile;

@end
