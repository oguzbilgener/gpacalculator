//
//  O_AppDelegate.h
//  GPACalcMed
//
//  Created by Oguz Bilgener on 09/12/13.
//  Copyright (c) 2013 Oguz Bilgener. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface O_AppDelegate : NSObject <NSApplicationDelegate, NSTableViewDataSource, NSTableViewDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSButton *addButton;
@property (weak) IBOutlet NSButton *removeButton;

@property (weak) IBOutlet NSTextField *resultText;
@property (weak) IBOutlet NSTableView *gradesTable;

- (IBAction)addAction:(id)sender;
- (IBAction)removeAction:(id)sender;

- (IBAction)comboAction:(id)sender;
- (IBAction)creditsAction:(id)sender;

+ (NSString*) gradeText:(float)grade;
+ (float)calculateGrades:(NSMutableArray *)courses;
- (void)displayGrades;


@end
