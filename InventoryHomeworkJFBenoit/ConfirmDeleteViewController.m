//
//  ConfirmDeleteViewController.m
//  InventoryHomeworkJFBenoit
//
//  Created by Jacob Benoit on 3/19/15.
//  Copyright (c) 2015 Jacob Benoit. All rights reserved.
//

#import "ConfirmDeleteViewController.h"
#import "NSManagedObject+Extensions.h"
#import "Item.h"

@interface ConfirmDeleteViewController ()

@end

@implementation ConfirmDeleteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

- (IBAction)cancelClicked:(id)sender {
    [self dismissController:self];
}

- (IBAction)deleteClicked:(id)sender {
    [Item deleteAllInMoc:self.moc];
    [self dismissController:self];
}
@end
