//
//  main.m
//  Linkedin
//
//  Created by Hiroshi Tokutomi on 2017-02-21.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Account.h"
#import "Profile.h"
#import "FeedsManager.h"
#import "Post.h"

int main(int argc, const char * argv[]) {
    
    // create an account object
    Account* myAccount = [[Account alloc] initWithUserName:@"Hiroshi" andPassword:@"123"];
    
    // check the boolean
    BOOL isValid = [myAccount isAccountValid];
    
    if(isValid == true){
        NSLog(@"TRUE");
    }else{
        NSLog(@"FALSE");
    }
    
    Profile* myProfile = [[Profile alloc] initWithFirstName:@"Hiroshi" lastName:@"T" address:@"North Vancouver" age:20 phoneNumber:@"123456" andProfilePic:@"google.ca"];
    [myProfile printProfile];
    
    FeedsManager* feedManager = [[FeedsManager alloc] init];
    NSArray<Post*>* listOfPost = [feedManager loadFeedsForAccount:myAccount amount:10];
    for(int i=0; i<listOfPost.count; i++){
        Post* post = [listOfPost objectAtIndex:i];
        [post show];
        [post reportThePost];
        User* user = [[User alloc] init];
        NSDate* date = [NSDate date];
        Like* like = [[Like alloc] initWithLikeId:1 likeOwner:user date:date];
        [post addLike:like];
    }
    
    return NSApplicationMain(argc, argv);
}
