//
//  MemoryListView.m
//  WittleIphoneApp
//
//  Created by Abhishek Agarwal on 18/08/11.
//  Copyright 2011 Systech. All rights reserved.
//

#import "MemoryListView.h"
#import "ListMemoryCell.h"
#import "DetailedMemoryView.h"
#import "NewMemoryView.h"



@implementation MemoryListView
@synthesize countries;
@synthesize selectedArray;
@synthesize inPseudoEditMode;
@synthesize selectedImage;
@synthesize unselectedImage;
@synthesize deleteButton;
-(IBAction)doDelete
{
	
}

-(IBAction)togglePseudoEditMode
{
	self.inPseudoEditMode = !inPseudoEditMode;
//	toolbar.hidden = !inPseudoEditMode;
	
//	[self.tableView reloadData];
	
}
- (void)populateSelectedArray
{
	NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:[countries count]];
	for (int i=0; i < [countries count]; i++)
		[array addObject:[NSNumber numberWithBool:NO]];
	self.selectedArray = array;
	[array release];
}




/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
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
	//self.navigationItem.hidesBackButton = YES;
	
	aTableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame] style:UITableViewStyleGrouped];
	aTableView.delegate = self;
	aTableView.dataSource = self;
	aTableView.autoresizesSubviews = YES;
	
	memoryArray = [[NSMutableArray alloc]init];
	[memoryArray addObject:@"Last Year Gettogether"];
	[memoryArray addObject:@"Beautiful Memory"];
	[memoryArray addObject:@"Worst Experience"];
	[memoryArray addObject:@"New Year 2011"];
	[memoryArray addObject:@"Last Trip"];
	[memoryArray addObject:@"Excursion"];
	
	memoryContentExtractArray = [[NSMutableArray alloc]init];
	[memoryContentExtractArray addObject:@"This memory content This memory content This memory content This memory content This memory content This memory content"];
	[memoryContentExtractArray addObject:@"This memory content..."];
	[memoryContentExtractArray addObject:@"This memory content..."];
	[memoryContentExtractArray addObject:@"This memory content..."];
	[memoryContentExtractArray addObject:@"This memory content..."];
	[memoryContentExtractArray addObject:@"This memory content..."];
	
	self.view = aTableView;	
	
	deleteButton = [[UIBarButtonItem alloc] initWithTitle:@"Delete" 
															   style:UIBarButtonItemStyleBordered target:self action:@selector(deletePerformed)];
	
	UIImage *buttonImage = [UIImage imageNamed:@"addicon.png"];
	UIButton *aButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[aButton setImage:buttonImage forState:UIControlStateNormal];
	aButton.frame = CGRectMake(0.0, 0.0, 30, 30);
	
	UIBarButtonItem *aBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:aButton];
	[aButton addTarget:self action:@selector(addBtnPushed) forControlEvents:UIControlEventTouchUpInside];
	[buttonImage release];
	
	UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
	flexibleSpace.width=65;//130
	[self setToolbarItems:[NSArray arrayWithObjects:deleteButton,flexibleSpace , aBarButtonItem, nil]];
	[flexibleSpace release];

}

-(void) addBtnPushed{
	//self.navigationController.navigationBarHidden = NO;
	[self.navigationController pushViewController:[[NewMemoryView alloc] initWithNibName:@"NewView" bundle:Nil] animated:YES];
	
	
}
-(void) deletePerformed{
	
}

- (UITableViewCellAccessoryType)tableView:(UITableView *)tv accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath
{
	return UITableViewCellAccessoryDetailDisclosureButton;
}

/*
-(void) buttonTwoPushed{
	NSLog(@"II Button pushed");
	NSArray* selectedRows = [aTableView indexPathsForSelectedRows];
	int size = [selectedRows count];
	NSLog(@"there are %d objects in the array", size);
 
}
*/
	








 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad {
 [super viewDidLoad];	
	 //- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
	 //[self.navigationController setToolbarHidden:NO];
	 //self.navigationItem.title=@"Widdle";
	 self.navigationItem.hidesBackButton = YES;
	 
	 UILabel *wittleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 120, 30)];
	 [wittleLabel setBackgroundColor:[UIColor clearColor]];
	 [wittleLabel setTextColor:[UIColor whiteColor]];
	 wittleLabel.text = @"Wittle";
	 wittleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size: 22.0];
	 [wittleLabel sizeToFit];
	 self.navigationItem.titleView = wittleLabel;
	 [wittleLabel release];	 
	 
	 editButton = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(editPerform)];
	 self.navigationItem.rightBarButtonItem = editButton;
	 [editButton release];
	 
	 

 }
/*
- (void) logout{	

	self.navigationController.navigationBarHidden = YES;
	[self.navigationController setToolbarHidden:YES];
	//self.navigationController.navigationBarHidden = YES;
	NSArray *viewControllers = self.navigationController.viewControllers;
	UIViewController *rootViewController = [viewControllers objectAtIndex:0];
	[[rootViewController loginButton] setHidden:NO];
	[[rootViewController loginLabel] setHidden:YES];
	[[rootViewController loginIndicator] stopAnimating];
	[[rootViewController loginIndicator] setHidden:YES];
	[rootViewController popNavControllerToSelf];
}
*/
- (void) editPerform{
	if(@"Cancel"==editButton.title)
	{
		editButton.title=@"Edit";
		[aTableView setEditing:NO animated:YES];
	}
	else
	{
		
		editButton.title=@"Cancel";
		[aTableView setEditing:YES animated:YES];
	}

}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
	NSLog(@"Checking delete");
	if (editingStyle == UITableViewCellEditingStyleDelete) {
		/*
		UIAlertView *alert = [[UIAlertView alloc] 
							  initWithTitle: @"Delete" 
							  message: @"Do you really want to delete “George W. Bush”?" 
							  delegate: self
							  cancelButtonTitle: @"Cancel"
							  otherButtonTitles: @"Of course!", nil];
		 */
	}
}

-(UITableViewCellEditingStyle)tableView:(UITableView*)tableView editingStyleForRowAtIndexPath:(NSIndexPath*)indexPath {
	return 3;
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
		if(indexPath.section == 0) {
			if(indexPath.row != 2) 		{
				UIImageView  *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mail-attachment.png"]];
				cell.imageView= imageView;
				[cell.contentView addSubview:imageView];
		
			}
			else {
			
			UIImageView  *imageView = [UIImageView alloc];
				cell.imageView= imageView;
				[cell.contentView addSubview:imageView];
			}
			
		}
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

- (void)tableView: (UITableView *)tableView didSelectRowAtIndexPath: (NSIndexPath *)indexPath {
	NSLog(@"Inside cell select");
	if(@"Edit"==editButton.title)
	{
	NSString *selectedMemoryText = [memoryArray objectAtIndex:indexPath.row];
	NSString *selectedMemoryDetails = [memoryContentExtractArray objectAtIndex:indexPath.row];	
	
	
	DetailedMemoryView *controller = [[DetailedMemoryView alloc] initWithNibName:@"DetailedView" bundle:nil];
    controller.selectedMemoryText=selectedMemoryText;
	controller.selectedMemoryDetails=selectedMemoryDetails;
	/*
	controller.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentModalViewController:controller animated:YES];
    */
	//Undeletet the below line	
		//self.navigationController.navigationBarHidden = NO;
	[self.navigationController pushViewController:controller animated:YES];
	[controller release];
	}
}


@end
