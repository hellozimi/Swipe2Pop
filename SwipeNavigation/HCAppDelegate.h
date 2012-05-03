//
//  HCAppDelegate.h
//  SwipeNavigation
//
//  Created by Simon Andersson on 5/3/12.
//  Copyright (c) 2012 Hiddencode.me. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HCViewController;

@interface HCAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) HCViewController *viewController;

@end
