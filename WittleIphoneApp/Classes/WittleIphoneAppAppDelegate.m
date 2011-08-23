//
//  WittleIphoneAppAppDelegate.m
//  WittleIphoneApp
//
//  Created by Abhishek Agarwal on 18/08/11.
//  Copyright Systech 2011. All rights reserved.
//

#import "WittleIphoneAppAppDelegate.h"
#import "WittleIphoneAppViewController.h"

@implementation WittleIphoneAppAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
	WittleIphoneAppViewController *_loginViewController = [[WittleIphoneAppViewController alloc] initWithNibName:@"LoginView" bundle:[NSBundle mainBundle]];
	self.viewController = _loginViewController;
	[_loginViewController release];
	[window addSubview:[viewController view]];
	
	
	
	//UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController: _loginViewController];
	
	//[window addSubview:nvc.view];
    // Override point for customization after app launch    
    //[window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
