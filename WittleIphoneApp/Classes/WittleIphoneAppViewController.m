//
//  WittleIphoneAppViewController.m
//  WittleIphoneApp
//
//  Created by Abhishek Agarwal on 18/08/11.
//  Copyright Systech 2011. All rights reserved.
//

#import "WittleIphoneAppViewController.h"
#import "ListMemoryCell.h"
#import "NoMemoryView.h"

@implementation WittleIphoneAppViewController

@synthesize aLabel;
@synthesize loginLabel;
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
	[self.view setBackgroundColor:[UIColor blueColor]];
	/*
	
	aLabel = [[UILabel alloc]initWithFrame:CGRectMake(135, 50, 200, 40)];
	aLabel.text = @"Wittle";
	[aLabel setTextColor:[UIColor redColor]];
	//[aLabel setFont: [UIFont systemFontSize:22]];
	[aLabel setBackgroundColor:[UIColor	whiteColor]];
	[self.view addSubview:aLabel];
	 */
	
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
	
	//self.navigationController.navigationBarHidden = NO;
	[self.navigationController pushViewController:nextView animated:NO];

}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad {
 [super viewDidLoad];
	 self.navigationController.navigationBarHidden = YES;
 
	 aTableView = [[UITableView alloc] initWithFrame:CGRectMake(0,150,320,100) style:UITableViewStyleGrouped];
	 aTableView.delegate = self;
	 aTableView.dataSource = self;
	 aTableView.autoresizesSubviews = YES; 
	 
	 aTableView.backgroundColor = [UIColor clearColor];
	 aTableView.opaque = NO;
	// aTableView.backgroundView = nil;
	 
	 [self.view addSubview:aTableView];	
	 
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

- (IBAction) login
{
	NSLog(@"Inside the login function.....");
	[loginButton setHidden:YES];
	[loginLabel setHidden:NO];
	[loginIndicator setHidden:NO];
	[loginIndicator startAnimating];
	/*
	int i=0;
	while(i<1000000000) {
		i=i+1;
	}
	 */
	/*
	self.navigationController.navigationBarHidden = NO;
	[self.navigationController setToolbarHidden:NO];
	[self.navigationController pushViewController:[[NoMemoryView alloc] initWithNibName:@"NoMemory" bundle:Nil] animated:YES];
	*/
	if(nextView == nil)
		nextView = [[MemoryListView alloc] init];
	self.navigationController.navigationBarHidden = NO;
	[self.navigationController setToolbarHidden:NO];
	[self.navigationController pushViewController:nextView animated:NO];	
	
	
	/*
	NSLog(passwordField.text);
	NSLog(@"Inside the login function1.....");
	
	if([usernameField.text  isEqualToString:@""])
	{
		NSLog(@"Checking Username");
		if([passwordField.text  isEqualToString:@""])
		{
			NSLog(@"Checking Password");
			//[self loadNextView];
			if(nextView == nil)
				nextView = [[MemoryListView alloc] init];
			self.navigationController.navigationBarHidden = NO;
			[self.navigationController setToolbarHidden:NO];
			[self.navigationController pushViewController:nextView animated:NO];
			// self.navigationController.navigationBarHidden = NO;
		}
		
		else {
			[aLabel setText:@"Invalid Password."];
		}
	}
	else {
		[aLabel setText:@"Invalid Username."];
	}
	
	

	
	
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
	
	/*
	
	aRootView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
	//aRootView.delegate = self;
	//aRootView.dataSource = self;
	aRootView.autoresizesSubviews = YES;
	
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
	
	
	[self.view addSubview:aRootView];
	//self.view = aTableView;
	[self.view addSubview:aTableView];
	[self.view addSubview:logoutButton];
	*/
	//self.view =nil;
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
	[self.logoutButton removeFromSuperview];
	[self.aTableView removeFromSuperview];
	//[self.aRootView removeFromSuperview];
	
	/*
	//[self.view removeFromSuperview];
	NSLog(@"Logout Button Pressed");
	if(nextView == nil)
		nextView = [[WittleIphoneAppViewController alloc] initWithNibName:@"LoginView" bundle:nil];
	nextView.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
	[self presentModalViewController:nextView animated:YES];
	[nextView release];
	 */
	
}




- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
   [theTextField resignFirstResponder];
	return YES;
}

