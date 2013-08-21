//
//  CommonFunction.h
//  SearchInTable
//
//  Created by Pardeep Chaudhary on 20/08/13.
//  Copyright (c) 2013 netSol. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DetailViewController;

@interface CommonFunction : NSObject <UISearchDisplayDelegate>
{
    DetailViewController *objDetailViewController;
}

@property (nonatomic, strong)DetailViewController *objDetailViewController;

+(CommonFunction *)sharedInstance;

@end
