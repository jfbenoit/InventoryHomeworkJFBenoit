//
//  Item.m
//  InventoryHomeworkJFBenoit
//
//  Created by Jacob Benoit on 3/15/15.
//  Copyright (c) 2015 Jacob Benoit. All rights reserved.
//

#import "Item.h"
#import "NSManagedObject+Extensions.h"

@implementation Item

@dynamic title;
@dynamic text;
@dynamic creationDate;
@dynamic quantityAvailable;
@dynamic price;
@dynamic photos;
@dynamic location;
@dynamic tags;

+(NSString *)entityName
{
    return @"Item";
}
@end
