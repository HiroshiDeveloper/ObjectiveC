//
//  main.m
//  Burger
//
//  Created by Hiroshi Tokutomi on 2017-02-22.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Burger.h"
#import "Employee.h"
#import "Customer.h"
#import "SpecialBurger.h"

int main(int argc, const char * argv[]) {
    
    // create a customer
    Customer* Shinji = [[Customer alloc]initWithName:@"Shinji" andAge:18];
    // create an employee
    Employee* Hiroshi = [[Employee alloc]initWithName:@"Hiroshi" andAge:25];
    
    // cutomer orders
    NSString* burger = [Shinji orderBurgerWithName:@"Cheese"];
    
    // employee makes the burger
    Burger* Burger = [Hiroshi makeBurger:burger];
    SpecialBurger* SpecialBurger = [Hiroshi makeSpecialBurger];
    
    // employee prints out the recipt
    [Hiroshi printThePrice:Burger];
    [Hiroshi printThePrice:SpecialBurger];
    
    NSLog(@"\n\n");
    
    return NSApplicationMain(argc, argv);
}
