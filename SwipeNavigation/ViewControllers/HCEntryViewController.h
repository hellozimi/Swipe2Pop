//
//  HCEntryViewController.h
//  SwipeNavigation
//
//  Created by Simon Andersson on 5/5/12.
//  Copyright (c) 2012 Hiddencode.me. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HCEntryViewController : UIViewController {
    UITextView *descriptionTextView_;
    UILabel *titleLabel_;
}

@property (nonatomic, retain) IBOutlet UITextView *descriptionTextView;
@property (nonatomic, retain) IBOutlet UILabel *titleLabel;

@end
