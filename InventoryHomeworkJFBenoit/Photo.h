//
//  Photo.h
//  InventoryHomeworkJFBenoit
//
//  Created by Jacob Benoit on 3/15/15.
//  Copyright (c) 2015 Jacob Benoit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Item;

@interface Photo : NSManagedObject

@property (nonatomic, retain) NSString * photoURL;
@property (nonatomic, retain) Item *item;

@end
