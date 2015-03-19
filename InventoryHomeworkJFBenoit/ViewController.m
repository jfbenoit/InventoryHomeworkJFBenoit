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
#import "Location.h"

@interface ViewController ()
@property (strong, nonatomic) NSManagedObjectContext *moc;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];

    self.table.delegate = self;
    self.table.dataSource = self;
    self.table.doubleAction = @selector(doubleClicked:);
    
    
    CoreDataStackConfiguration *config = [CoreDataStackConfiguration new];
    config.storeType = NSSQLiteStoreType;
    config.modelName = @"InventoryModel";
    config.appIdentifier = @"com.jacobbenoit.example.inventory";
    config.dataFileNameWithExtension = @"invstore.sqlite";
    config.searchPathDirectory = NSApplicationSupportDirectory;
    
    ConfigurableCoreDataStack *stack = [ConfigurableCoreDataStack stackWithConfiguration:config];
    
    self.moc = [stack managedObjectContext];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleMocDidSave:) name:NSManagedObjectContextDidSaveNotification object:self.moc];
    
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    
    NSFetchRequest *fr = [NSFetchRequest fetchRequestWithEntityName:@"Item"];
    NSArray *allItems = [self.moc executeFetchRequest:fr error:nil];
    return [allItems count];
}


-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    
    NSFetchRequest *fr = [NSFetchRequest fetchRequestWithEntityName:@"Item"];
    NSArray *allItems = [self.moc executeFetchRequest:fr error:nil];
    
    Item *item = allItems[row];
    
    NSTableCellView* (^selectedCase)() = @{
        @"column1" : ^{
            NSTableCellView *cell = [tableView makeViewWithIdentifier:@"cell1" owner:nil];
            cell.textField.stringValue = item.title;
            return cell;
        },
        @"column2" : ^{
            NSTableCellView *cell = [tableView makeViewWithIdentifier:@"cell2" owner:nil];
            cell.textField.stringValue = [item.price stringValue];
            return cell;
        },
        @"column3" : ^{
            NSTableCellView *cell = [tableView makeViewWithIdentifier:@"cell3" owner:nil];
            cell.textField.stringValue = [item.quantityAvailable stringValue];
            return cell;
        },
        @"column4" : ^{
            NSTableCellView *cell = [tableView makeViewWithIdentifier:@"cell4" owner:nil];
            Location *loc = item.location;
            if (loc) {
                cell.textField.stringValue = @"[map]";
            } else {
                cell.textField.stringValue = @"N/A";
            }
            return cell;
        },
        @"column5" : ^{
            NSTableCellView *cell = [tableView makeViewWithIdentifier:@"cell5" owner:nil];
            cell.textField.stringValue = @"[edit]";
            return cell;
        },
        }[tableColumn.identifier];

    return selectedCase();
    
}

- (IBAction)clickedAdd:(id)sender {
    NSStoryboard *sb = [NSStoryboard storyboardWithName:@"Main" bundle:nil];
    DetailsViewController *addVC = [sb instantiateControllerWithIdentifier:@"detailsView"];
    addVC.moc = self.moc;
    [self presentViewControllerAsSheet:addVC];
    [self.table reloadData];
    
}

- (void)doubleClicked:(id)sender {
    NSInteger row = self.table.clickedRow;
    NSInteger col = self.table.clickedColumn;
    NSLog(@"clicked row, col %ld, %ld", (long)row, (long)col);
    
    // get the item for the given row
    // a little premature since we don't know if they clicked on a actionable column yet
    NSFetchRequest *fr = [NSFetchRequest fetchRequestWithEntityName:@"Item"];
    NSArray *allItems = [self.moc executeFetchRequest:fr error:nil];
    Item *clickedItem = allItems[(int)row];
    
    if ((int)col == 3) {
        // if it's the location column, open location in browser
        NSString *url = [NSString stringWithFormat:@"https://google.com/maps/place/%@,%@/@%@,%@,12z",clickedItem.location.latitude,clickedItem.location.longitude,clickedItem.location.latitude,clickedItem.location.longitude];
        [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:url]];
    } else if ((int)col == 4){
        // else if it's the edit column, show the details
        NSStoryboard *sb = [NSStoryboard storyboardWithName:@"Main" bundle:nil];
        DetailsViewController *editVC = [sb instantiateControllerWithIdentifier:@"detailsView"];
        editVC.moc = self.moc;
        editVC.i = clickedItem;
        [self presentViewControllerAsSheet:editVC];
    }
}

-(void)handleMocDidSave:(NSNotification*)notification {
   [self.table reloadData];
}

@end
