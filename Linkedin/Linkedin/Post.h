//
//  Post.h
//  Linkedin
//
//  Created by Hiroshi Tokutomi on 2017-02-21.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Attachment.h"
#import "Like.h"
#import "PostComment.h"

@interface Post : NSObject

// properties
@property (strong, nonatomic) NSObject* date;
@property (strong, nonatomic) User* author;
@property (strong, nonatomic) NSMutableArray<Attachment*>* attachments;
@property int numberOfLikes;
@property int numberOfComments;
@property (strong, nonatomic) NSMutableArray<Like*>* likes;
@property (strong, nonatomic) NSMutableArray<PostComment*>* comments;
@property BOOL flag;
@property int type;

// constructer
-(id) initWithDate:(NSDate*)date author:(User*)author attachments:(NSMutableArray<Attachment*>*)attachments numberOfLikes:(int)numberOfLikes numberOfComments:(int)numberOfComments likes:(NSMutableArray<Like*>*)likes comments:(NSMutableArray<PostComment*>*)comments type:(int)type;

// methods
-(void) addLike:(Like*)newLike;
-(void) addComment:(PostComment*)newComment;
-(void) editPostWithNameAttachments:(NSMutableArray<PostComment*>*)comments type:(int)type;
-(void) show;

@end
