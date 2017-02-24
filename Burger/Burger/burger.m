//
//  Burger.m
//  Burger
//
//  Created by Hiroshi Tokutomi on 2017-02-22.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import "Burger.h"

@implementation Burger

-(id) initWithName:(NSString*)name andPrice:(float)price
{
    self = [super init];
    if(self){
        self.name = name;
        self.price = price;
    }
    return self;
}

@end
