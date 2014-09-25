//
//  FilterSection.m
//  Yelp
//
//  Created by Alex Kalinin on 9/24/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "FilterSection.h"

@implementation FilterSection

-(UITableViewCell*) cell_for_index_path:(NSIndexPath*) index_path
                          withTableView:(UITableView*) table_view
{
    [NSException raise:@"Not Implemented" format:@""];
    return nil;
}

- (UITableViewCell *)create_cell:(UITableView*) table_view
{
    UITableViewCell *cell = [table_view dequeueReusableCellWithIdentifier:@"FilterCell"];
    [cell.textLabel setFont:[UIFont fontWithName:@"Helvetica" size:14]];
    [cell.textLabel setTextColor: [self default_color]];
    [cell.textLabel setTextAlignment:NSTextAlignmentLeft];
    cell.accessoryView = nil;
    cell.accessoryType = UITableViewCellAccessoryNone;
    return cell;
}

-(UIColor*) default_color
{
    return [UIColor blackColor];
}

-(void) did_select_row:(NSIndexPath*)index_path
        withController:(UIViewController*)controller
         withTableView:(UITableView*)tableView
{
    [NSException raise:@"Not Implemented" format:@""];
}

-(void) view_loaded
{
    
}

@end
