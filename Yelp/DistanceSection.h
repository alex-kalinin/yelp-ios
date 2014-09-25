//
//  DistanceSection.h
//  Yelp
//
//  Created by Alex Kalinin on 9/24/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "FilterSection.h"

@interface DistanceSection : FilterSection

@property (nonatomic) BOOL expanded;
@property (nonatomic) NSArray* distances;
@property (nonatomic) int selected_index;

@end
