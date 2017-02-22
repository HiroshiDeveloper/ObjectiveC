//
//  Attachment.h
//  Linkedin
//
//  Created by Hiroshi Tokutomi on 2017-02-21.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Attachment : NSObject

@property int attachmentId;
@property int type;
@property (strong, nonatomic) NSString* dataURL;

-(id) initWithAttachmentId:(int)attachmentId type:(int)type dataURL:(NSString*)dataURL;

@end
