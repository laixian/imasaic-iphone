//
//  RootViewController.m
//  imasaic
//
//  Created by 张来贤 zhang on 12-5-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"


@implementation RootViewController

@synthesize loginButton;
@synthesize sinaWBEngine;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (IBAction)doSinaLogin:(id)sender{
    WBEngine *wbEngine = [[WBEngine alloc] initWithAppKey:@"943323153" appSecret:@"8413226e345bb593d978a09e2bf0fcf4"];
    [wbEngine setRootViewController:self];
    [wbEngine setDelegate:self];
    [wbEngine setRedirectURI:@"http://imasaic.com"];
    [wbEngine setIsUserExclusive:NO];
    self.sinaWBEngine = wbEngine;
    //[self.sinaWBEngine logIn];
    if(![self.sinaWBEngine isLoggedIn]){
        [self.sinaWBEngine logIn];
        return;
    }
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [delegate showMainView];
}

- (void)engineDidLogIn:(WBEngine *)engine{
    NSLog(@"%@, %@", @"Logined:", engine.userID);
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [delegate showMainView];
}

- (void)engineAlreadyLoggedIn:(WBEngine *)engine{
    NSLog(@"Already Loggedin");
}

- (void)engine:(WBEngine *)engine didFailToLogInWithError:(NSError *)error{
    NSLog(@"%@", [error accessibilityValue]);
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{

    [super viewDidLoad];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc{
    [sinaWBEngine release];
    [super dealloc];
}

@end
