//
//  AppDelegate.h
//  SearchInTable
//
//  Created by Pardeep Chaudhary on 20/08/13.
//  Copyright (c) 2013 netSol. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;
@class DetailViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;
@property (strong, nonatomic) DetailViewController *objDetailViewController;

@end
