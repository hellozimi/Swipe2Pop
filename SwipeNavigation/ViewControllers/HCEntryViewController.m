//
//  HCEntryViewController.m
//  SwipeNavigation
//
//  Created by Simon Andersson on 5/5/12.
//  Copyright (c) 2012 Hiddencode.me. All rights reserved.
//

#import "HCEntryViewController.h"

@interface HCEntryViewController ()

@end

@implementation UITextView (DisableSelect)

- (BOOL)canBecomeFirstResponder {
    return NO;
}

@end

@implementation HCEntryViewController
@synthesize titleLabel = titleLabel_;
@synthesize descriptionTextView = descriptionTextView_;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Entry";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
