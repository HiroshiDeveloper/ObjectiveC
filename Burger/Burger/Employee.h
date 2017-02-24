//
//  Employee.h
//  Burger
//
//  Created by Hiroshi Tokutomi on 2017-02-22.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Burger.h"
#import "SpecialBurger.h"

@interface Employee : NSObject

@property (strong, nonatomic) NSString* name;
@property int age;
//@property (strong, nonatomic) Burger* Burger;

-(id) initWithName:(NSString*)name andAge:(int)age;

-(void) printThePrice:(Burger*)burger;
-(Burger*) makeBurger:(NSString*)name;
-(float) setThePrice:(NSString*)name;
-(SpecialBurger*) makeSpecialBurger;

@end
