//
//  ViewController.m
//  PullToRefreshView
//
//  Created by Christopher Pickslay on 12/19/11.
//  Copyright (c) 2011 Two Bit Labs. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize scrollView;
@synthesize topPull, bottomPull;

-(void)viewDidLoad {
    [super viewDidLoad];
    self.topPull = [[PullToRefreshView alloc] initWithScrollView:self.scrollView];
    [self.topPull setDelegate:self];
    [self.scrollView addSubview:self.topPull];
    
    self.bottomPull = [[PullToRefreshView alloc] initWithScrollView:self.scrollView];
    self.bottomPull.isBottom = YES;
    [self.bottomPull setDelegate:self];
    [self.scrollView addSubview:self.bottomPull];
    
    // make area scrollable
    self.scrollView.contentSize = CGSizeMake(320, 481);
}

-(void)viewDidUnload {
    [self setScrollView:nil];
    [super viewDidUnload];
}

-(IBAction)didTapFinishedLoading:(id)sender {
    [self.topPull finishedLoading];
    [self.bottomPull finishedLoading];
}

#pragma mark -
#pragma mark PullToRefreshViewDelegate

-(void)pullToRefreshViewShouldRefresh:(PullToRefreshView *)view {
    
}

-(void)dealloc {
    [scrollView release];
    [super dealloc];
}

@end
