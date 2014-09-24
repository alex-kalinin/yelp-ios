//
//  BusinessList.h
//  Yelp
//
//  Created by Alex Kalinin on 9/23/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BusinessEntry.h"

@interface BusinessList : NSObject
-(id)initWithDict:(NSDictionary*)dict;
-(int) count;
-(BusinessEntry*) biz_for_index_path:(NSIndexPath*)indexPath;
@end
