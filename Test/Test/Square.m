//
//  Square.m
//  Test
//
//  Created by Hiroshi Tokutomi on 2017-02-27.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import "Square.h"

@implementation Square

-(id) initWithLength:(int)length
{
    self = [super initWithLength:length];

    return self;
}

-(float) area
{
    float a = self.length * self.length;
    return a;
}

-(float) circumference
{
    return 4 * self.length;
}

@end
