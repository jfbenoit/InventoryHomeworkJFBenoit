//
//  ViewController.h
//  InventoryHomeworkJFBenoit
//
//  Created by Jacob Benoit on 3/15/15.
//  Copyright (c) 2015 Jacob Benoit. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController <NSTableViewDataSource, NSTableViewDelegate>
@property (weak) IBOutlet NSTableView *table;

- (IBAction)clickedAdd:(id)sender;
@end

