//
//  SpecialBurger.h
//  Burger
//
//  Created by Hiroshi Tokutomi on 2017-03-06.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Burger.h"

@interface SpecialBurger : Burger

@property (strong, nonatomic) NSString* topping;
@property (strong, nonatomic) NSString* sauce;

-(id)initWithTopping:(NSString*)topping andSauce:(NSString*)sauce;

@end
