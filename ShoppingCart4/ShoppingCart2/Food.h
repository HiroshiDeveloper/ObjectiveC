//
//  Food.h
//  ShoppingCart
//
//  Created by Hiroshi Tokutomi on 2017-03-06.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"

@interface Food : Product

@property int calorie;
@property int size;
@property (strong, nonatomic) NSArray* ingredients;

-(id)initWithAmount:(int)amount productId:(int)productId name:(NSString*)name price:(int)price country:(NSString*)country calorie:(int)calorie size:(int)size andIngredients:(NSArray<NSString*>*)ingredients;

@end
