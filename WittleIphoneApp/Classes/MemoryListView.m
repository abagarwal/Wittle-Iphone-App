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
    //toolbar.hidden = !inPseudoEditMode;
	
	[self.view reloadData];
	
}
- (void)populateSelectedArray
{
	NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:[memoryArray count]];
	for (int i=0; i < [memoryArray count]; i++)
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
	
	aTableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
	//aTableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame] style:UITableViewStyleGrouped];
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
	
	
	UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
	[button setBackgroundImage:[UIImage imageNamed:@"deletecolor.png"] forState:UIControlStateNormal];
	[button setTitle:@"Delete" forState:UIControlStateNormal];
	button.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:12.0f];
	//[button.layer setCornerRadius:4.0f];
	//[button.layer setMasksToBounds:YES];
	//[button.layer setBorderWidth:1.0f];
	//[button.layer setBorderColor: [[UIColor grayColor] CGColor]];
	button.frame=CGRectMake(0.0, 100.0, 60.0, 30.0);
	[button addTarget:self action:@selector(deletePerformed) forControlEvents:UIControlEventTouchUpInside];
	
	UIBarButtonItem* deleteItem = [[UIBarButtonItem alloc] initWithCustomView:button];	
	
	
	UIImage *buttonImage = [UIImage imageNamed:@"addicon.png"];
	UIButton *aButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[aButton setImage:buttonImage forState:UIControlStateNormal];
	aButton.frame = CGRectMake(0.0, 0.0, 30, 30);
	
	UIBarButtonItem *aBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:aButton];
	[aButton addTarget:self action:@selector(addBtnPushed) forControlEvents:UIControlEventTouchUpInside];
	[buttonImage release];
	
	UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
	flexibleSpace.width=135;//130
	
	UIBarButtonItem *addButton = [[UIBarButtonItem alloc]
								  initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addBtnPushed)];
	//[addButton addTarget:self action:@selector(addBtnPushed) forControlEvents:UIControlEventTouchUpInside];
	//self.navigationItem.rightBarButtonItem = addButton;
	[self setToolbarItems:[NSArray arrayWithObjects:flexibleSpace , addButton, nil]];
	//[self setToolbarItems:[NSArray arrayWithObjects:deleteItem,flexibleSpace , aBarButtonItem, nil]];
	[flexibleSpace release];
	

}

-(void) addBtnPushed{
	//self.navigationController.navigationBarHidden = NO;
	[self.navigationController pushViewController:[[NewMemoryView alloc] initWithNibName:@"NewView" bundle:Nil] animated:YES];
	
	
}
-(void) deletePerformed{
	[self doDelete];
	[self populateSelectedArray];
	[self togglePseudoEditMode];
	
}

- (UITableViewCellAccessoryType)tableView:(UITableView *)tv accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath
{
	//return UITableViewCellAccessoryDetailDisclosureButton;
	return UITableViewCellAccessoryDisclosureIndicator;
}

/*
-(void) buttonTwoPushed{
	NSLog(@"II Button pushed");
	NSArray* selectedRows = [aTableView indexPathsForSelectedRows];
	int size = [selectedRows count];
	NSLog(@"there are %d objects in the array", size);
 
}
*/
	
/*
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSLog(@"Zoeb");

}


*/





 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad {
 [super viewDidLoad];	
	 //- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
	 //[self.navigationController setToolbarHidden:NO];
	 //self.navigationItem.title=@"Widdle";
	 
	 
	 UIImage  *imageView1 = [UIImage imageNamed:@"selected.png"];
	 UIImage  *imageView2 = [UIImage imageNamed:@"unselected.png"];
	 self.selectedImage = imageView1;
	 self.unselectedImage = imageView2;
	 [imageView1 release];
	 [imageView2 release];
	 
	 self.navigationItem.hidesBackButton = YES;
	 
	 UILabel *wittleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 120, 30)];
	 [wittleLabel setBackgroundColor:[UIColor clearColor]];
	 [wittleLabel setTextColor:[UIColor whiteColor]];
	 wittleLabel.text = @"Memory Hive";
	 //wittleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size: 22.0];
	 [wittleLabel sizeToFit];
	 self.navigationItem.titleView = wittleLabel;
	 [wittleLabel release];	 
	 
	 editButton = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(editPerform)];
	 self.navigationItem.rightBarButtonItem = editButton;
	 [editButton release];
	 
	 [self populateSelectedArray];
	 
	 

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
/*
- (void) editPerform{
	[self togglePseudoEditMode];
	
	if(@"Cancel"==editButton.title)
	{
		editButton.title=@"Edit";
		//[aTableView setEditing:NO animated:YES];
	}
	else
	{
		
		editButton.title=@"Cancel";
		//[aTableView setEditing:YES animated:YES];
	}
	 
}
*/

