//
//  SortSection.m
//  Yelp
//
//  Created by Alex Kalinin on 9/24/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "DistanceSection.h"
#import "SortSection.h"

@implementation SortSection
{
    BOOL _expanded;
    NSArray* _sorts;
    int _selected_index;
}

-(id) init
{
    self = [super init];
    self.distances = @[@"Best Match", @"Distance", @"Highest Rated"];
    self.selected_index = 0;
    return self;
}

-(NSString*) get_section_title
{
    return @"Sort";
}

@end
