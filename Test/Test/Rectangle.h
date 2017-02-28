//
//  Rectangle.h
//  Test
//
//  Created by Hiroshi Tokutomi on 2017-02-27.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Shape.h"

@interface Rectangle : Shape

//@property int length;
@property int width;

-(id) initWithLength:(int)length AndWidth:(int)width;

@end
