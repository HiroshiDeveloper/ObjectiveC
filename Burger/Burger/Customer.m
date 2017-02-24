//
//  Customer.m
//  Burger
//
//  Created by Hiroshi Tokutomi on 2017-02-22.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import "Customer.h"

@implementation Customer

-(id) initWithName:(NSString*)name andAge:(int)age
{
    self = [super init];
    if(self){
        self.name = name;
        self.age = age;
    }
    return self;
}

-(NSString*) orderBurgerWithName:(NSString*)name
{
    return name;
}

@end
