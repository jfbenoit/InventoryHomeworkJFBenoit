//
//  ConfirmDeleteViewController.h
//  InventoryHomeworkJFBenoit
//
//  Created by Jacob Benoit on 3/19/15.
//  Copyright (c) 2015 Jacob Benoit. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ConfirmDeleteViewController : NSViewController

@property (strong, nonatomic) NSManagedObjectContext *moc;

- (IBAction)cancelClicked:(id)sender;

- (IBAction)deleteClicked:(id)sender;
@end
