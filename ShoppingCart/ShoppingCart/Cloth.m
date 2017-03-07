//
//  Cloth.m
//  ShoppingCart
//
//  Created by Hiroshi Tokutomi on 2017-03-06.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import "Cloth.h"

@implementation Cloth

-(id)initWithAmount:(int)amount productId:(int)productId name:(NSString*)name price:(int)price country:(NSString*)country andMaterials:(NSMutableArray*)materials
{
    self = [super initWithAmount:(int)amount productId:productId name:name price:price andCountry:country];
    if(self){
        self.materials = materials;
    }
    return self;
    
}

@end
