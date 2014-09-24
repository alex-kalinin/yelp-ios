//
//  BusinessEntry.h
//  Yelp
//
//  Created by Alex Kalinin on 9/23/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewInterfaces.h"

@interface BusinessEntry : NSObject

-(id)initWithDict:(NSDictionary*)dict;
-(void)display:(id<BusinessViewProtocol>) view;
@end
