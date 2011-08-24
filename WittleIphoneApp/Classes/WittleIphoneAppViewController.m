//
//  WittleIphoneAppViewController.m
//  WittleIphoneApp
//
//  Created by Abhishek Agarwal on 18/08/11.
//  Copyright Systech 2011. All rights reserved.
//

#import "WittleIphoneAppViewController.h"

@implementation WittleIphoneAppViewController

@synthesize aLabel;
@synthesize aButton;
@synthesize usernameField;
@synthesize passwordField;
@synthesize loginButton;
@synthesize loginIndicator;

/*
 // The designated initializer. Override to perform setup that is required before the view is loaded.
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
 // Custom initialization
 }
 return self;
 }
 */


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	[super loadView];
	[self.view setBackgroundColor:[UIColor whiteColor]];
	aLabel = [[UILabel alloc]initWithFrame:CGRectMake(135, 50, 200, 40)];
	aLabel.text = @"Wittle";
	[aLabel setTextColor:[UIColor redColor]];
	//[aLabel setFont: [UIFont systemFontSize:22]];
	[aLabel setBackgroundColor:[UIColor	whiteColor]];
	[self.view addSubview:aLabel];
	
	//create a button row
	//aButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	//aButton.frame = CGRectMake(125,300, 70, 35);
	//[aButton addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
	//[aButton setTitle:@"Hit Me" forState:UIControlStateNormal];
	//[self.view addSubview:aButton];
}

- (void)buttonPressed
{
	if(nextView == nil)
		nextView = [[MemoryListView alloc] init];
	
	[self.navigationController pushViewController:nextView animated:NO];
}



/*
 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad {
 [super viewDidLoad];
 }
 */


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

- (IBAction) login
{
	if(nextView == nil)
		nextView = [[MemoryListView alloc] init];
	[self.navigationController pushViewController:nextView animated:YES];
/*	
	if(usernameField.text == @"abagarwal")
	{
		if(passwordField.text == @"password")
		{
			if(nextView == nil)
				nextView = [[MemoryListView alloc] init];
			[self.navigationController pushViewController:nextView animated:YES];
		}
		
		else {
			[aLabel setText:@"Invalid Credentials."];
		}
	}
	else {
		[aLabel setText:@"Invalid Credentials."];
	}
*/
	
	
	//loginIndicator.hidden = FALSE;
	//[loginIndicator startAnimating];
	
	//loginButton.enabled = FALSE;
}

@end
