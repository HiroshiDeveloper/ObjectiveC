//
//  Shape.m
//  Test
//
//  Created by Hiroshi Tokutomi on 2017-02-27.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import "Shape.h"

@implementation Shape

-(id) initWithLength:(int)length
{
    self = [super init];
    if(self){
        self.length = length;
    }
    return self;
}

-(float) area
{
    return 0;
}

-(float) circumference
{
    return 0;
}

@end
