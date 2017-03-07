//
//  main.m
//  Test
//
//  Created by Hiroshi Tokutomi on 2017-02-16.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Rectangle.h"
#import "Shape.h"
#import "Circle.h"
#import "Square.h"


int main(int argc, char * argv[]) {
    
    NSMutableArray<Shape*>* shapes = [[NSMutableArray alloc] init];
    
    Rectangle* r1 = [[Rectangle alloc] initWithLength:6 AndWidth:5];
    Circle* c1 = [[Circle alloc] initWithRadius:6];
    Square* s1 = [[Square alloc] initWithLength:6];
    
    [shapes addObject:r1];
    [shapes addObject:c1];
    [shapes addObject:s1];
    
    float totalArea = 0;
    
    for(int i = 0; i < shapes.count; i++){
        Shape* sh = [shapes objectAtIndex:i];
        if([sh isMemberOfClass:[Rectangle class]]){
            totalArea += shapes[i].area;
        }
        else if([sh isMemberOfClass:[Circle class]]){
            totalArea += shapes[i].area;
        }
        else if([sh isMemberOfClass:[Square class]]){
            totalArea += shapes[i].area;
        }
    }
    NSLog(@"%f", totalArea);
    
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
    
}
