//
//  Item.h
//  InventoryHomeworkJFBenoit
//
//  Created by Jacob Benoit on 3/15/15.
//  Copyright (c) 2015 Jacob Benoit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Location;

@interface Item : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * text;
@property (nonatomic, retain) NSDate * creationDate;
@property (nonatomic, retain) NSNumber * quantityAvailable;
@property (nonatomic, retain) NSDecimalNumber * price;
@property (nonatomic, retain) NSSet *photos;
@property (nonatomic, retain) Location *location;
@property (nonatomic, retain) NSSet *tags;
@end

//@interface Item (CoreDataGeneratedAccessors)
//
//- (void)addPhotosObject:(NSManagedObject *)value;
//- (void)removePhotosObject:(NSManagedObject *)value;
//- (void)addPhotos:(NSSet *)values;
//- (void)removePhotos:(NSSet *)values;
//
//- (void)addTagsObject:(NSManagedObject *)value;
//- (void)removeTagsObject:(NSManagedObject *)value;
//- (void)addTags:(NSSet *)values;
//- (void)removeTags:(NSSet *)values;
//
//@end
