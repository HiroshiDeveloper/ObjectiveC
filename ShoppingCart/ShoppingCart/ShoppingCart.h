//
//  ShoppingCart.h
//  ShoppingCart
//
//  Created by Hiroshi Tokutomi on 2017-03-06.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"

@interface ShoppingCart : NSObject

-(NSMutableArray<Product*>*) addList:(NSMutableArray<Product*>*)list andProduct:(Product*) product;

@end
