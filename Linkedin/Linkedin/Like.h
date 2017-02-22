//
//  Like.h
//  Linkedin
//
//  Created by Hiroshi Tokutomi on 2017-02-21.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Like : NSObject

@property int likeId;
@property (strong, nonatomic)User* likeOwner;
@property (strong, nonatomic)NSDate* date;

-(id)initWithLikeId:(int)likeId likeOwner:(User*)likeOwner date:(NSDate*)date;

@end
