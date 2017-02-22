//
//  Attachment.m
//  Linkedin
//
//  Created by Hiroshi Tokutomi on 2017-02-21.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import "Attachment.h"

@implementation Attachment

-(id) initWithAttachmentId:(int)attachmentId type:(int)type dataURL:(NSString*)dataURL
{
    self = [super init];
    if(self){
        self.attachmentId = attachmentId;
        self.type = type;
        self.dataURL = dataURL;
    }
    
    return self;
}


@end
