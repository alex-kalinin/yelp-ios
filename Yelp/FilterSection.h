//
//  FilterSection.h
//  Yelp
//
//  Created by Alex Kalinin on 9/24/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FilterSection : NSObject
@property (strong, nonatomic, readonly, getter = get_section_title) NSString* section_title;
@property (nonatomic, readonly, getter = get_row_count) int row_count;

-(UITableViewCell*) cell_for_index_path:(NSIndexPath*) index_path
                          withTableView:(UITableView*) table_view;
- (UITableViewCell *)create_cell:(UITableView*) table_view;
-(void) did_select_row:(NSIndexPath*)index_path
        withController:(UIViewController*)controller
         withTableView:(UITableView*)tableView;
-(void) view_loaded;
-(UIColor*) default_color;
@end
