//
//  WittleProjectViewController.m
//  WittleProject
//
//  Created by Zoeb Sheikh on 18/08/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import "DetailedMemoryView.h"
#import "MemoryListView.h"
#import "CompleteImageView.h"
#import  <QuartzCore/QuartzCore.h>

@implementation DetailedMemoryView
@synthesize selectedMemoryText;
@synthesize selectedMemoryDetails;

@synthesize aImageView;

-(IBAction)showFullImage{
	CompleteImageView *controller = [[CompleteImageView alloc] initWithNibName:@"FullImageView" bundle:nil];
	//self.navigationController.navigationBarHidden = NO;
	
    [self.navigationController pushViewController:controller animated:YES];
	[controller release];
}

-(IBAction)sharedPopUp{
	
	UIActionSheet *actionSheet = [[UIActionSheet alloc] 
								  initWithTitle:nil
								  delegate:self 
								  cancelButtonTitle:@"Cancel" 
								  destructiveButtonTitle:nil
								  otherButtonTitles:@"Share on Facebook", @"Share on Twitter", nil
								  ];
	[actionSheet showInView:[self view]];
	[actionSheet release];	
	/*	
	alert= [[UIAlertView alloc] initWithTitle:@"Share Image" message:@"Image sharing started" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Facebook",@"Twitter",nil];
	[alert show];
	[alert release];	
	 */
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
	NSString *selectedVal;
	NSString *selectedVal1;
	if (buttonIndex == 0)
	{
		selectedVal=@"To setup Facebook sharing, go to the Memory Hive website and click \"connect to Facebook\" on your profile page.";
		selectedVal1=@"Facebook sharing isn't setup";
		NSLog(@"fb");
	}
	else if(buttonIndex == 1)
	{
		selectedVal=@"To setup Twitter sharing, go to the Memory Hive website and click \"connect to Twitter\" on your profile page.";
		selectedVal1=@"Twitter sharing isn't setup";
		NSLog(@"Twitter");
	}
	else
	{
		NSLog(@"cancel");
	}
	
	
	if ((buttonIndex == 0)||(buttonIndex == 1))
	{
		alert= [[UIAlertView alloc] initWithTitle:selectedVal1 message:selectedVal delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		alert.tag=1;
		[alert show];
		[alert release];
	}
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	if(alertView.tag == 1) {
		//Put the Sharing Logic here
		NSLog(@"Button index is %i", buttonIndex);
	}
	if(alertView.tag == 2) {
		if(buttonIndex == 0) {
			//Put the deletion logic here
			[self.navigationController popViewControllerAnimated:YES];
		}
	}

}

-(IBAction)backButton{
	[self dismissModalViewControllerAnimated:YES];
	/*MemoryListView *controller = [[MemoryListView alloc] initWithNibName:nil bundle:nil];
    controller.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentModalViewController:controller animated:YES];
    [controller release];	*/
}
/*
- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
	NSString *selectedVal;
	if (buttonIndex ==0)
	{
		[self.navigationController popViewControllerAnimated:YES];
	}
}
*/

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
	 
	 UIImage *buttonImage = [UIImage imageNamed:@"Image1.jpg"];
	 [thumbnailButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
	 
	 
	 
	 
	 
	 
	 
	 UIImage *buttonshareImage = [UIImage imageNamed:@"share_icon-1.png"];
	 UIButton *aButton = [UIButton buttonWithType:UIButtonTypeCustom];
	 [aButton setImage:buttonshareImage forState:UIControlStateNormal];
	 aButton.frame = CGRectMake(0.0, 0.0, 30, 30);
	 
	 UIBarButtonItem *aBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:aButton];
	 [aButton addTarget:self action:@selector(sharedPopUp) forControlEvents:UIControlEventTouchUpInside];
	 [buttonImage release];
	 
	 UIImage *buttonDeleteImage = [UIImage imageNamed:@"deleteIcon.png"];
	 UIButton *aButton1 = [UIButton buttonWithType:UIButtonTypeCustom];
	 [aButton1 setImage:buttonDeleteImage forState:UIControlStateNormal];
	 aButton1.frame = CGRectMake(0.0, 0.0, 30, 30);
	 
	 UIBarButtonItem *aDeleteBarItem = [[UIBarButtonItem alloc] initWithCustomView:aButton1];
	 [aButton1 addTarget:self action:@selector(deletePerformed) forControlEvents:UIControlEventTouchUpInside];
	
	 
	
	 
	 UIBarButtonItem *deleteButton = [[UIBarButtonItem alloc]
								   initWithBarButtonSystemItem:UIBarButtonSystemItemTrash
									  target:self action:@selector(deletePerformed)];
	 
	 UIBarButtonItem *shareButton = [[UIBarButtonItem alloc]
									  initWithBarButtonSystemItem:UIBarButtonSystemItemAction
									  target:self action:@selector(sharedPopUp)];
	
	 
	 
	 UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
	 flexibleSpace.width=250;
	 [self setToolbarItems:[NSArray arrayWithObjects:deleteButton,flexibleSpace , shareButton, nil]];
	 [flexibleSpace release];
	 /*
	 UIBarButtonItem *logoutBtn = [[UIBarButtonItem alloc] initWithTitle:@"Logout" 
																   style:UIBarButtonItemStyleBordered target:self action:@selector(logout)];
	 NSArray *barArray = [NSArray arrayWithObjects: logoutBtn, nil];
	 [logoutBtn release];	 
	 [self setToolbarItems:barArray animated:YES];	
	 */
	 /*
	 aImageView = [[UIImageView alloc]initWithFrame:CGRectMake(135, 50, 50, 50)];
	 aImageView.opaque = YES;
	 aImageView.contentMode = UIViewContentModeScaleAspectFill;
	 aImageView.image = [UIImage imageNamed:@"imagebig.png"];
	 aImageView.clipsToBounds = YES;
	 [self.view addSubview:aImageView];	
	  */
	 //txtMemory1.layer.borderWidth=1;
	 //txtMemory1.layer.borderColor = [[UIColor grayColor] CGColor];
	 
	 lblMemory1.layer.borderColor = [[UIColor lightGrayColor] CGColor];
	 
	 
	 UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"paperclip.png"]];
	 imageView.frame=CGRectMake(280,1,30,30);
	 //cell.accessoryView = imageView;
	 //[lblMemory1 addSubview:imageView];
	 [imageView release];
	 
 }



