//
//  HCStartViewController.m
//  SwipeNavigation
//
//  Created by Simon Andersson on 5/5/12.
//  Copyright (c) 2012 Hiddencode.me. All rights reserved.
//

#import "HCStartViewController.h"
#import "HCSubCategoriesViewController.h"
@interface HCStartViewController ()

@end

@implementation HCStartViewController
@synthesize tableView = tableView_;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Categories";
        NSDictionary *data = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Data" ofType:@"plist"]];
        categories_ = [[data objectForKey:@"Categories"] retain];
        NSLog(@"%@", categories_);
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

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary *category = [categories_ objectAtIndex:indexPath.row];
    NSArray *subCategories = [category objectForKey:@"SubCategories"];
    
    HCSubCategoriesViewController *vc = [[[HCSubCategoriesViewController alloc] initWithStyle:UITableViewStylePlain] autorelease];
    vc.subCategories = (NSMutableArray *)subCategories;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [categories_ count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"StartCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    NSDictionary *category = [categories_ objectAtIndex:indexPath.row];
    NSString *title = [category objectForKey:@"Title"];
    cell.textLabel.text = title;
    
    return cell;
}

@end
