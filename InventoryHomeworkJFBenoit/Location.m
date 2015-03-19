//
//  Location.m
//  InventoryHomeworkJFBenoit
//
//  Created by Jacob Benoit on 3/15/15.
//  Copyright (c) 2015 Jacob Benoit. All rights reserved.
//

#import "Location.h"
#import "Item.h"


@implementation Location

@dynamic latitude;
@dynamic longitude;
@dynamic item;

+(NSString *)entityName
{
    return @"Location";
}

@end
