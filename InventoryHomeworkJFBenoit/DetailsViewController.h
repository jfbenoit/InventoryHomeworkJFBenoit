//
//  DetailsViewController.h
//  InventoryHomeworkJFBenoit
//
//  Created by Jacob Benoit on 3/16/15.
//  Copyright (c) 2015 Jacob Benoit. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface DetailsViewController : NSViewController

@property (strong, nonatomic) NSManagedObjectContext *moc;

@property (weak) IBOutlet NSTextField *titleField;
@property (weak) IBOutlet NSTextField *priceField;
@property (weak) IBOutlet NSTextField *qtyField;
@property (weak) IBOutlet NSTextField *longitudeField;
@property (weak) IBOutlet NSTextField *latitudeField;
@property (weak) IBOutlet NSTextField *tagsField;

- (IBAction)clickedCancel:(id)sender;
- (IBAction)clickedSave:(id)sender;
@end
