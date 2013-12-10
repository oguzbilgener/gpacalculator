//
//  O_AppDelegate.m
//  GPACalcMed
//
//  Created by Oguz Bilgener on 09/12/13.
//  Copyright (c) 2013 Oguz Bilgener. All rights reserved.
//

#import "O_AppDelegate.h"
#import "O_Course.h"

@implementation O_AppDelegate
{
	NSMutableArray* _courses;
}

- (void) awakeFromNib
{
	
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	_courses = [[NSMutableArray alloc] init];
	
	O_Course *mCourse = [[O_Course alloc] init];
	[_courses addObject:mCourse];
	
	[_gradesTable reloadData];
}

// main window opens again when clicked on dock icon
/*- (BOOL) applicationShouldOpenUntitledFile:(NSApplication *)sender
{
	NSLog(@"applicationShouldOpenUntitledFile");
    [_window makeKeyAndOrderFront:self];
    return NO;
}*/

// app dies when clicked on red orb:
- (BOOL) applicationShouldTerminateAfterLastWindowClosed: (NSApplication *) theApplication
{
	return YES;
}

- (NSInteger) numberOfRowsInTableView:(NSTableView *)tableView
{
	return [_courses count];
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
	O_Course* course = [_courses objectAtIndex:row];
    NSString *identifier = [tableColumn identifier];
	
	if([identifier isEqualToString:@"NameColumn"])
	{
		return [course courseName];
	}
	else if([identifier isEqualToString:@"CreditsColumn"])
	{
		return [NSString stringWithFormat:@"%ld",[course credits]];
	}
	else if([identifier isEqualToString:@"LetterColumn"])
	{
		return [course letter];
	}
    return Nil;
}

- (void)tableView:(NSTableView *)tableView setObjectValue:(id)object forTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
	O_Course* course = [_courses objectAtIndex:row];
    NSString *identifier = [tableColumn identifier];
	
	if([identifier isEqualToString:@"NameColumn"])
	{
		[course setCourseName:object];
	}
	else if([identifier isEqualToString:@"CreditsColumn"])
	{
		[course setCredits:[object integerValue]];
	}
	else if([identifier isEqualToString:@"LetterColumn"])
	{
		//NSLog(@" letter column set value");
		[course setLetter:object];
		[course calculateGrade];
	}
	[self displayGrades];
}

- (void)tableView:(NSTableView *)tableView didAddRowView:(NSTableRowView *)rowView forRow:(NSInteger)row
{
	
}

/* (BOOL) control:(NSControl *)control textShouldEndEditing:(NSText *)fieldEditor
{
    self.editingString = [[NSString alloc] initWithString:fieldEditor.string];
    [self performSelector:@selector(updateSelection) withObject:nil afterDelay:0.1];
    return YES;
}*/

- (IBAction)addAction:(id)sender
{
	//[_gradeTable insert]
	[_courses addObject:[[O_Course alloc] init]];
	[_gradesTable reloadData];
	[_resultText setStringValue:@""];
}

- (IBAction)removeAction:(id)sender
{
	if([_gradesTable selectedRow]==-1)
		return;
	[_gradesTable abortEditing];
	[_courses removeObjectAtIndex:[_gradesTable selectedRow]];
	[_gradesTable reloadData];
	[self displayGrades];
}

- (IBAction)comboAction:(id)sender
{
}

- (IBAction)creditsAction:(id)sender
{
	[self displayGrades];
}

+ (NSString*) gradeText:(float)grade
{
	if(grade>=3.5)
		return @"High Honor";
	else if(grade>=3.0)
		return @"Honor";
	else
		return @"";
}

+(float)calculateGrades:(NSMutableArray *)courses
{
	float sum = 0;
	NSInteger credits = 0;
	for(O_Course* course in courses)
	{
		if(course == nil)
			return -1;
		if( [course courseName] == nil || [[course courseName] isEqualToString:@""])
			return -1;
		if( [course credits]==-1)
			return -1;
		
		credits += [course credits];
		
		sum += [course credits] * [course grade];
	}
	if(credits == 0)
		return -1;
	
	return (float)(sum/credits);
}

-(void)displayGrades;
{
	
	float gpa = [O_AppDelegate calculateGrades:_courses];
	if(gpa != -1)
	{
		[_resultText setStringValue:[NSString stringWithFormat: @"%.2f %@", gpa, [O_AppDelegate gradeText:gpa]]];
	}
	else
	{
		[_resultText setStringValue:@""];
	}
}

@end
