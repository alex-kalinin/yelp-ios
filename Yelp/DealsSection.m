//
//  DealsSection.m
//  Yelp
//
//  Created by Alex Kalinin on 9/24/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "DealsSection.h"

@implementation DealsSection
{
    UISwitch* _deals_switch;
    BOOL _deals_on;
}

-(id) init {
    _deals_switch = [UISwitch new];
    [_deals_switch addTarget:self
                     action:@selector(deals_switch_click)
           forControlEvents:UIControlEventValueChanged];
    return [super init];
}

-(NSString*) get_section_title
{
    return @"Deals";
}

-(int) get_row_count
{
    return 1;
}

-(UITableViewCell*) cell_for_index_path:(NSIndexPath*) index_path
                          withTableView:(UITableView*) table_view
{
    UITableViewCell * cell = [self create_cell:table_view];
    cell.textLabel.text = @"Offering a deal";
    _deals_switch.on = _deals_on;
    cell.accessoryView = _deals_switch;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void) deals_switch_click
{
    _deals_on = _deals_switch.on;
}

-(void) fill_params:(NSMutableDictionary*)params
{
    if (_deals_on) [params setObject:@"1" forKey:@"deals_filter"];
}

@end
