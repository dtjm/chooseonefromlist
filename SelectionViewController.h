//
//  SelectionViewController.h
//  Choose One From List
//
//  Created by Sam on 7/10/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface SelectionViewController : NSWindowController 
<NSTableViewDataSource, NSWindowDelegate> {
	NSArray		*strings;
	NSTableView *tableView;
	NSString	*prompt;
    
    NSCondition *condition;
    BOOL        didCancelSelection;
}

@property (nonatomic, retain)          NSArray     *strings;
@property (nonatomic, retain) IBOutlet NSTableView *tableView;
@property (nonatomic, copy)            NSString    *prompt;
@property (nonatomic, retain)          NSCondition *condition;

- (NSString*) selectedString;
- (void)      setCondition:(NSCondition*)aCondition;
- (IBAction)  didPressSelectButton:(id)sender;

@end
