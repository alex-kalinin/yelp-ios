//
//  FilterSettingsController.m
//  Yelp
//
//  Created by Alex Kalinin on 9/23/14.

#import "FilterSettingsController.h"
#import "FilterSettingsController.h"
#import "FilterSection.h"
#import "DealsSection.h"
#import "DistanceSection.h"
#import "SortSection.h"

@interface FilterSettingsController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation FilterSettingsController
{
    // Of FilterSection
//    NSArray*    _filter_sections;
}

#define INIT_CATEGORIES_TO_SHOW 4

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // setup navigation bar
    self.title = @"Filters";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                          target:self
                                                                                          action:@selector(cancelButtonHandler:)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Search"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(searchButtonHandler:)];
    
    [self.tableView setBackgroundColor:[UIColor clearColor]];
//    [self.tableView setRowHeight:39];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"FilterCell"];
    
    for (FilterSection* sect in self.filter_sections) {
        [sect view_loaded];
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _filter_sections.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    FilterSection* s = _filter_sections[section];
    return s.section_title;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    FilterSection* s = _filter_sections[section];
    return s.row_count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FilterSection* s = _filter_sections[indexPath.section];
    return [s cell_for_index_path:indexPath withTableView:tableView];
}

// helper

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    FilterSection* s = _filter_sections[indexPath.section];
    [s did_select_row:indexPath withController:self withTableView:tableView];
}

#pragma mark - button handlers

- (void)cancelButtonHandler:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)searchButtonHandler:(id)sender {
    [self.delegate filter_settings_done];
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
@end
