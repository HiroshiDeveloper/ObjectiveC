//
//  Food.m
//  ShoppingCart
//
//  Created by Hiroshi Tokutomi on 2017-03-06.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import "Food.h"

@implementation Food

-(id)initWithAmount:(int)amount productId:(int)productId name:(NSString*)name price:(int)price country:(NSString*)country calorie:(int)calorie size:(NSString*)size andIngredients:(NSMutableArray*)ingredients
{
    self = [super initWithAmount:(int)amount productId:productId name:name price:price andCountry:country];
    if(self){
        self.calorie = calorie;
        self.size = size;
        self.ingredients = ingredients;
    }
    return self;
}

@end
