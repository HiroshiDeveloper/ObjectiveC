//
//  Cloth.h
//  ShoppingCart
//
//  Created by Hiroshi Tokutomi on 2017-03-06.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"
#import "Material.h"

@interface Cloth : Product;

@property (strong, nonatomic) NSMutableArray* materials;

-(id)initWithAmount:(int)amount productId:(int)productId name:(NSString*)name price:(int)price country:(NSString*)country andMaterials:(NSMutableArray<Material*>*)materials;

@end
