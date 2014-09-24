//
//  Category.m
//  Yelp
//
//  Created by Alex Kalinin on 9/23/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "YelpCategory.h"

@implementation YelpCategory
{
    NSString*   _name;
}

+(NSArray*) categoryListFromJson:(NSArray*)dict
{
    NSMutableArray* result = [NSMutableArray new];
    
    for (NSArray* catNames in dict) {
        YelpCategory* cat = [[YelpCategory alloc]initWithName:catNames[0]];
        [result addObject:cat];
    }
    return result;
}

-(id)initWithName:(NSString*) name
{
    _name = name;
    return [super init];
}

-(NSString*) getName
{
    return _name;
}

@end
