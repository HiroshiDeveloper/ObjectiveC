//
//  Employee.m
//  Burger
//
//  Created by Hiroshi Tokutomi on 2017-02-22.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import "Employee.h"
#import "Burger.h"
#import "SpecialBurger.h"

@implementation Employee

-(id) initWithName:(NSString*)name andAge:(int)age
{
    self = [super init];
    if(self){
        self.name = name;
        self.age = age;
    }
    return self;
}

-(void) printThePrice:(Burger*)burger
{
    NSLog(@"The %@ is %f", burger.name, burger.price);
}

-(Burger*) makeBurger:(NSString*)name
{
    float price = [self setThePrice:name];
    if(price == 0){
        NSLog(@"Error. The burger is not in the menu.");
        exit(0);
    }
    Burger* burger = [[Burger alloc]initWithName:name andPrice:price];
    return burger;
}

-(SpecialBurger*) makeSpecialBurger
{
    SpecialBurger* specialBurger = [[SpecialBurger alloc]initWithTopping:@"olives" andSauce:@"Hot"];
    specialBurger.name = @"special";
    specialBurger.price = 9.8;
    
    return specialBurger;
}

-(float) setThePrice:(NSString*)name
{
    float price = 0;
    if([name isEqualToString:@"Cheese"]){
        price = 6.8;
    }else if([name isEqualToString:@"BBQ"]){
        price = 7.8;
    }
    return price;
}

@end
