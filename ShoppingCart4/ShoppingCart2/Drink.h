//
//  Drink.h
//  ShoppingCart
//
//  Created by Hiroshi Tokutomi on 2017-03-06.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"

@interface Drink : Product

@property BOOL isDiet;
@property int size;

-(id)initWithAmount:(int)amount productId:(int)productId name:(NSString*)name price:(int)price country:(NSString*)country diet:(BOOL)isDiet andSize:(int)size;
@end
