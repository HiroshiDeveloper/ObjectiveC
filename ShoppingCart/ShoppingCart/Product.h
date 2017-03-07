//
//  Product.h
//  ShoppingCart
//
//  Created by Hiroshi Tokutomi on 2017-03-06.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property int amount;
@property int productId;
@property (strong, nonatomic) NSString* name;
@property int price;
@property (strong, nonatomic) NSString* country;

-(id)initWithAmount:(int)amount productId:(int)productId name:(NSString*)name price:(int)price andCountry:(NSString*)country;

@end
