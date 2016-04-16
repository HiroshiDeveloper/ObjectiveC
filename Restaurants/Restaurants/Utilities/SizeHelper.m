//
//  SizeHelper.m
//  Restaurants
//
//  Created by Hiroshi on 4/5/16.
//  Copyright © 2016 Hiroshi. All rights reserved.
//

#import "SizeHelper.h"

@implementation SizeHelper

+ (CGFloat)margin
{
    return [UIScreen mainScreen].bounds.size.width * 0.01;
}

+ (CGFloat)imgMapStartHeight
{
    return [UIScreen mainScreen].bounds.size.height * 0.1 + [self margin];
}

+ (CGFloat)reviewImgSize
{
    return [UIScreen mainScreen].bounds.size.width * 0.1;
}

+ (CGFloat)picImgSize
{
    return [UIScreen mainScreen].bounds.size.width * 0.2;
}

+ (CGFloat)labelSize
{
    return [UIScreen mainScreen].bounds.size.height * 0.05;
}

+ (CGRect)barSize
{
    return CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height * 0.1);
}

+ (CGRect)googleMapSize
{
    return CGRectMake([self margin],
                      [self imgMapStartHeight],
                      [UIScreen mainScreen].bounds.size.width * 0.98,
                      [UIScreen mainScreen].bounds.size.height - [self imgMapStartHeight] - [self margin]);
}

+(CGRect)imageSizeWithIndex:(int)index
{
    switch (index)
    {
        case 0:
            return CGRectMake([self margin], [self imgMapStartHeight], [self picImgSize], [self picImgSize]);
            break;
        case 1:
            return CGRectMake([self margin] * 2 + [self picImgSize], [self imgMapStartHeight], [self picImgSize], [self picImgSize]);
            break;
        default:
            return CGRectMake([self margin] * 3 + [self picImgSize] * 2, [self imgMapStartHeight], [self picImgSize], [self picImgSize]);
            break;
    }
}

+(CGRect)reviewSizeWithIndex:(int)index
{
    CGFloat startWidth = [UIScreen mainScreen].bounds.size.width * 0.65;
    CGFloat startHeight = [self imgMapStartHeight] + [self picImgSize] - [self reviewImgSize];
    
    switch (index)
    {
        case 0:
            return CGRectMake(startWidth, startHeight, [self reviewImgSize], [self reviewImgSize]);
            break;
        case 1:
            return CGRectMake(startWidth + [self margin] + [self reviewImgSize], startHeight, [self reviewImgSize], [self reviewImgSize]);
            break;
        default:
            return CGRectMake(startWidth + [self margin] * 2 + [self reviewImgSize] * 2, startHeight, [self reviewImgSize], [self reviewImgSize]);
            break;
    }
}

+(CGRect)plusLabelSize
{
    CGFloat plusLabelSize = [UIScreen mainScreen].bounds.size.width * 0.15;
    return CGRectMake(0, 0, plusLabelSize, plusLabelSize);
}

+(CGRect)commentSize
{
    CGFloat startHeight = [self imgMapStartHeight] + [self picImgSize] + [self margin] * 2 + [self labelSize];
    
    return CGRectMake([self margin], startHeight, [UIScreen mainScreen].bounds.size.width * 0.98, [self labelSize]);
}

+(CGRect)nameLabelSize
{
    CGFloat startHeight = [self imgMapStartHeight] + [self picImgSize] + [self margin];
    
    return CGRectMake([self margin], startHeight, [UIScreen mainScreen].bounds.size.width * 0.98, [self labelSize]);
}

// confirm dialog
+ (CGRect)confirmView
{
    return CGRectMake([UIScreen mainScreen].bounds.size.width * 0.2,
                      [UIScreen mainScreen].bounds.size.height * 0.4,
                      [UIScreen mainScreen].bounds.size.width * 0.6,
                      [UIScreen mainScreen].bounds.size.height * 0.3);
}

// annotation
+ (CGRect)annotationIconSize
{
    return CGRectMake(5,5,20,20);
}

// bookmarkView image
+ (CGRect)bmImageSizeWithParent:(UITableViewCell *)parent andImageSize:(int)size
{
    return CGRectMake(parent.bounds.size.width * 0.01,
                      size * 0.05,
                      size * 0.9,
                      size * 0.9);
}

// bookmarkView date
+ (CGRect)bmDateSizeWithSize:(int)size andParent:(UITableViewCell *)parent
{
    return CGRectMake(parent.bounds.size.width * 0.3,
                      size * 0.005,
                      parent.bounds.size.width * 0.6,
                      size * 0.3);
}

// bookmarkView name
+ (CGRect)bmNameSizeWithSize:(int)size andParent:(UITableViewCell *)parent
{
    return CGRectMake(parent.bounds.size.width * 0.3,
                      size * 0.005 * 2 + size * 0.3,
                      parent.bounds.size.width * 0.6,
                      size * 0.5);
}

// bookmarkView info button
+ (CGRect)bmInfoButtonSizeWithParent:(UITableViewCell *)parent
{
    return CGRectMake(parent.frame.size.width * 1,
                                 parent.frame.size.height * 0.2,
                                 parent.frame.size.width * 0.15,
                                 parent.frame.size.height * 0.6);
}

// infoView name
+ (CGRect)ifRestaurantNameSize
{
    return CGRectMake([self margin],
                      [self imgMapStartHeight],
                      [UIScreen mainScreen].bounds.size.width * 0.98,
                      [UIScreen mainScreen].bounds.size.height * 0.1);
}

// infoView Restautant icon size
+ (CGFloat)iconSize
{
    return [UIScreen mainScreen].bounds.size.width * 0.4;
}

// infoView restaurant icon
+ (CGRect)ifRestaurantIconSize
{
    return CGRectMake([self margin],
                      [self imgMapStartHeight] + [UIScreen mainScreen].bounds.size.height * 0.1,
                      [self iconSize],
                      [self iconSize]);
}

// infoView review icon
+ (CGRect)ifReviewSizeWithIndex:(int)index
{
    CGFloat startWidth = [UIScreen mainScreen].bounds.size.width * 0.6;
    CGFloat startHeight = [self imgMapStartHeight] + [self iconSize] + [UIScreen mainScreen].bounds.size.height * 0.1 - [self reviewImgSize];
    
    switch (index)
    {
        case 0:
            return CGRectMake(startWidth, startHeight, [self reviewImgSize], [self reviewImgSize]);
            break;
        case 1:
            return CGRectMake(startWidth + [self margin] + [self reviewImgSize], startHeight, [self reviewImgSize], [self reviewImgSize]);
            break;
        default:
            return CGRectMake(startWidth + [self margin] * 2 + [self reviewImgSize] * 2, startHeight, [self reviewImgSize], [self reviewImgSize]);
            break;
    }
}

@end
