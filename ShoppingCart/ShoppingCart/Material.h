//
//  Material.h
//  ShoppingCart
//
//  Created by Hiroshi Tokutomi on 2017-03-09.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Material : NSObject

@property int code;
@property NSString* material;

-(id)initWithCode:(int)code andMaterial:(NSString*)material;

@end
