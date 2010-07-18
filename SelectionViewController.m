//
//  SelectionViewController.m
//  Choose One From List
//
//  Created by Sam on 7/10/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "SelectionViewController.h"


@implementation SelectionViewController

- (id) init
{
	self = [super init];
	if (self != nil) {
        didCancelSelection = NO;
	}
	return self;
}


- (IBAction) didPressSelectButton:(id)sender
{
    // Close the window
    [[self window] close];
}

@synthesize strings;
@synthesize tableView;
@synthesize prompt;
@synthesize condition;

- (NSString*)selectedString
{    
    if (didCancelSelection) {
        return nil;
    }
    
    NSInteger row = [tableView selectedRow];
    
    if (row == -1) {
        return nil;
    }
    else {
        return [strings objectAtIndex:[tableView selectedRow]]; 
    }    
}

#pragma mark NSTableViewDatasource

- (NSInteger)numberOfRowsInTableView:(NSTableView *)aTableView
{
    return [strings count];
}

- (id)tableView:(NSTableView *)aTableView 
objectValueForTableColumn:(NSTableColumn *)aTableColumn 
            row:(NSInteger)rowIndex
{
    NSLog(@"%@", strings);
    return [strings objectAtIndex:rowIndex];    
}

#pragma mark NSWindowController

#pragma mark NSWindowDelegate

- (void)windowDidBecomeKey:(NSNotification *)notification
{
    [tableView reloadData];
    didCancelSelection = NO;    
}

- (BOOL)windowShouldClose:(id)sender
{
    didCancelSelection = YES;
    return YES;
}

- (void)windowWillClose:(NSNotification *)notification
{    
    [condition signal];    
}

@end
