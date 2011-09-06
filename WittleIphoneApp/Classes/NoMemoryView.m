//
//  NoMemoryView.m
//  WittleIphoneApp
//
//  Created by Zoeb Sheikh on 30/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NoMemoryView.h"
#import "NewMemoryView.h"
#import  <QuartzCore/QuartzCore.h>


@implementation NoMemoryView

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


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.navigationItem.hidesBackButton = YES;
	
	txtView.layer.borderWidth=1;
	txtView.layer.borderColor = [[UIColor grayColor] CGColor];
	
	
	UILabel *wittleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 120, 30)];
	[wittleLabel setBackgroundColor:[UIColor clearColor]];
	[wittleLabel setTextColor:[UIColor whiteColor]];
	wittleLabel.text = @"Wittle";
	wittleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size: 22.0];
	[wittleLabel sizeToFit];
	self.navigationItem.titleView = wittleLabel;
	[wittleLabel release];	 
	
	UIImage *buttonImage = [UIImage imageNamed:@"addicon.png"];
	UIButton *aButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[aButton setImage:buttonImage forState:UIControlStateNormal];
	aButton.frame = CGRectMake(0.0, 0.0, 30, 30);
	
	UIBarButtonItem *aBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:aButton];
	[aButton addTarget:self action:@selector(addBtnPushed) forControlEvents:UIControlEventTouchUpInside];
	[buttonImage release];
	
	UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
	flexibleSpace.width=130;
	[self setToolbarItems:[NSArray arrayWithObjects:flexibleSpace , aBarButtonItem, nil]];
	[flexibleSpace release];
	
}

-(void) addBtnPushed{
	//self.navigationController.navigationBarHidden = NO;
	[self.navigationController pushViewController:[[NewMemoryView alloc] initWithNibName:@"NewView" bundle:Nil] animated:YES];
	
	
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
