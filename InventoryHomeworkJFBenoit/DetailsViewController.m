//
//  DetailsViewController.m
//  InventoryHomeworkJFBenoit
//
//  Created by Jacob Benoit on 3/16/15.
//  Copyright (c) 2015 Jacob Benoit. All rights reserved.
//

#import "DetailsViewController.h"
#import "Item.h"
#import "Location.h"
#import "NSManagedObject+Extensions.h"


@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    if (self.i != nil) {
        // populate all the fields
        self.titleField.stringValue = self.i.title;
        self.qtyField.stringValue = [self.i.quantityAvailable stringValue];
        self.priceField.stringValue = [self.i.price stringValue];
        self.latitudeField.stringValue = [self.i.location.latitude stringValue];
        self.longitudeField.stringValue = [self.i.location.longitude stringValue];
    }
}

- (IBAction)clickedCancel:(id)sender {
    [self dismissController:self];
}


- (IBAction)clickedSave:(id)sender {
    if (self.i == nil) {
        // creating a new one
        self.i = [Item createInMoc:self.moc];
        
    }
    self.i.title = self.titleField.stringValue;
    self.i.quantityAvailable = @(self.qtyField.integerValue);
    self.i.price = [NSDecimalNumber decimalNumberWithString:self.priceField.stringValue];
    
    // handle the location
    Location *loc = self.i.location;
    if (loc == nil) {
        loc = [Location createInMoc:self.moc];
    }
    loc.latitude = @(self.latitudeField.doubleValue);
    loc.longitude = @(self.longitudeField.doubleValue);
    
    self.i.location = loc;
    
    [self.i.managedObjectContext save:nil];
    NSLog(@"save completed");
    
    NSFetchRequest *fr = [NSFetchRequest fetchRequestWithEntityName:@"Item"];
    NSArray *allItems = [self.moc executeFetchRequest:fr error:nil];
    NSLog(@"logging all items");
    NSLog(@"%@",allItems);
    
    [self dismissController:self];
}
@end