- (void) editPerform{
	if(@"Done"==editButton.title)
	{
		editButton.title=@"Edit";
		editButton.style = UIBarButtonItemStylePlain;
		[aTableView setEditing:NO animated:YES];
	}
	else
	{
		
		editButton.title=@"Done";
		editButton.style = UIBarButtonItemStyleDone;
		[aTableView setEditing:YES animated:YES];
	}
	
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
	NSLog(@"Checking delete");
	if (editingStyle == UITableViewCellEditingStyleDelete) {
		NSLog(@"Checking delete1");
		[memoryArray removeObjectAtIndex:indexPath.row];
		[memoryContentExtractArray removeObjectAtIndex:indexPath.row];
		[aTableView reloadData];
	}
}



-(UITableViewCellEditingStyle)tableView:(UITableView*)tableView editingStyleForRowAtIndexPath:(NSIndexPath*)indexPath {
	return 1;
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
		cell = [[[ListMemoryCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:MyIdentifier] autorelease];
	}	
		
	if(indexPath.section == 0) {
		
		if(indexPath.row != 2) 		{
			UIImage *cellImage = [UIImage imageNamed:@"paperclip.png"];
			cell.imageView.image = cellImage;
		}
		else{
			cell.imageView.image = [UIImage alloc];
		}
		
		cell.textLabel.text = [memoryArray objectAtIndex:indexPath.row];
		cell.detailTextLabel.text = [memoryContentExtractArray objectAtIndex:indexPath.row];
		
	}
	else {
		[cell setText:@"I am in Section 2"];
	}
	
    return cell;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *MyIdentifier = @"My Identifier";
    
    ListMemoryCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
	if (cell == nil) {
		//cell = [[[ListMemoryCell alloc] initWithFrame:CGRectZero reuseIdentifier:MyIdentifier] autorelease];
		cell = [[[ListMemoryCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:MyIdentifier] autorelease];
		//[cell initWithStyle:UITableViewCellStyleSubtitle];
		//UILabel *label = [[UILabel alloc] initWithFrame:kLabelRect];
		//label.tag = kCellLabelTag;
		//[cell.contentView addSubview:label];
		//[label release];
		
		UIImageView *imageView = [[UIImageView alloc] initWithImage:unselectedImage];
		imageView.frame = CGRectMake(5.0, 10.0, 23.0, 23.0);
		[cell.contentView addSubview:imageView];
		imageView.hidden = !inPseudoEditMode;
		imageView.tag = kCellImageViewTag;
		[imageView release];
		
		
		
		
		if(indexPath.section == 0) {
			if(indexPath.row != 2) 		{
				UIImageView  *imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"paperclip.png"]];
				cell.imageView= imageView1;
				[cell.contentView addSubview:imageView1];
				
				
				UIImageView  *imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"paperclip.png"]];
				cell.imageView2= imageView2;
				imageView2.hidden = YES;
				[cell.contentView addSubview:imageView2];
				imageView2.hidden = YES;			
				
			}
			else {
				
				UIImageView  *imageView1 = [UIImageView alloc];
				cell.imageView= imageView1;
				[cell.contentView addSubview:imageView1];
				
				
				UIImageView  *imageView2 = [UIImageView alloc];
				cell.imageView2= imageView2;
				imageView2.hidden = YES;
				[cell.contentView addSubview:imageView2];
			imageView2.hidden = YES;			}
			
		}
	}
	
	if(indexPath.section == 0) {
		cell.memoryTitle.text = [memoryArray objectAtIndex:indexPath.row];
		NSLog(cell.memoryTitle.text);
	    cell.memoryContentExtract.text = [memoryContentExtractArray objectAtIndex:indexPath.row];
		cell.textLabel.text = [memoryArray objectAtIndex:indexPath.row];
		cell.detailTextLabel.text = [memoryContentExtractArray objectAtIndex:indexPath.row];
		
		cell.memoryTitle2.text = [memoryArray objectAtIndex:indexPath.row];
		NSLog(cell.memoryTitle2.text);
	    cell.memoryContentExtract2.text = [memoryContentExtractArray objectAtIndex:indexPath.row];
		
	}
	else {
		[cell setText:@"I am in Section 2"];
	}
	
	[UIView beginAnimations:@"cell shift" context:nil];
	
	//UILabel *label = (UILabel *)[cell.contentView viewWithTag:kCellLabelTag];
	//label.text = [countries objectAtIndex:[indexPath row]];
	//label.frame = (inPseudoEditMode) ? kLabelIndentedRect : kLabelRect;
	
	if(inPseudoEditMode) {
		UIImageView *attachImage = cell.imageView;
		UIImageView *attachImage2 = cell.imageView2;
		attachImage.hidden = YES;
		attachImage2.hidden = NO;
		
		UILabel *label1 = cell.memoryTitle;
		UILabel *label11 = cell.memoryTitle2;
		//label1.frame = CGRectMake(200 ,5, 200, 25);
		label1.hidden = YES;
		label11.hidden = NO;
		
		UILabel *label2 = cell.memoryContentExtract;
		UILabel *label22 = cell.memoryContentExtract2;
		label2.hidden = YES;
		label22.hidden = NO;
		//label2.frame = CGRectMake(200 ,25, 100, 15);
		
		
	}
	else {
		UIImageView *attachImage = cell.imageView;
		UIImageView *attachImage2 = cell.imageView2;
		attachImage.hidden = NO;
		attachImage2.hidden = YES;
		
		UILabel *label1 = cell.memoryTitle;
		UILabel *label11 = cell.memoryTitle2;
		//label1.frame = CGRectMake(200 ,5, 200, 25);
		label1.hidden = NO;
		label11.hidden = YES;
		
		UILabel *label2 = cell.memoryContentExtract;
		UILabel *label22 = cell.memoryContentExtract2;
		label2.hidden = NO;
		label22.hidden = YES;
		//label2.frame = CGRectMake(200 ,25, 100, 15);
		
	}
	
	UIImageView *imageView = (UIImageView *)[cell.contentView viewWithTag:kCellImageViewTag];
	NSNumber *selected = [selectedArray objectAtIndex:[indexPath row]];
	imageView.image = ([selected boolValue]) ? selectedImage : unselectedImage;
	imageView.hidden = !inPseudoEditMode;
	[UIView commitAnimations];
    
	
	//cell.textColor = [UIColor blueColor];
	
    return cell;
}
*/
 

