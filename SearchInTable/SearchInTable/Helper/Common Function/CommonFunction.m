//
//  CommonFunction.m
//  SearchInTable
//
//  Created by Pardeep Chaudhary on 20/08/13.
//  Copyright (c) 2013 netSol. All rights reserved.
//

#import "CommonFunction.h"
#import "DetailViewController.h"

@implementation CommonFunction
@synthesize objDetailViewController;

static CommonFunction *sharedInstance = nil;

+(CommonFunction *)sharedInstance
{
    @synchronized(self)
    {
        if (sharedInstance == nil)
        {
            sharedInstance = [[CommonFunction alloc]init];
        }
        return sharedInstance;
    }
}

#pragma mark - UISearchDisplay Delegate
- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self appendDataToFilterArray:searchString];
    return YES;
}

- (void)searchDisplayControllerDidBeginSearch:(UISearchDisplayController *)controller{
	/*
     Bob: Because the searchResultsTableView will be released and allocated automatically, so each time we start to begin search, we set its delegate here.
     */
	[objDetailViewController.searchDisplayController.searchResultsTableView setDelegate:objDetailViewController];
}

- (void)searchDisplayControllerDidEndSearch:(UISearchDisplayController *)controller{
	/*
	 Hide the search bar
	 */
	[objDetailViewController.tblPrimary setContentOffset:CGPointMake(0, 44.f) animated:YES];
}

#pragma mark - general search computation methods
-(void)appendDataToFilterArray : (NSString*)searchText
{
    [objDetailViewController.arrItemsFiltered removeAllObjects];
    
    for (NSString* item in objDetailViewController.arrItems)
    {
        NSComparisonResult result = [item compare:searchText options:NSCaseInsensitiveSearch range:NSMakeRange(0, [searchText length])];
        if (result == NSOrderedSame)
        {
            [objDetailViewController.arrItemsFiltered addObject:item];
        }
    }
}

@end
