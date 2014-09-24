//
//  BusinessEntry.m
//  Yelp
//
//  Created by Alex Kalinin on 9/23/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "BusinessEntry.h"
#import "YelpCategory.h"

@implementation BusinessEntry
{
    NSString*   _name;
    NSString*   _address;
    NSString*   _rating;
    NSArray*    _categories; // of Category
    NSString*   _rating_image_url;
    NSString*   _image_url;
    int         _review_count;
}

-(id)initWithDict:(NSDictionary*)dict
{
    self = [super init];
    
    _name       = dict[@"name"];
    _address    = [self addressFromSegments:dict[@"location"][@"address"]];
    _categories = [YelpCategory categoryListFromJson:dict[@"categories"]];
    _rating     = dict[@"rating"];
    _rating_image_url = dict[@"rating_img_url_small"];
    _image_url  = dict[@"image_url"];
    _review_count = [dict[@"review_count"] intValue];
    
    return self;
}

-(NSString*)addressFromSegments:(NSArray*)addr_arr
{
    NSMutableString* result = [NSMutableString new];
    for (NSString* segment in addr_arr) {
        [result appendString:segment];
    }
    return result;
}

-(void)display:(id<BusinessViewProtocol>) view
{
    [view displayBusiness:_name
              withAddress:_address
          withCategoryStr:[self categoriesToString:_categories]
            withRatingUrl:_rating_image_url
             withImageUrl:_image_url
        withReviewCount:_review_count];
}

-(NSString*) categoriesToString:(NSArray*) cats
{
    NSMutableString* catStr = [NSMutableString new];
    for (YelpCategory* cat in cats) {
        if (catStr.length > 0) [catStr appendString:@","];
        [catStr appendFormat:@"%@", cat.name];
    }
    return catStr;
}
@end
