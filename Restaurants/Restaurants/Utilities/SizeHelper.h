//
//  SizeHelper.h
//  Restaurants
//
//  Created by Hiroshi on 4/5/16.
//  Copyright © 2016 Hiroshi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SizeHelper : NSObject

#define WIDTH_SIZE_VIEW [UIScreen mainScreen].bounds.size.width;
#define HEIGHT_SIZE_VIEW [UIScreen mainScreen].bounds.size.height;

+ (CGRect) googleMapSize;
+ (CGRect)imageSizeWithIndex:(int)index;
+ (CGRect)reviewSizeWithIndex:(int)index;
+ (CGRect)plusLabelSize;
+ (CGRect)barSize;
+ (CGRect)commentSize;
+ (CGRect)nameLabelSize;
+ (CGRect)confirmView;
+ (CGRect)annotationIconSize;
+ (CGRect)bmDateSizeWithParent:(UITableViewCell *)parent;

@end
