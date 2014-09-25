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
    NSArray*    _filter_sections;
}

#define INIT_CATEGORIES_TO_SHOW 4

static NSArray * _categoriesOptions;
static NSDictionary * _categoriesDict;
static NSArray * _sortByOptions;

+ (void)initialize {
}

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
    [self.tableView setRowHeight:39];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"FilterCell"];
    
    NSMutableArray* sections = [NSMutableArray new];
    [sections addObject:[DealsSection new]];
    [sections addObject:[DistanceSection new]];
    [sections addObject:[SortSection new]];
    _filter_sections = sections;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSLog(@"%i", (int)_filter_sections.count);
    return _filter_sections.count;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    FilterSection* s = _filter_sections[section];
    return s.section_title;
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    // I don't like all UpperCase string
    UITableViewHeaderFooterView *tableViewHeaderFooterView = (UITableViewHeaderFooterView *) view;
    tableViewHeaderFooterView.textLabel.text = [tableViewHeaderFooterView.textLabel.text capitalizedString];
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
    [self.delegate filter_settings_done:_filters];
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
@end