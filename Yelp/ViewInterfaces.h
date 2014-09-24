//
//  ViewInterfaces.h
//  Yelp
//
//  Created by Alex Kalinin on 9/23/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BusinessViewProtocol<NSObject>
-(void) displayBusiness:(NSString*)name
            withAddress:(NSString*)addr
        withCategoryStr:(NSString*)categories
          withRatingUrl:(NSString*)rating_url
           withImageUrl:(NSString*)image_url
        withReviewCount:(int)review_count;
@end
