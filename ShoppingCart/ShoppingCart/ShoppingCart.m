//
//  ShoppingCart.m
//  ShoppingCart
//
//  Created by Hiroshi Tokutomi on 2017-03-06.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import "ShoppingCart.h"

@implementation ShoppingCart

-(NSMutableArray<Product*>*) addList:(NSMutableArray<Product*>*)list andProduct:(Product*) product
{
    [list addObject:product];
    return list;
}

@end
