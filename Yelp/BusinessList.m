//
//  BusinessList.m
//  Yelp
//
//  Created by Alex Kalinin on 9/23/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "BusinessList.h"
#import "BusinessEntry.h"

@implementation BusinessList
{
    NSArray*    _businesses;
}

-(id)initWithDict:(NSDictionary*)dict
{
    self = [super init];
    
    NSArray* businesses = dict[@"businesses"];
    NSMutableArray* bizList = [NSMutableArray new];
    
    for (NSDictionary* bizDict in businesses) {
        BusinessEntry* biz = [[BusinessEntry alloc]initWithDict:bizDict];
        [bizList addObject:biz];
    }
    
    _businesses = bizList;

    return self;
}

-(int) count
{
    return (int) _businesses.count;
}

-(BusinessEntry*) biz_for_index_path:(NSIndexPath*)indexPath
{
    return _businesses[indexPath.row];
}

@end
