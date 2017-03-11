//
//  Product.m
//  ShoppingCart
//
//  Created by Hiroshi Tokutomi on 2017-03-06.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import "Product.h"

@implementation Product

-(id)initWithAmount:(int)amount productId:(int)productId name:(NSString*)name price:(int)price andCountry:(NSString*)country
{
    self = [super init];
    if(self){
        self.amount = amount;
        self.productId = productId;
        self.name = name;
        self.price = price;
        self.country = country;
        self.totalCost = 0;
    }
    return self;
}

-(int)getCost
{
    return self.totalCost;
}

-(void)setCost:(int)cost
{
    self.totalCost = cost;
}

@end
