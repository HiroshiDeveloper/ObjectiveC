//
//  ShoppingCart.m
//  ShoppingCart
//
//  Created by Hiroshi Tokutomi on 2017-03-06.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import "ShoppingCart.h"
#import "Food.h"

@implementation ShoppingCart

-(id)init{
    self = [super init];
    if(self){
        self.list = [[NSMutableArray alloc] init];
        self.totalPrice = 0;
    }
    return self;
}

-(void)addProduct:(Product*) product
{
    [self.list addObject:product];
}

-(void)calculate
{
    int total;
    for(int i=0; i<self.list.count; i++)
    {
        total += [[self.list objectAtIndex:i] getCost];
    }
    NSLog(@"The total price is %d", total);
}

-(void)printOut
{
    for(int i=0; i<self.list.count; i++)
    {
        NSLog(@"#%d : %@", i+1, [self.list objectAtIndex:i].name);
    }
}

@end
