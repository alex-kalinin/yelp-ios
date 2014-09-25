//
//  DistanceSection.m
//  Yelp
//
//  Created by Alex Kalinin on 9/24/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "DistanceSection.h"

@implementation DistanceSection
{

}

-(id) init
{
    self.distances = @[@"1000", @"5000", @"10000", @"50000"];
    self.expanded = FALSE;
    self.selected_index = 1;
    return [super init];
}

-(NSString*) get_section_title
{
    return @"Distance";
}

-(int) get_row_count
{
    return self.expanded ? (int) self.distances.count : 1;
}

-(UITableViewCell*) cell_for_index_path:(NSIndexPath*) index_path
                          withTableView:(UITableView*) table_view
{
    UITableViewCell * cell = [self create_cell:table_view];
    NSString* dist = self.distances[self.expanded ? index_path.row : self.selected_index];
    cell.textLabel.text = dist;
    return cell;
}

-(void) did_select_row:(NSIndexPath*)index_path
        withController:(UIViewController*)controller
         withTableView:(UITableView*)tableView
{
    self.selected_index = (int) index_path.row;
    self.expanded = !self.expanded;
        [tableView reloadSections:[NSIndexSet indexSetWithIndex:index_path.section]
                 withRowAnimation:UITableViewRowAnimationFade];
}

@end
