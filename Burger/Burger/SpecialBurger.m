//
//  SpecialBurger.m
//  Burger
//
//  Created by Hiroshi Tokutomi on 2017-03-06.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import "SpecialBurger.h"

@implementation SpecialBurger

-(id)initWithTopping:(NSString*)topping andSauce:(NSString*)sauce
{
    self = [super init];
    if(self){
        self.topping = topping;
        self.sauce = sauce;
    }
    return self;
}

@end
