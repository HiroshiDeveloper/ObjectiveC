//
//  Circle.m
//  Test
//
//  Created by Hiroshi Tokutomi on 2017-02-27.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import "Circle.h"

@implementation Circle

-(id) initWithRadius:(int)radius
{
    self = [super initWithLength:radius];

    return self;
}

-(float) area
{
    float a = 3.14 * self.length * self.length;
    return a;
}

-(float) circumference
{
    return 2 * self.length * 3.14;
}

@end
