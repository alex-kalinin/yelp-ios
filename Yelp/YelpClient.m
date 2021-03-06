//
//  YelpClient.m
//  Yelp
//
//  Created by Timothy Lee on 3/21/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "YelpClient.h"

@implementation YelpClient

- (id)initWithConsumerKey:(NSString *)consumerKey consumerSecret:(NSString *)consumerSecret accessToken:(NSString *)accessToken accessSecret:(NSString *)accessSecret {
    NSURL *baseURL = [NSURL URLWithString:@"http://api.yelp.com/v2/"];
    self = [super initWithBaseURL:baseURL consumerKey:consumerKey consumerSecret:consumerSecret];
    if (self) {
        BDBOAuthToken *token = [BDBOAuthToken tokenWithToken:accessToken secret:accessSecret expiration:nil];
        [self.requestSerializer saveAccessToken:token];
    }
    return self;
}

- (AFHTTPRequestOperation *)searchWithParams:(NSDictionary*)params
                                   success:(void (^)(AFHTTPRequestOperation *operation, id response))success
                                   failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {
    
    NSLog(@"%@", params);
    
    // For additional parameters, see http://www.yelp.com/developers/documentation/v2/search_api
    return [self GET:@"search" parameters:params success:success failure:failure];
}

@end
