//
//  Category.h
//  Yelp
//
//  Created by Alex Kalinin on 9/23/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YelpCategory : NSObject
+(NSArray*) categoryListFromJson:(NSArray*)dict;
-(id)initWithName:(NSString*) name;
@property (readonly, getter=getName) NSString* name;
@end
