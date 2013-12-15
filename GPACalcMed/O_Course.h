//
//  O_Course.h
//  GPA Calculator
//
//  Created by Oguz Bilgener on 09/12/13.
//  Copyright (c) 2013 Oguz Bilgener. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface O_Course : NSObject <NSCoding>

@property NSString* courseName;
@property NSInteger credits;
@property NSString* letter;
@property float grade;

+ (float) gradeValue:(NSString *)letter;
- (void) calculateGrade;

@end
