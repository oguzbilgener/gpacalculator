//
//  O_Calculator.h
//  GPA Calculator
//
//  Created by Oguz Bilgener on 09/12/13.
//  Copyright (c) 2013 Oguz Bilgener. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "O_Course.h"

@interface O_Calculator : NSObject

- (void) addCourse:(O_Course*)course;
- (void) removeCourse:(O_Course*)course;
- (void) removeCourseWithIndex:(int)index;

@end
