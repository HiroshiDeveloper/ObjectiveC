//
//  Customer.h
//  Burger
//
//  Created by Hiroshi Tokutomi on 2017-02-22.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Customer : NSObject

@property (strong, nonatomic) NSString* name;
@property int age;

-(id) initWithName:(NSString*)name andAge:(int)age;
-(NSString*) orderBurgerWithName:(NSString*)name;

@end
