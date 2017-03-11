//
//  Material.m
//  ShoppingCart
//
//  Created by Hiroshi Tokutomi on 2017-03-09.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import "Material.h"

@implementation Material

-(id)initWithCode:(int)code andMaterial:(NSString*)material
{
    self = [super init];
    if(self){
        self.code = code;
        self.material = material;
    }
    return self;
}

@end
