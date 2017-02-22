//
//  Sample.m
//  Test
//
//  Created by Hiroshi Tokutomi on 2017-02-16.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import "Sample.h"

@implementation Sample

-(void) printStudentInformation
{
    NSLog(@"Hello World");
    NSLog(@"My name is %@ and my address is %@", self.name, self.address);
}

-(id) initStudentWithStudentId:(NSString*)myStudentId name:(NSString*)myName age:(int)myAge major:(NSString*)myMajor courses:(NSArray<NSString*>*)myCourses admissionYear:(int)myAdmissionYear andAddress:(NSString*)myAddress
{
    self = [super init];
    if(self)
    {
        self.studentId = myStudentId;
        self.admissionYear = myAdmissionYear;
        self.age = myAge;
        self.major = myMajor;
        self.course = myCourses;
        self.address = myAddress;
    }
    return self;
}

@end
