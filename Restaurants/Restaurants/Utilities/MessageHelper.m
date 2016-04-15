//
//  MessageHelper.m
//  Restaurants
//
//  Created by Hiroshi on 4/14/16.
//  Copyright © 2016 Hiroshi. All rights reserved.
//

#import "MessageHelper.h"

@implementation MessageHelper

+ (NSString *)restaurantMsg
{
    return @"Select your favorite restaurant!";
}

+ (NSString *)commentMsg
{
    return @"What's your comments for the restaurant? Type here!";
}

+ (NSString *)alertMsg
{
    return @"Please tap the annotation that you want to record at!";
}

+ (NSString *)confirmMsg
{
    return @"Are you saving the information?";
}

@end
