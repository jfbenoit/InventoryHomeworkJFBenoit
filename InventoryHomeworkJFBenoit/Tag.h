//
//  Tag.h
//  InventoryHomeworkJFBenoit
//
//  Created by Jacob Benoit on 3/15/15.
//  Copyright (c) 2015 Jacob Benoit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Item;

@interface Tag : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *items;
@end

@interface Tag (CoreDataGeneratedAccessors)
//
//- (void)addItemsObject:(Item *)value;
//- (void)removeItemsObject:(Item *)value;
//- (void)addItems:(NSSet *)values;
//- (void)removeItems:(NSSet *)values;

@end
