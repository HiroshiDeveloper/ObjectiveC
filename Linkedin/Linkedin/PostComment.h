//
//  PostComment.h
//  Linkedin
//
//  Created by Hiroshi Tokutomi on 2017-02-21.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Attachment.h"

@interface PostComment : NSObject

@property int commentId;
@property (strong, nonatomic) User* commentAuthor;
@property (strong, nonatomic) NSDate* date;
@property (strong, nonatomic) NSMutableArray<Attachment*>* attachment;

-(id)initWithCommentId:(int)commentId commentAuthor:(User*)commentAuthor date:(NSDate*)date attachments:(NSMutableArray<Attachment*>*)attachments;

@end
