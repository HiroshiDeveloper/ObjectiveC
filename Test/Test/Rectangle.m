//
//  Rectangle.m
//  Test
//
//  Created by Hiroshi Tokutomi on 2017-02-27.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import "Rectangle.h"

@implementation Rectangle

-(id) initWithLength:(int)length AndWidth:(int)width
{
    self = [super initWithLength:length];
    if(self)
    {
        self.width = width;
    }
    return self;
}

-(float) area
{
    float a = self.width * self.length;
    return a;
}

-(float) circumference
{
    return 2 * (self.length + self.width);
}

@end
