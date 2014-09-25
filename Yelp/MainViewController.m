//
//  MainViewController.m
//  Yelp
//
//  Created by Timothy Lee on 3/21/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "MainViewController.h"
#import "YelpClient.h"
#import "BusinessList.h"
#import "BusinessEntry.h"
#import "YelpEntryCell.h"
#import "FilterSettingsController.h"

NSString * const kYelpConsumerKey = @"vxKwwcR_NMQ7WaEiQBK_CA";
NSString * const kYelpConsumerSecret = @"33QCvh5bIF5jIHR5klQr7RtBDhQ";
NSString * const kYelpToken = @"uRcRswHFYa1VkDrGV6LAW2F8clGh5JHV";
NSString * const kYelpTokenSecret = @"mqtKIxMIR4iBtBPZCmCLEb-Dz3Y";

@interface MainViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) YelpClient *client;

@end

@implementation MainViewController
{
    BusinessList*       _business_list;
    YelpEntryCell*      _size_cell;
    UIBarButtonItem*    _filter_button;
    UISearchBar*        _search_bar;
    NSString*           _last_search_string;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // You can register for Yelp API keys here: http://www.yelp.com/developers/manage_api_keys
        self.client = [[YelpClient alloc] initWithConsumerKey:kYelpConsumerKey consumerSecret:kYelpConsumerSecret accessToken:kYelpToken accessSecret:kYelpTokenSecret];
    }
    return self;
}

//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 94;
//}
//
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    BusinessEntry* biz = [_business_list biz_for_index_path:indexPath];
//    [biz display:_size_cell];
//    [_size_cell layoutSubviews];
//    CGSize size = [_size_cell.contentView systemLayoutSizeFittingSize:UILayoutFittingExpandedSize];
//    NSLog(@"%i", (int)size.height);
//    return size.height + 1;
//}
//
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    NSLog(@"%i", [_business_list count]);
    return [_business_list count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YelpEntryCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"YelpEntryCell"];
    BusinessEntry* biz = [_business_list biz_for_index_path:indexPath];
    [biz display:cell];
    return cell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 84;
    
    _last_search_string = @"Chipotle";
    
    [self.tableView registerNib:[UINib nibWithNibName:@"YelpEntryCell" bundle:nil] forCellReuseIdentifier:@"YelpEntryCell"];
    
    _size_cell = [YelpEntryCell new];
    //[self.tableView dequeueReusableCellWithIdentifier:@"YelpEntryCell"];
    
    _filter_button = [[UIBarButtonItem alloc] initWithTitle:@"Filter"
                                                     style:UIBarButtonItemStylePlain
                                                    target:self
                                                    action:@selector(filter_click)];
    
    _search_bar = [[UISearchBar alloc]init];
    _search_bar.delegate = self;
    _search_bar.text = _last_search_string;
    _search_bar.tintColor = [UIColor blackColor];
    
    self.navigationItem.titleView = _search_bar;
    self.navigationItem.leftBarButtonItem = _filter_button;
    
    [self loadData];
}

-(void) filter_click
{
    FilterSettingsController* fc = [FilterSettingsController new];
    fc.delegate = self;
    UINavigationController* nav = [[UINavigationController alloc]initWithRootViewController:fc];
    [nav setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    [self presentViewController:nav animated:YES completion:nil];
}

-(void)filter_settings_done:(Filters *)filters
{
    
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    _last_search_string = _search_bar.text;
    [_search_bar resignFirstResponder];
    [self loadData];
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void) loadData
{
    [self.client searchWithTerm:_last_search_string success:^(AFHTTPRequestOperation *operation, id response)
    {
        _business_list = [[BusinessList alloc]initWithDict:response];
        [self.tableView reloadData];
    }
    failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error: %@", [error description]);
    }];
}

@end
