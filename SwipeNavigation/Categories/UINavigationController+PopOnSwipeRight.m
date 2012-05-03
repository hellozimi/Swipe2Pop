//
//  UITableView+PopOnSwipeRight.m
//  SwipeNavigation
//
//  Created by Simon Andersson on 5/3/12.
//  Copyright (c) 2012 Hiddencode.me. All rights reserved.
//

#import "UINavigationController+PopOnSwipeRight.h"

@implementation UINavigationController (PopOnSwipeRight)

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    [swipe setDirection:UISwipeGestureRecognizerDirectionRight];
    [swipe setNumberOfTouchesRequired:2];
    [self.view addGestureRecognizer:swipe];
}

- (void)swipe:(UIGestureRecognizer *)gesture {
    [self popViewControllerAnimated:YES];
}



@end
