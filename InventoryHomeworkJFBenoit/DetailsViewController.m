//
//  DetailsViewController.m
//  InventoryHomeworkJFBenoit
//
//  Created by Jacob Benoit on 3/16/15.
//  Copyright (c) 2015 Jacob Benoit. All rights reserved.
//

#import "DetailsViewController.h"
#import "Item.h"
#import "NSManagedObject+Extensions.h"


@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

- (IBAction)clickedCancel:(id)sender {
    NSLog(@"canceling");
    [self dismissController:self];
}


- (IBAction)clickedSave:(id)sender {
    NSLog(@"starting save");
    Item *newItem = [Item createInMoc:self.moc];
    newItem.title = self.titleField.stringValue;
    newItem.quantityAvailable = @(self.qtyField.integerValue);
    newItem.price = [NSDecimalNumber decimalNumberWithString:self.priceField.stringValue];
    [newItem.managedObjectContext save:nil];
    NSLog(@"save completed");
    
    NSFetchRequest *fr = [NSFetchRequest fetchRequestWithEntityName:@"Item"];
    NSArray *allItems = [self.moc executeFetchRequest:fr error:nil];
    NSLog(@"logging all items");
    NSLog(@"%@",allItems);
}
@end
