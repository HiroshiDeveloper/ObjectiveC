//
//  CommonHelper.h
//  Restaurants
//
//  Created by Hiroshi on 4/5/16.
//  Copyright © 2016 Hiroshi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface CommonHelper : NSObject

+ (instancetype) sharedInstance;
- (MKMapView *) makeViewWithFrame:(CGRect)size;

@end
