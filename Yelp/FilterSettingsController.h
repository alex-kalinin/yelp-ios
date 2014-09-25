//
//  FilterSettingsController.h
//  Yelp
//
//  Created by Alex Kalinin on 9/23/14.

#import <UIKit/UIKit.h>


@protocol FilterSettingsDelegate <NSObject>

- (void)filter_settings_done;

@end


@interface FilterSettingsController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) id<FilterSettingsDelegate> delegate;
@property (nonatomic, strong) NSArray* filter_sections;
@end
