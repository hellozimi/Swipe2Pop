//
//  HCViewController.m
//  SwipeNavigation
//
//  Created by Simon Andersson on 5/3/12.
//  Copyright (c) 2012 Hiddencode.me. All rights reserved.
//

#import "HCViewController.h"

@interface HCViewController ()

@end

@implementation HCViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

static int pushNumber = 1;

- (IBAction)pushAController:(id)sender {
    HCViewController *vc = [[HCViewController alloc] initWithNibName:@"HCViewController" bundle:nil];
    vc.title = [NSString stringWithFormat:@"Title %i", pushNumber];
    
    [self.navigationController pushViewController:vc animated:YES];
    
    pushNumber++;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

@end
