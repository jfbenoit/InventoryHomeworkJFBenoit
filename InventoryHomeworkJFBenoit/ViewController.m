//
//  ViewController.m
//  InventoryHomeworkJFBenoit
//
//  Created by Jacob Benoit on 3/15/15.
//  Copyright (c) 2015 Jacob Benoit. All rights reserved.
//

#import "ViewController.h"
#import "ConfigurableCoreDataStack.h"
#import "CoreDataStackConfiguration.h"
#import "NSManagedObject+Extensions.h"
#import "DetailsViewController.h"
#import "Item.h"

@interface ViewController ()
@property (strong, nonatomic) NSManagedObjectContext *moc;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];

    self.table.delegate = self;
    self.table.dataSource = self;
    
    
    CoreDataStackConfiguration *config = [CoreDataStackConfiguration new];
    config.storeType = NSSQLiteStoreType;
    config.modelName = @"InventoryModel";
    config.appIdentifier = @"com.jacobbenoit.example.inventory";
    config.dataFileNameWithExtension = @"invstore.sqlite";
    config.searchPathDirectory = NSApplicationSupportDirectory;
    
    ConfigurableCoreDataStack *stack = [ConfigurableCoreDataStack stackWithConfiguration:config];
    
    self.moc = [stack managedObjectContext];
    
    
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return 4;
//    NSLog(@"getting number of rows in table: %lu", [self.list count]);
//    return [self.list count];
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    
//    NSLog(@"request for cell %@ row %lu",tableColumn.identifier,row);
    
    NSTableCellView* (^selectedCase)() = @{
        @"column1" : ^{
            NSTableCellView *cell = [tableView makeViewWithIdentifier:@"cell1" owner:nil];
            cell.textField.stringValue = @"first";
            return cell;
        },
        @"column2" : ^{
            NSTableCellView *cell = [tableView makeViewWithIdentifier:@"cell2" owner:nil];
            cell.textField.stringValue = @"second";
            return cell;
        },
        @"column3" : ^{
            NSTableCellView *cell = [tableView makeViewWithIdentifier:@"cell3" owner:nil];
            cell.textField.stringValue = @"third";
            return cell;
        },
        @"column4" : ^{
            NSTableCellView *cell = [tableView makeViewWithIdentifier:@"cell4" owner:nil];
            cell.textField.stringValue = @"fourth";
            return cell;
        },
        @"column5" : ^{
            NSTableCellView *cell = [tableView makeViewWithIdentifier:@"cell5" owner:nil];
            cell.textField.stringValue = @"fifth";
            return cell;
        },
        }[tableColumn.identifier];

    return selectedCase();
    
//    NSTableCellView *cell = [tableView makeViewWithIdentifier:@"cell1" owner:nil];
//    cell.textField.stringValue = @"first";
//    return cell;
    
//    NSTableCellView *cell = [tableView makeViewWithIdentifier:@"cellid" owner:nil];
//    cell.textField.stringValue = [self.list getTodoItemTitleAtIndex:(int)row];
//    return cell;
}

- (IBAction)clickedAdd:(id)sender {
    NSStoryboard *sb = [NSStoryboard storyboardWithName:@"Main" bundle:nil];
    DetailsViewController *addVC = [sb instantiateControllerWithIdentifier:@"detailsView"];
    addVC.moc = self.moc;
    [self presentViewControllerAsSheet:addVC];
    

    
}
@end
