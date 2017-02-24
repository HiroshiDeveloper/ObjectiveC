//
//  Burger.h
//  Burger
//
//  Created by Hiroshi Tokutomi on 2017-02-22.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Burger : NSObject

@property (strong, nonatomic) NSString* name;
@property float price;

-(id) initWithName:(NSString*)name andPrice:(float)price;

@end
