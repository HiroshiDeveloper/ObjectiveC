//
//  Drink.m
//  ShoppingCart
//
//  Created by Hiroshi Tokutomi on 2017-03-06.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import "Drink.h"

@implementation Drink

-(id)initWithAmount:(int)amount productId:(int)productId name:(NSString*)name price:(int)price country:(NSString*)country diet:(BOOL)isDiet andSize:(int)size
{
    self = [super initWithAmount:(int)amount productId:productId name:name price:price andCountry:country];
    if(self){
        self.isDiet = isDiet;
        self.size = size;
    }
    return self;
}

@end
