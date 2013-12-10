//
//  O_Course.m
//  GPA Calculator
//
//  Created by Oguz Bilgener on 09/12/13.
//  Copyright (c) 2013 Oguz Bilgener. All rights reserved.
//

#import "O_Course.h"

@implementation O_Course

- (id) init {
	if (nil != (self = [super init]))
	{
		[self setCourseName:@""];
		[self setCredits:0];
		[self setLetter:@""];
		[self setGrade:0.0];
	}
	return self;
}

/*- (id)initWithName:(NSString*)name withCredits:(int)credits withLetter:(NSString*)letter {
	if (nil != (self = [super init]))
	{
		[self setName:name];
		[self setCredits:credits];
		[self setLetter:letter];
		[self calculateGrade];
	}
	return self;
}*/

+ (float) gradeValue:(NSString *)letter
{
	if([letter isEqualToString:@"A"] || [letter isEqualToString:@"A+"])
		return 4.0;
	if([letter isEqualToString:@"A-"])
		return 3.7;
	if([letter isEqualToString:@"B+"])
		return 3.3;
	if([letter isEqualToString:@"B"])
		return 3.0;
	if([letter isEqualToString:@"B-"])
		return 2.7;
	if([letter isEqualToString:@"C+"])
		return 2.3;
	if([letter isEqualToString:@"C"])
		return 2.0;
	if([letter isEqualToString:@"C-"])
		return 1.7;
	if([letter isEqualToString:@"D+"])
		return 1.3;
	if([letter isEqualToString:@"D"])
		return 1.0;
	return 0;
}

- (void) calculateGrade
{
	[self setGrade:[O_Course gradeValue:[self letter]]];
}

@end
