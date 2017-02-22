//
//  Post.m
//  Linkedin
//
//  Created by Hiroshi Tokutomi on 2017-02-21.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import "Post.h"

@implementation Post

-(id) initWithDate:(NSDate*)date author:(User*)author attachments:(NSArray<Attachment*>*)attachments numberOfLikes:(int)numberOfLikes numberOfComments:(int)numberOfComments likes:(NSMutableArray<Like*>*)likes comments:(NSMutableArray<PostComment*>*)comments type:(int)type
{
    self = [super init];
    if(self){
        self.date = date;
        self.author = author;
        self.numberOfLikes = numberOfLikes;
        self.numberOfComments = numberOfComments;
        self.likes = likes;
        self.comments = comments;
        self.type = type;
    }
    return self;
}

// methods
-(void) addLike:(Like*)newLike
{
    self.numberOfLikes++;
    [self.likes addObject:newLike];
}

-(void) addComment:(PostComment*)newComment
{
    self.numberOfComments++;
    [self.comments addObject:newComment];
}

-(void) editPostWithNameAttachments:(NSArray<PostComment*>*)comments type:(int)type
{
}

@end
