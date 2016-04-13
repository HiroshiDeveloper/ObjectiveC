//
//  RestaurantsAnnotation.h
//  Restaurants
//
//  Created by Hiroshi on 4/12/16.
//  Copyright © 2016 Hiroshi. All rights reserved.
//

#import <MapKit/MapKit.h>
#import <UIKit/UIKit.h>
@import GoogleMaps;

@interface RestaurantsAnnotation : MKPointAnnotation

@property (nonatomic) NSString *placeID;
@property (nonatomic) GMSPlace *place;

@end
