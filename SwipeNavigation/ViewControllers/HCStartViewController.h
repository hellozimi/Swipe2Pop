//
//  HCStartViewController.h
//  SwipeNavigation
//
//  Created by Simon Andersson on 5/5/12.
//  Copyright (c) 2012 Hiddencode.me. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HCStartViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    UITableView *tableView_;
    NSArray *categories_;
}

@property (nonatomic, retain) IBOutlet UITableView *tableView;

@end
