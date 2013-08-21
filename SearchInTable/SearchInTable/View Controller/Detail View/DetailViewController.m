//
//  DetailViewController.m
//  SearchInTable
//
//  Created by Pardeep Chaudhary on 20/08/13.
//  Copyright (c) 2013 netSol. All rights reserved.
//

#import "DetailViewController.h"
#import "CommonFunction.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize searchDisplayController, tblPrimary, arrItems, arrItemsFiltered;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [CommonFunction sharedInstance].objDetailViewController = self;
    
    arrItems = [[NSMutableArray alloc]initWithObjects:@"Test",@"Netsolutions",@"Soul",@"Original", nil];
    arrItemsFiltered = [[NSMutableArray alloc]init];
    
    UISearchBar *mySearchBar = [[UISearchBar alloc] init];
	[mySearchBar sizeToFit];
	tblPrimary.tableHeaderView = mySearchBar;
    
    searchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:mySearchBar contentsController:self];
	[self setSearchDisplayController: searchDisplayController];
	[searchDisplayController setDelegate:[CommonFunction sharedInstance]];
	[searchDisplayController setSearchResultsDataSource:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView Data Source Methods
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        return [arrItemsFiltered count];
    }
    else
    {
        return [arrItems count];
    }
}
#pragma mark - UITableView Delegate Methods
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* identifier = @"CellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        cell.textLabel.text = [arrItemsFiltered objectAtIndex:indexPath.row];
    }
    else
    {
        cell.textLabel.text = [arrItems objectAtIndex:indexPath.row];
    }
    
    return cell;
}

@end
