//
//  CategorySection.m
//  Yelp
//
//  Created by Alex Kalinin on 9/24/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "CategorySection.h"
#import "OrderedDictionary.h"

@implementation CategorySection
{
    NSArray*    _all_cat_names;
    NSArray*    _all_cat_ids;
    OrderedDictionary*    _displayed_cat_indexes;
    BOOL        _expanded;
    NSMutableDictionary*    _selected_cats;
}

-(id) init
{
    _all_cat_names = @[@"Active Life", @"Arts & Entertainment", @"Automotive", @"Bicycles",
                       @"Education", @"Food", @"Home Services", @"Hotels & Travel",
                       @"Nightlife", @"Pets", @"Restaurants", @"Shopping"];
    
    
    _all_cat_ids = @[@"active", @"arts", @"auto", @"bicycles",
                     @"education", @"food", @"homeservices", @"hotelstravel",
                     @"nightlife", @"pets", @"restaurants", @"shopping"];
    
    _displayed_cat_indexes = [OrderedDictionary new];
    [self add_selected_index:1];
    [self add_selected_index:5];
    [self add_selected_index:8];

    _selected_cats = [NSMutableDictionary new];
//    [_selected_cats setObject:@(3) forKey:@(3)];
    
    _expanded = NO;
    return [super init];
}

-(void) view_loaded
{
    _expanded = NO;
}

-(NSString*) get_section_title
{
    return @"Categories";
}

-(void) add_selected_index:(int) index
{
    [_displayed_cat_indexes setObject:@(index) forKey:@(index)];
}

-(int) get_row_count
{
    return _expanded ? (int) _all_cat_names.count : (int) _displayed_cat_indexes.count + 1;
}

-(UITableViewCell*) cell_for_index_path:(NSIndexPath*) index_path
                          withTableView:(UITableView*) table_view
{
    UITableViewCell * cell = [self create_cell:table_view];
    NSString* val;
    int index = [self index_for_index_path:index_path];
    val = index > -1 ? _all_cat_names[index] : @"View All";
    cell.textLabel.textAlignment = index > -1 ? NSTextAlignmentLeft : NSTextAlignmentCenter;
    cell.textLabel.textColor = index > -1 ? [self default_color] : [UIColor blueColor];
    cell.textLabel.text = val;
    cell.accessoryType = _selected_cats[@(index)] ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    return cell;
}

-(int) index_for_index_path:(NSIndexPath*) index_path
{
    int result;
    
    if (_expanded) {
        result = (int) index_path.row;
    }
    else if (index_path.row >= _displayed_cat_indexes.count)
    {
        result = -1; // View All;
    }
    else {
        NSNumber* key = [_displayed_cat_indexes keyAtIndex:index_path.row];
        return (int)[key integerValue];
    }
    return result;
}

-(void) did_select_row:(NSIndexPath*)index_path
        withController:(UIViewController*)controller
         withTableView:(UITableView*)tableView
{
    int actual_index = [self index_for_index_path:index_path];
    if (actual_index > -1) {
        if (_selected_cats[@(actual_index)]) [_selected_cats removeObjectForKey:@(actual_index)];
        else                                 [_selected_cats setObject:@(actual_index) forKey:@(actual_index)];
    }
    
    if (!_expanded && index_path.row >= _displayed_cat_indexes.count) {
        _expanded = YES;
    }
    
    [tableView reloadSections:[NSIndexSet indexSetWithIndex:index_path.section]
             withRowAnimation:UITableViewRowAnimationFade];
}

-(void) fill_params:(NSMutableDictionary*)params
{
    NSArray* keys = [_selected_cats allKeys];
    NSMutableString* cats = [NSMutableString new];
    
    for (NSNumber* key in keys) {
        int index = (int) [key integerValue];
        NSString* cat_name = _all_cat_ids[index];
        if (cats.length > 0) [cats appendString:@","];
        [cats appendString:cat_name];
    }
    
    [params setObject:cats forKey:@"category_filter"];
}

@end
