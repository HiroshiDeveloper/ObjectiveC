//
//  PostComment.m
//  Linkedin
//
//  Created by Hiroshi Tokutomi on 2017-02-21.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import "PostComment.h"

@implementation PostComment

-(id)initWithCommentId:(int)commentId commentAuthor:(User*)commentAuthor date:(NSDate*)date attachments:(NSMutableArray<Attachment*>*)attachment
{
    self = [super init];
    
    if(self)
    {
        self.commentId = commentId;
        self.commentAuthor = commentAuthor;
        self.date = date;
        self.attachment = attachment;
    }
    return  self;
}

@end
