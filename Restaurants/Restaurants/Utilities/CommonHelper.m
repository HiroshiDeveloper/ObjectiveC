//
//  CommonHelper.m
//  Restaurants
//
//  Created by Hiroshi on 4/5/16.
//  Copyright © 2016 Hiroshi. All rights reserved.
//

#import "CommonHelper.h"

@implementation CommonHelper

+ (instancetype) sharedInstance
{
    static CommonHelper *instance;
    
    if (!instance)
    {
        instance = [[CommonHelper alloc] initPrivate];
    }
    
    return instance;
}

- (instancetype) init
{
    @throw [NSException exceptionWithName:@"Wrong Initializer" reason:@"Please use sharedInstance" userInfo:nil];
}

- (instancetype) initPrivate
{
    self = [super init];
    return self;
}

- (MKMapView *) makeViewWithFrame:(CGRect)size
{
    return [[MKMapView alloc] initWithFrame:size];
}

@end