/*

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
	
	if(indexPath.section == 0) {
		
		if(indexPath.row != 2) 		{
			UIImage *cellImage = [UIImage imageNamed:@"paperclip.png"];
			cell.imageView.image = cellImage;
		}
		else{
			cell.imageView.image = [UIImage alloc];
		}
		
		
		cell.textLabel.text = [memoryArray objectAtIndex:indexPath.row];
		cell.detailTextLabel.text = [memoryContentExtractArray objectAtIndex:indexPath.row];
	}
    
    //cell.textLabel.text = @"Shakespeare's Sonnet 1: From Fairest Creatures We Desire Increase";
	//cell.detailTextLabel.text = @"We want all beautiful creatures to reproduce themselves so...";
    return cell;
}

*/

- (void)tableView: (UITableView *)tableView didSelectRowAtIndexPath: (NSIndexPath *)indexPath {
	
	//[self.aTableView deselectRowAtIndexPath:indexPath animated:YES];
	if (inPseudoEditMode)
	{
		BOOL selected = [[selectedArray objectAtIndex:[indexPath row]] boolValue];
		[selectedArray replaceObjectAtIndex:[indexPath row] withObject:[NSNumber numberWithBool:!selected]];
		[self.view reloadData];
	}
	else if(@"Cancel"==editButton.title)
	{
		[self.aTableView deselectRowAtIndexPath:indexPath animated:YES];
	}
	
	
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
