//
//  Sample.h
//  Test
//
//  Created by Hiroshi Tokutomi on 2017-02-16.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sample : NSObject

// properties
@property NSString* studentId;
@property int age;
@property NSString* name;
@property NSString* major;
@property float gpa;
@property (strong, nonatomic) NSString* major1;
@property NSArray<NSString*>* course;
@property NSString* address;
@property int admissionYear;

// methods
-(void) printStudentInformation;

// constructor
// id initStudent(NSString* studentId, int age, NSString* name, flaot gpa, NSArray<NSString*>* courses, int admissionYear, NSString* address);
-(id) initStudentWithStudentId:(NSString*)studentId name:(NSString*)name age:(int)age major:(NSString*)major courses:(NSArray<NSString*>*)courses admissionYear:(int)admissionYear andAddress:(NSString*)address;

@end