-(void)deletePerformed {

	UIAlertView *alert= [[UIAlertView alloc] initWithTitle:@"Delete this memory?" message:@"Are you sure you want to delete this memory? You can't undo this action." delegate:self cancelButtonTitle:@"Delete" otherButtonTitles:@"No",nil];
	alert.tag=2;
	[alert show];
	[alert release];	
	
}

 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad {
	 [super viewDidLoad];
	 UILabel *wittleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 120, 30)];
	 [wittleLabel setBackgroundColor:[UIColor clearColor]];
	 [wittleLabel setTextColor:[UIColor whiteColor]];
	 wittleLabel.text = selectedMemoryText;
	 wittleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size: 22.0];
	 [wittleLabel sizeToFit];
	 self.navigationItem.titleView = wittleLabel;
	 [wittleLabel release];	 
	 
	 //self.navigationItem.leftBarButtonItem.title=@"Back";
	 //self.navigationItem.title=@"Widdle";
	 
	// UIBarButtonItem *logoutBtn = [[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStylePlain target:self action:@selector(logout)];
	 
	// self.navigationItem.rightBarButtonItem = logoutBtn;
	// [logoutBtn release];	 
	 aTableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 10, 320, 430) style:UITableViewStyleGrouped];
	 aTableView.delegate = self;
	 aTableView.dataSource = self;
	 aTableView.autoresizesSubviews = YES;
	 //[self.view addSubview:aTableView];	
	 
	 //UITextView *memoryContents=[[UITextView alloc] initWithFrame:CGRectMake(0, 50, 320, 430)];
	 //memoryContents.text=selectedMemoryDetails;	
	 //[txtMemory addSubview:memoryContents];
	 /*
	 shareButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	 shareButton.frame = CGRectMake(295,190, 20, 20);
	 [shareButton addTarget:self action:@selector(sharedPopUp) forControlEvents:UIControlEventTouchUpInside];
	 //[shareButton setTitle:@"Logout" forState:UIControlStateNormal];
	 
	 UIImage *buttonImage1 = [UIImage imageNamed:@"share_icon-1.png"];
	 [shareButton setBackgroundImage:buttonImage1 forState:UIControlStateNormal];
	 
	 [txtMemory1 addSubview:shareButton];
	 */
	 
	 //lblMemory.text=@"05 September 2011";
	 //lblMemory1.text=@"05 September 2011";	
	 txtMemory1.text=selectedMemoryDetails;
	 
	[txtMemory1 setFont:[UIFont fontWithName:@"Helvetica" size: 14.0]];
 }

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *MyIdentifier = @"My Identifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
	
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:MyIdentifier  ] autorelease];

		cell.frame = CGRectMake(0, 200, 320, 280);
		//UILabel *labelField = [UILabel alloc];
		UILabel *labelField = [[UILabel alloc] initWithFrame:CGRectZero];
		
		labelField.text=selectedMemoryDetails;
		[labelField setLineBreakMode:UILineBreakModeWordWrap];
		[labelField setFont:[UIFont systemFontOfSize:12]];
		[labelField setNumberOfLines:0];
		//labelField.bounds = cell.bounds;
		
		//[cell.contentView autoresizesSubviews];
		CGRect contentRect = cell.contentView.bounds;
		//NSLog()
		CGFloat boundsX = contentRect.origin.x;
		CGRect frame;
		//frame= CGRectMake(0, 0, 320, 70);
		//frame= CGRectMake(0, 200, 320, 280);
		
		
		frame= CGRectMake(boundsX+5 ,10, 290, 260);
		labelField.frame = frame;
		//memoryContentExtract.frame = frame;
		[labelField sizeToFit]; // To top align the text on the label
		[cell.contentView addSubview:labelField];
		[labelField release];	
	}
    
    if(indexPath.section == 0) {
		//cell.textLabel.text = selectedMemoryDetails;
	   // cell.memoryContentExtract.text = [memoryContentExtractArray objectAtIndex:indexPath.row];
	}
	else {
		[cell setText:@"I am in Section 2"];
	}
	cell.textColor = [UIColor blueColor];
	
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView
	heightForRowAtIndexPath:(NSIndexPath *)indexPath
	{
		//return 350;
		
		NSString *text = selectedMemoryDetails;
		
		CGSize constraint = CGSizeMake(320 - (10 * 2), 20000.0f);
		
		CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:12] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
		
		CGFloat height = MAX(size.height, 44.0f);
		if((height + (10 * 2))>350) {
			return height + (10 * 2) + 5;
		}
		return height + (10 * 2) +5;
		//return 350;
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
	[selectedMemoryText release];
	[selectedMemoryDetails release];
    [super dealloc];
}

@end
