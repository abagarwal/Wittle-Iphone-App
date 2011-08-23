//
//  WittleIphoneAppViewController.m
//  WittleIphoneApp
//
//  Created by Abhishek Agarwal on 18/08/11.
//  Copyright Systech 2011. All rights reserved.
//

#import "WittleIphoneAppViewController.h"
#import "ListMemoryCell.h"

@implementation WittleIphoneAppViewController

@synthesize aLabel;
@synthesize aButton;
@synthesize usernameField;
@synthesize passwordField;
@synthesize loginButton;
@synthesize loginIndicator;
@synthesize logoutButton;

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
	
	//[self.navigationController pushViewController:nextView animated:YES];
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
	
	
	NSLog(@"Inside the login function.....");
	
	NSLog(passwordField.text);
	NSLog(@"Inside the login function1.....");
	
	if([usernameField.text  isEqualToString:@"a"])
	{
		NSLog(@"Checking Username");
		if([passwordField.text  isEqualToString:@"a"])
		{
			NSLog(@"Checking Password");
			[self loadNextView];
		}
		
		else {
			[aLabel setText:@"Invalid Password."];
		}
	}
	else {
		[aLabel setText:@"Invalid Username."];
	}
	
	/*
	if(nextView == nil)
		nextView = [[MemoryListView alloc] init];
	[self.navigationController pushViewController:nextView animated:YES];
	 */
	
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

- (void)loadNextView {
	[super loadView];
	aTableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame] style:UITableViewStyleGrouped];
	aTableView.delegate = self;
	aTableView.dataSource = self;
	aTableView.autoresizesSubviews = YES;
	
	logoutButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	logoutButton.frame = CGRectMake(10,300, 70, 35);
	[logoutButton addTarget:self action:@selector(logoutButtonPressed) forControlEvents:UIControlEventTouchUpInside];
	[logoutButton setTitle:@"Logout" forState:UIControlStateNormal];
	
	memoryArray = [[NSMutableArray alloc]init];
	[memoryArray addObject:@"Last Year Gettogether"];
	[memoryArray addObject:@"Beautiful Memory"];
	[memoryArray addObject:@"Worst Experience"];
	[memoryArray addObject:@"New Year 2011"];
	[memoryArray addObject:@"Last Trip"];
	[memoryArray addObject:@"Excursion"];
	
	memoryContentExtractArray = [[NSMutableArray alloc]init];
	[memoryContentExtractArray addObject:@"This memory content..."];
	[memoryContentExtractArray addObject:@"This memory content..."];
	[memoryContentExtractArray addObject:@"This memory content..."];
	[memoryContentExtractArray addObject:@"This memory content..."];
	[memoryContentExtractArray addObject:@"This memory content..."];
	[memoryContentExtractArray addObject:@"This memory content..."];
	
	self.view = aTableView;
	[self.view addSubview:logoutButton];
	//[super viewWillAppear: animated];
	//[[NSBundle mainBundle] loadNibNamed:@"LoginView" owner:self options:nil];
	//[self viewDidLoad];
	//self.view = nil;
	//[self initWithNibName:@"LoginView" bundle:nil];
	//[self loadView];
	//WittleIphoneAppViewController *_loginViewController = [[WittleIphoneAppViewController alloc] initWithNibName:@"LoginView" bundle:[NSBundle mainBundle]];
	//self.viewController = _loginViewController;
	//[_loginViewController release];
	
	
	
}

- (void)logoutButtonPressed
{
	//[self.view removeFromSuperview];
	NSLog(@"Logout Button Pressed");
	if(nextView == nil)
		nextView = [[WittleIphoneAppViewController alloc] initWithNibName:@"LoginView" bundle:nil];
	nextView.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
	[self presentModalViewController:nextView animated:YES];
	[nextView release];
	
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [memoryArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *MyIdentifier = @"My Identifier";
    
    ListMemoryCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
	if (cell == nil) {
		cell = [[[ListMemoryCell alloc] initWithFrame:CGRectZero reuseIdentifier:MyIdentifier] autorelease];
	}
    
    if(indexPath.section == 0) {
		cell.memoryTitle.text = [memoryArray objectAtIndex:indexPath.row];
	    cell.memoryContentExtract.text = [memoryContentExtractArray objectAtIndex:indexPath.row];
	}
	else {
		[cell setText:@"I am in Section 2"];
	}
	cell.textColor = [UIColor blueColor];
	
    return cell;
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
   [theTextField resignFirstResponder];
	return YES;
}

@end
