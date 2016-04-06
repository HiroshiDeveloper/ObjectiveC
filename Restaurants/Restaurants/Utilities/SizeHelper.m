//
//  SizeHelper.m
//  Restaurants
//
//  Created by Hiroshi on 4/5/16.
//  Copyright © 2016 Hiroshi. All rights reserved.
//

#import "SizeHelper.h"

@implementation SizeHelper

+(CGRect)googleMapSize
{
    return CGRectMake([UIScreen mainScreen].bounds.size.width * 0.01,
                      [UIScreen mainScreen].bounds.size.height * 0.15,
                      [UIScreen mainScreen].bounds.size.width * 0.98,
                      [UIScreen mainScreen].bounds.size.height * 0.7);
}

+(CGRect)imageSizeWithIndex:(int)index
{
    CGFloat imageSize = [UIScreen mainScreen].bounds.size.width * 0.2;
    CGFloat startHeight = [UIScreen mainScreen].bounds.size.height * 0.03;
    CGFloat margin = [UIScreen mainScreen].bounds.size.width * 0.01;
    
    switch (index) {
        case 0:
            return CGRectMake(margin, startHeight, imageSize, imageSize);
            break;
        case 1:
            return CGRectMake(margin * 2 + imageSize, startHeight, imageSize, imageSize);
            break;
        default:
            return CGRectMake(margin * 3 + imageSize * 2, startHeight, imageSize, imageSize);
            break;
    }
}

@end
