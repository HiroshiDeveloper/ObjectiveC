//
//  SizeHelper.m
//  Restaurants
//
//  Created by Hiroshi on 4/5/16.
//  Copyright © 2016 Hiroshi. All rights reserved.
//

#import "SizeHelper.h"

@implementation SizeHelper

+(CGRect)barSize
{
    return CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height * 0.1);
}

+(CGRect)googleMapSize
{
    CGFloat margin = [UIScreen mainScreen].bounds.size.width * 0.01;
    CGFloat startHeight = margin * 3 + [UIScreen mainScreen].bounds.size.height * 0.1 + [UIScreen mainScreen].bounds.size.width * 0.2 + [UIScreen mainScreen].bounds.size.height * 0.1;
    return CGRectMake(margin,
                      startHeight,
                      [UIScreen mainScreen].bounds.size.width * 0.98,
                      [UIScreen mainScreen].bounds.size.height - startHeight - margin);
}

+(CGRect)imageSizeWithIndex:(int)index
{
    CGFloat imageSize = [UIScreen mainScreen].bounds.size.width * 0.2;
    CGFloat margin = [UIScreen mainScreen].bounds.size.width * 0.01;
    CGFloat startHeight = [UIScreen mainScreen].bounds.size.height * 0.1 + margin;
    
    switch (index)
    {
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

+(CGRect)reviewSizeWithIndex:(int)index
{
    CGFloat imageSize = [UIScreen mainScreen].bounds.size.width * 0.1;
    CGFloat startWidth = [UIScreen mainScreen].bounds.size.width * 0.65;
    CGFloat startHeight = [UIScreen mainScreen].bounds.size.height * 0.13;
    CGFloat margin = [UIScreen mainScreen].bounds.size.width * 0.01;
    
    switch (index)
    {
        case 0:
            return CGRectMake(startWidth, startHeight, imageSize, imageSize);
            break;
        case 1:
            return CGRectMake(startWidth + margin + imageSize, startHeight, imageSize, imageSize);
            break;
        default:
            return CGRectMake(startWidth + margin * 2 + imageSize * 2, startHeight, imageSize, imageSize);
            break;
    }
}

+(CGRect)plusLabelSize
{
    CGFloat plusLabelSize = [UIScreen mainScreen].bounds.size.width * 0.15;
    return CGRectMake(0, 0, plusLabelSize, plusLabelSize);
}

+(CGRect)listButtonSize
{
    return CGRectMake([UIScreen mainScreen].bounds.size.width * 0.8,
                      [UIScreen mainScreen].bounds.size.height * 0.15,
                      [UIScreen mainScreen].bounds.size.width * 0.15,
                      [UIScreen mainScreen].bounds.size.width * 0.1);
}

+(CGRect)commentSize
{
    CGFloat margin = [UIScreen mainScreen].bounds.size.width * 0.01;
    CGFloat startHeight = margin * 2 + [UIScreen mainScreen].bounds.size.height * 0.1 + [UIScreen mainScreen].bounds.size.width * 0.2;
    
    return CGRectMake(margin, startHeight, [UIScreen mainScreen].bounds.size.width * 0.98, [UIScreen mainScreen].bounds.size.height * 0.1);
}

@end
