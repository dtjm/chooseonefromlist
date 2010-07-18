//
//  Choose One From List.m
//  Choose One From List
//
//  Created by Sam on 7/10/10.
//  Copyright (c) 2010 Apple Inc, All Rights Reserved.
//

#import "ChooseOneFromList.h"
#import "SelectionViewController.h"

@implementation AC_AutomatorAction_ChooseOneFromList

- (id) init
{
	self = [super init];
	if (self != nil) {
		_selectionViewController = [[SelectionViewController alloc] 
									initWithWindowNibName:@"SelectionView"];
	}
	return self;
}


- (id)runWithInput:(id)input fromAction:(AMAction *)anAction error:(NSDictionary **)errorInfo
{	
	// Give the prompt value to the selection view controller
	[_selectionViewController setPrompt:[[self parameters] objectForKey:@"prompt"]];
    
    // Give the strings as input to the controller
    [_selectionViewController setStrings:input];
    
    // Instantiate a condition object
    NSCondition *cond = [[NSCondition alloc] init];
    
    // Pass it to the selection view controller
    [_selectionViewController setCondition:cond];
        
	// Launch selection view window    
    [_selectionViewController showWindow:self];    
    
    // Lock the condition
    [cond lock];
    
    // Wait until we get a signal back    
    [cond wait];    
    
    // Release the lock
    [cond unlock];    
    [cond release];    
     
    // Return the selected string
	return [_selectionViewController selectedString];
}


@end
