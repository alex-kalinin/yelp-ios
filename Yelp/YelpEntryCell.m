//
//  YelpEntryCell.m
//  Yelp
//
//  Created by Alex Kalinin on 9/23/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "YelpEntryCell.h"
#import "UIImageView+AFNetworking.h"

@interface YelpEntryCell ()

@property (strong, nonatomic) IBOutlet UIImageView *bizImage;
@property (strong, nonatomic) IBOutlet UILabel *bizTitle;
@property (strong, nonatomic) IBOutlet UIImageView *bizRatingImage;
@property (strong, nonatomic) IBOutlet UILabel *addressLabel;
@property (strong, nonatomic) IBOutlet UILabel *categoriesLabel;
@property (strong, nonatomic) IBOutlet UILabel *reviewCountLabel;

@end

@implementation YelpEntryCell

- (void)awakeFromNib
{
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

-(void)displayBusiness:(NSString *)name
           withAddress:(NSString *)addr
       withCategoryStr:(NSString *)categories
         withRatingUrl:(NSString *)rating_url
          withImageUrl:(NSString*)image_url
       withReviewCount:(int)review_count
{
    [self.bizImage setImageWithURL:[NSURL URLWithString:image_url]];
    [self.bizRatingImage setImageWithURL:[NSURL URLWithString:rating_url]];
    self.bizTitle.text = name;
    self.addressLabel.text = addr;
    self.categoriesLabel.text = categories;
    self.reviewCountLabel.text = [NSString stringWithFormat:@"%i Reviews", review_count];
}

@end
