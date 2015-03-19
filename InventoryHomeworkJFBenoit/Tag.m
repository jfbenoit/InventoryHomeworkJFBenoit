//
//  Tag.m
//  InventoryHomeworkJFBenoit
//
//  Created by Jacob Benoit on 3/15/15.
//  Copyright (c) 2015 Jacob Benoit. All rights reserved.
//

#import "Tag.h"
#import "Item.h"


@implementation Tag

@dynamic name;
@dynamic items;

+(NSString *)entityName
{
    return @"Tag";
}

@end
