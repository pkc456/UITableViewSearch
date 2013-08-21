//
//  DetailViewController.h
//  SearchInTable
//
//  Created by Pardeep Chaudhary on 20/08/13.
//  Copyright (c) 2013 netSol. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UISearchDisplayDelegate>
{
    NSMutableArray *arrItems;
    NSMutableArray *arrItemsFiltered;
}

@property (nonatomic, retain) UISearchDisplayController	*searchDisplayController;
@property (nonatomic, retain) IBOutlet UITableView *tblPrimary;
@property (nonatomic, retain) NSMutableArray *arrItems;
@property (nonatomic, retain) NSMutableArray *arrItemsFiltered;
@end
