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
+ (CGRect)bmImageSizeWithParent:(UITableViewCell *)parent andImageSize:(int)size;
+ (CGRect)bmDateSizeWithSize:(int)size andParent:(UITableViewCell *)parent;
+ (CGRect)bmNameSizeWithSize:(int)size andParent:(UITableViewCell *)parent;
+ (CGRect)bmInfoButtonSizeWithParent:(UITableViewCell *)parent;
+ (CGRect)ifRestaurantNameSize;
+ (CGRect)ifRestaurantIconSize;
+ (CGFloat)iconSize;
+ (CGRect)ifReviewSizeWithIndex:(int)index;
//+ (CGRect)ifDateLabelSize;
+ (CGRect)ifDateSize;
+ (CGRect)ifAddressLabelSize;
+ (CGRect)ifAddressSize;
+ (CGRect)ifCommentLabelSize;
+ (CGRect)ifCommentSize;
+ (CGRect)ifWebsiteSize;
+ (CGRect)ifImageSizeWithIndex:(int)index;

@end
