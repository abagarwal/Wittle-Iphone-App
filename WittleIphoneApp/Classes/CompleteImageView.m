//
//  CompleteImageView.m
//  WittleIphoneApp
//
//  Created by Zoeb Sheikh on 22/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CompleteImageView.h"
#import "DetailedMemoryView.h"

@implementation CompleteImageView

/*
-(IBAction)backButton{
	NSLog(@"Back");
	[self dismissModalViewControllerAnimated:NO];
}
*/

 /*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

/*
-(void)logout {
	self.navigationController.navigationBarHidden = YES;
	[self.navigationController setToolbarHidden:YES];
	NSArray *viewControllers = self.navigationController.viewControllers;
	UIViewController *rootViewController = [viewControllers objectAtIndex:0];
	[[rootViewController loginButton] setHidden:NO];
	[[rootViewController loginLabel] setHidden:YES];
	[[rootViewController loginIndicator] stopAnimating];
	[[rootViewController loginIndicator] setHidden:YES];
	[rootViewController popNavControllerToSelf];
	
}
*/
- (void)viewDidLoad {
    [super viewDidLoad];
	
	/*
	UIBarButtonItem *logoutBtn = [[UIBarButtonItem alloc] initWithTitle:@"Logout" 
																  style:UIBarButtonItemStyleBordered target:self action:@selector(logout)];
	NSArray *barArray = [NSArray arrayWithObjects: logoutBtn, nil];
	[logoutBtn release];	 
	[self setToolbarItems:barArray animated:YES];	
	 */
	UIImage *img=[UIImage imageNamed:@"cakeImage.jpg"];
	[imageFullView setImage:img];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
