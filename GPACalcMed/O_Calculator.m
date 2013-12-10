//
//  O_Calculator.m
//  GPA Calculator
//
//  Created by Oguz Bilgener on 09/12/13.
//  Copyright (c) 2013 Oguz Bilgener. All rights reserved.
//

#import "O_Calculator.h"

@implementation O_Calculator
{
	NSMutableArray* courses;
}

- (id) init {
	if (nil != (self = [super init]))
	{
		courses = [NSMutableArray init];
	}
	return self;
}

- (void) addCourse:(O_Course*)course
{
	[courses addObject:course];
}

- (void) removeCourse:(O_Course*)course
{
	[courses removeObject:course];
}

- (void) removeCourseWithIndex:(int)index
{
	[courses removeObjectAtIndex:index];
}




@end