-(void)popNavControllerToSelf{
	[self.navigationController popToViewController:self animated:NO];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	if(section==0){
		return 2;
	}
	else
		return 1;
}





/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
    static NSString *CellIdentifier = @"Cell";
	
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		
        UILabel *startDtLbl = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 90, 25)];
		
		
		
		if (indexPath.section == 0)
		{
			if (indexPath.row == 0) {
				UITextField *usernameField1 = [[UITextField alloc] initWithFrame:CGRectMake(100,10,80,25)];
				startDtLbl.text = @"Username: ";
				startDtLbl.backgroundColor = [UIColor clearColor];
				[cell.contentView addSubview:startDtLbl];
				[cell.contentView addSubview:usernameField1];
				}
			else {
				UITextField *passwordField1 = [[UITextField alloc] initWithFrame:CGRectMake(100,10,80,25)];
				startDtLbl.text = @"Password: ";
				startDtLbl.backgroundColor = [UIColor clearColor];
				[cell.contentView addSubview:startDtLbl];
				[cell.contentView addSubview:passwordField1];
			}
		}
		else
		{
			NSLog(@"Inside else section");
			
			UIButton *submitButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
			submitButton.frame = CGRectMake(0,0, 300, 45);
			//UIImage *buttonImage1 = [UIImage imageNamed:@"share_icon-1.png"];
			//[submitButton setBackgroundImage:buttonImage1 forState:UIControlStateNormal];
			[submitButton setTitle:@"Sign in" forState:UIControlStateNormal];
			[submitButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
			
			[cell.contentView addSubview:submitButton];			
		}
	}
		
		
        
		

    return cell;
}
*/

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	
	
	
    static NSString *kCellIdentifier = @"Cell";
	
  
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault 
									   reuseIdentifier:kCellIdentifier] autorelease];
		cell.accessoryType = UITableViewCellAccessoryNone;
		
		if ([indexPath section] == 0) {
			UITextField *playerTextField = [[UITextField alloc] initWithFrame:CGRectMake(110, 10, 185, 30)];
			playerTextField.adjustsFontSizeToFitWidth = YES;
			playerTextField.textColor = [UIColor blackColor];
			playerTextField.delegate = self;
			if ([indexPath row] == 0) {
				playerTextField.placeholder = @"example@gmail.com";
				playerTextField.keyboardType = UIKeyboardTypeEmailAddress;
				//playerTextField.returnKeyType = UIReturnKeyNext;
			}
			else {
				playerTextField.placeholder = @"Required";
				//playerTextField.keyboardType = UIKeyboardTypeDefault;
				//playerTextField.returnKeyType = UIReturnKeyDone;
				playerTextField.secureTextEntry = YES;
			}       
			playerTextField.backgroundColor = [UIColor whiteColor];
			playerTextField.autocorrectionType = UITextAutocorrectionTypeNo; // no auto correction support
			playerTextField.autocapitalizationType = UITextAutocapitalizationTypeNone; // no auto capitalization support
			playerTextField.textAlignment = UITextAlignmentLeft;
			playerTextField.tag = 0;
			//playerTextField.delegate = self;
			
			playerTextField.clearButtonMode = UITextFieldViewModeNever; // no clear 'x' button to the right
			[playerTextField setEnabled: YES];
			
			[cell addSubview:playerTextField];
			
			[playerTextField release];
		}
	}
	if ([indexPath section] == 0) { // Email & Password Section
		if ([indexPath row] == 0) { // Email
			cell.textLabel.text = @"Email";
		}
		else {
			cell.textLabel.text = @"Password";
		}
	}
	else { // Login button section
		NSLog(@"Inside else section");
		
		UIButton *submitButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		submitButton.frame = CGRectMake(0,0, 300, 45);
		//UIImage *buttonImage1 = [UIImage imageNamed:@"share_icon-1.png"];
		//[submitButton setBackgroundImage:buttonImage1 forState:UIControlStateNormal];
		[submitButton setTitle:@"Sign in" forState:UIControlStateNormal];
		[submitButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
		
		[cell.contentView addSubview:submitButton];			
	}
	return cell;    
}


@end
