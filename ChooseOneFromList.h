//
//  Choose One From List.h
//  Choose One From List
//
//  Created by Sam on 7/10/10.
//  Copyright (c) 2010 Apple Inc, All Rights Reserved.
//

#import <Cocoa/Cocoa.h>
#import <Automator/AMBundleAction.h>
#import "SelectionViewController.h"

@interface AC_AutomatorAction_ChooseOneFromList : AMBundleAction 
{
	SelectionViewController *_selectionViewController;
}

- (id)runWithInput:(id)input fromAction:(AMAction *)anAction error:(NSDictionary **)errorInfo;

@end
