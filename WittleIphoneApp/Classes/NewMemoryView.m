//
//  NewMemoryView.m
//  WittleIphoneApp
//
//  Created by Zoeb Sheikh on 24/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NewMemoryView.h"
#import "CompleteImageView.h"
#import  <QuartzCore/QuartzCore.h>
#import <MediaPlayer/MediaPlayer.h>
#import <MobileCoreServices/UTCoreTypes.h>


@implementation NewMemoryView



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
- (void)keyboardWillShow:(NSNotification *)notif
{
	//[btnDismissKB setHidden:NO];
	if(photoPicked==NO){
		[btnCameraIcon2 setHidden:YES];
		[btnCameraIcon setHidden:NO];
	}
	
	
}
- (void)keyboardWillHide:(NSNotification *)n
{
	[btnDismissKB setHidden:YES];	
	if(photoPicked==NO)
	{		
		[btnCameraIcon setHidden:YES];
		[btnCameraIcon2 setHidden:NO];
	}	
}

- (IBAction)dismissKeyboard: (id)sender;{
	[memoryTitle resignFirstResponder];
	[memoryContent resignFirstResponder];
}
-(IBAction) getVideomedium:(id) sender {
		NSLog(@"TEST...");
	if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) 
	{
		UIImagePickerController *tmp_picker=[[UIImagePickerController alloc]init]; 
		tmp_picker.sourceType =UIImagePickerControllerSourceTypeCamera;
		
		tmp_picker.mediaTypes = [NSArray arrayWithObject:(NSString *)kUTTypeMovie];
		
		tmp_picker.delegate=self;
		
		[self presentModalViewController:tmp_picker animated:YES];
		[tmp_picker release];
		NSLog(@"TEST");
		
		
	}

}

- (void)video:(NSString *)videoPath didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    if (error != nil) {
        NSLog(@"Error: %@", error);
    }
}


-(BOOL) application:(UIApplication *) application didFinishLaunchingWithOptions: (NSDictionary *) launchOptions {
	NSString *path0  = [[NSBundle mainBundle] pathForResource:@"Movie" ofType:@"m4v"];
	UISaveVideoAtPathToSavedPhotosAlbum(path0, self, @selector(video:didFinishSavingWithError:contextInfo:),nil);
	return YES;
}

- (BOOL) textViewShouldBeginEditing:(UITextView *)textView
{
	if(memoryContent.text.length == 0) {
		memoryContentPlaceHolder.hidden = NO;
	}
	else {
		memoryContentPlaceHolder.hidden = YES;
	}
	return YES;
}

-(void) textViewDidChange:(UITextView *)textView
{
	NSLog(@"Length");
	//NSLog(memoryContent.text.length);
	if(memoryContent.text.length == 0) {
		NSLog(@"Length1");
		memoryContentPlaceHolder.hidden = NO;
	}
	else {
		NSLog(@"Length2");
		memoryContentPlaceHolder.hidden = YES;
	}
}


-(IBAction) getVideo:(id) sender {
	//NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	//NSString *documentsDirectory = [paths objectAtIndex:0];
	//NSString *path =  [documentsDirectory stringByAppendingPathComponent:@"Movie.m4v"];
NSString *path  = [[NSBundle mainBundle] pathForResource:@"Movie" ofType:@"m4v"];
	//NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/Movie.m4v"]];
  UISaveVideoAtPathToSavedPhotosAlbum(path, self, @selector(video:didFinishSavingWithError:contextInfo:), nil);
	
	
	

	UIImagePickerController *picker = [[UIImagePickerController alloc] init];
	picker.delegate = self;
	picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
	//picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
	//picker.mediaTypes =  [[[NSArray alloc] initWithObjects: (NSString *) kUTTypeMovie, nil] autorelease];
	
	//picker.mediaTypes = [NSArray arrayWithObjects:
					//		  (NSString *) kUTTypeImage,
					//		  (NSString *) kUTTypeMovie, nil];
	
	picker.mediaTypes = [UIImagePickerController  availableMediaTypesForSourceType:picker.sourceType];
	
	//picker.mediaTypes =
    //[UIImagePickerController availableMediaTypesForSourceType:
	// UIImagePickerControllerSourceTypeCamera];
	
	
	picker.allowsEditing = NO;
    picker.wantsFullScreenLayout = YES;
	//picker.videoQuality = UIImagePickerControllerQualityTypeHigh;
	[self presentModalViewController:picker animated:YES];
	[picker release];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)img editingInfo:(NSDictionary *)editInfo {
	NSLog(@"Video Selected");
 [[picker parentViewController] dismissModalViewControllerAnimated: YES];
}



-(IBAction) getPhoto:(id) sender {
	NSLog(@"Get Photo");
	
	UIActionSheet *actionSheet = [[UIActionSheet alloc] 
									initWithTitle:@"Add Media"
									delegate:self 
									cancelButtonTitle:@"Cancel" 
									destructiveButtonTitle:nil
									otherButtonTitles:@"New photo or video", @"Existing photo or video", nil
								 ];
	[actionSheet showInView:[self view]];
	[actionSheet release];
	
	/*
	UIImagePickerController * picker = [[UIImagePickerController alloc] init];
	picker.delegate = self;
	
	if((UIButton *) sender == btnCameraIcon || (UIButton *) sender == btnCameraIcon2) {
		picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
	} else {
		
		picker.sourceType = UIImagePickerControllerSourceTypeCamera;
	}
	
	[self presentModalViewController:picker animated:YES];
	 */
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
	if(buttonIndex == 0) {
		if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
		{
			UIImagePickerController * picker = [[UIImagePickerController alloc] init];
			picker.delegate = self;
			//picker.mediaTypes = [UIImagePickerController  availableMediaTypesForSourceType:picker.sourceType];
			picker.mediaTypes = [NSArray arrayWithObjects:
								 (NSString *) kUTTypeImage,
								 (NSString *) kUTTypeMovie, nil];
			picker.sourceType = UIImagePickerControllerSourceTypeCamera;
		
			NSArray *sourceTypes = 
			[UIImagePickerController availableMediaTypesForSourceType:picker.sourceType];
			if ([sourceTypes containsObject:(NSString *)kUTTypeImage ] ||
				[sourceTypes containsObject:(NSString *)kUTTypeMovie ]
				) {
				[self presentModalViewController:picker animated:YES];
			}
			[picker release];
		}
	}
	if(buttonIndex == 1) {
		UIImagePickerController * picker = [[UIImagePickerController alloc] init];
		picker.delegate = self;
		//picker.mediaTypes = [UIImagePickerController  availableMediaTypesForSourceType:picker.sourceType];
		picker.mediaTypes = [NSArray arrayWithObjects:
							 (NSString *) kUTTypeImage,
							 (NSString *) kUTTypeMovie, nil];
		picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
		NSArray *sourceTypes = 
		[UIImagePickerController availableMediaTypesForSourceType:picker.sourceType];
		if ([sourceTypes containsObject:(NSString *)kUTTypeImage ] ||
			[sourceTypes containsObject:(NSString *)kUTTypeMovie ]
			) {
			[self presentModalViewController:picker animated:YES];
		}
		[picker release];
	}
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
	[picker dismissModalViewControllerAnimated:YES];
	NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
	
	if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) 
	{
		// Media is an image
		paperclipImageView.hidden = NO;
		UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
	}
	else if ([mediaType isEqualToString:(NSString *)kUTTypeMovie])
	{
		// Media is a video
		paperclipImageView.hidden = NO;
		NSURL *url = [info objectForKey:UIImagePickerControllerMediaURL];
	}
	//memoryContent.layer.borderWidth=1;
	//memoryContent.layer.borderColor = [[UIColor grayColor] CGColor];
	//[btnCameraIcon setHidden:NO];
	
	//[btnCameraIcon2 setHidden:YES];
	//photoPicked=YES;
	//NSArray *keys = [info allKeys];
	//id aKey = [keys objectAtIndex:0];
	//id anObject = [info objectForKey:aKey];
	//UIImage *image = anObject;
	//UIImageView *imageView = 	//imageView.image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
	//self.imageView = [[UIImageView alloc] initWithImage:image];

	//[btnShowImage setBackgroundImage:[info objectForKey:@"UIImagePickerControllerOriginalImage"] forState:UIControlStateNormal];
}

//*****************************************
//*****************************************
//********** RECORD VIDEO CANCEL **********
//*****************************************
//*****************************************
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
	[self dismissModalViewControllerAnimated:YES];
}


/*
-(void)logout {
	
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


- (void)viewDidLoad {
    [super viewDidLoad];
	memoryTitle.delegate = self;
	memoryContent.delegate = self;
	[btnDismissKB setHidden:YES];
	// register for keyboard notifications
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(keyboardWillShow:) 
												 name:UIKeyboardWillShowNotification 
											   object:self.view.window];
	// register for keyboard notifications
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(keyboardWillHide:) 
												 name:UIKeyboardWillHideNotification 
											   object:self.view.window];	
	
	wittleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 120, 30)];
	[wittleLabel setBackgroundColor:[UIColor clearColor]];
	[wittleLabel setTextColor:[UIColor whiteColor]];
	wittleLabel.text = @"New Memory";
	wittleLabel.font = [UIFont fontWithName:@"Arial" size: 16.0];
	wittleLabel.tag=10;
	[wittleLabel sizeToFit];
	self.navigationItem.titleView = wittleLabel;
	[wittleLabel release];
	
	
	
	[btnCameraIcon setHidden:YES];
	
	[btnCameraIcon2 setHidden:NO];
	photoPicked=NO;
	//view.layer.borderWidth = 5.0f;

	
	
	[memoryTitle addTarget:self action:@selector(updateLabelUsingContentsOfTextField:) forControlEvents:UIControlEventEditingChanged];
		
	UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithTitle:@"Save" 
	style:UIBarButtonItemStyleDone target:self action:@selector(savePushed)]; 
	
	UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" 
																   style:UIBarButtonItemStylePlain target:self action:@selector(cancelPushed)]; 
	self.navigationItem.rightBarButtonItem = saveButton;
	//self.navigationItem.rightBarButtonItem.style = UIBarButtonItemStyleDone;
	self.navigationItem.leftBarButtonItem = cancelButton;
	[saveButton release];
	[cancelButton release];
	 
	/*
	aTableView = [[UITableView alloc] initWithFrame:CGRectMake(80, 60, 220, 310) style:UITableViewStyleGrouped];
	aTableView.delegate = self;
	aTableView.dataSource = self;
	aTableView.autoresizesSubviews = YES;
	[self.view addSubview:aTableView];	
	 */
	
	UIImage *buttonImage = [UIImage imageNamed:@"snapshots.png"];
	[btnLeftImage setBackgroundImage:buttonImage forState:UIControlStateNormal];	 
	[btnRightImage setBackgroundImage:buttonImage forState:UIControlStateNormal];	
	
	buttonImage = [UIImage imageNamed:@"camera.png"];
	[btnCameraIcon setBackgroundImage:buttonImage	 forState:UIControlStateNormal];	 
	[btnCameraIcon2 setBackgroundImage:buttonImage	 forState:UIControlStateNormal];
	
	
	//memoryContent.text = @"  Tap to add content";
	//memoryContent.textColor = [UIColor lightGrayColor];
	[memoryContent setFont:[UIFont fontWithName:@"Helvetica" size: 14.0]];
	memoryTitle.layer.borderColor = [[UIColor lightGrayColor] CGColor];
	[memoryContent becomeFirstResponder];
	
	//paperclipImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"paperclip.png"]];
	paperclipImageView.image = [UIImage imageNamed:@"paperclip.png"];
	paperclipImageView.hidden = YES;
	//imageView.frame=CGRectMake(280,1,30,30);
	//[lblMemory1 addSubview:imageView];
	//[imageView release];
	
}

- (void) savePushed {
	[self.navigationController popViewControllerAnimated:YES];
}

- (void) cancelPushed {
	if([memoryTitle.text isEqualToString:@""] && 
		[memoryContent.text isEqualToString:@""] &&
		imageView == nil
	  ) {
		[self.navigationController popViewControllerAnimated:YES];
	}
	else {
		UIAlertView *alert= [[UIAlertView alloc] initWithTitle:@"Discard changes?" message:@"Really discard changes?" delegate:self cancelButtonTitle:@"Yes" otherButtonTitles:@"No",nil];
		[alert show];
		[alert release];
	}
	
}

- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
	NSString *selectedVal;
	if (buttonIndex ==0)
	{
		[self.navigationController popViewControllerAnimated:YES];
	}
}

- (void)updateLabelUsingContentsOfTextField:(id)sender {
	
	//Removing the logic to update the title bar with Memory title
    //wittleLabel.text = [NSString stringWithFormat:@"%@", ((UITextField *)sender).text];
	
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
		
		cell.frame = CGRectMake(0, 200, 220, 310);
		//UILabel *labelField = [UILabel alloc];
		UITextView *textViewField = [[UITextView alloc] initWithFrame:CGRectZero];
		textViewField.text=@"Hello this is test";
		//[textViewField setLineBreakMode:UILineBreakModeWordWrap];
		[textViewField setFont:[UIFont systemFontOfSize:12]];
		//[textViewField setNumberOfLines:0];
		//labelField.bounds = cell.bounds;
		
		//[cell.contentView autoresizesSubviews];
		CGRect contentRect = cell.contentView.bounds;
		//NSLog()
		CGFloat boundsX = contentRect.origin.x;
		CGRect frame;
		//frame= CGRectMake(0, 0, 320, 70);
		//frame= CGRectMake(0, 200, 320, 280);
		
		
		frame= CGRectMake(boundsX+5 ,10, 190, 310);
		textViewField.frame = frame;
		//memoryContentExtract.frame = frame;
		[textViewField sizeToFit]; // To top align the text on the label
		[cell.contentView addSubview:textViewField];
		[textViewField release];	
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
	return 350;
	/*
	NSString *text = @"Hello this is test";
	
	CGSize constraint = CGSizeMake(320 - (10 * 2), 20000.0f);
	
	CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:12] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
	
	CGFloat height = MAX(size.height, 44.0f);
	if((height + (10 * 2))>350) {
		return height + (10 * 2) + 5;
	}
	//return height + (10 * 2) +5;
	return 350;
	 */
}
/* Uncomment this method if you want to hide the keyboard at the press of return key
- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
	[theTextField resignFirstResponder];
	return YES;
}
 */

-(IBAction)showFullImage{
	
	CompleteImageView *controller = [[CompleteImageView alloc] initWithNibName:@"FullImageView" bundle:nil];
	
	//[controller setImageFullView:imageView];
	//self.navigationController.navigationBarHidden = NO;
    [self.navigationController pushViewController:controller animated:YES];
	[controller release];
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
	// unregister for keyboard notifications while not visible.
    [[NSNotificationCenter defaultCenter] removeObserver:self 
                                                    name:UIKeyboardWillShowNotification 
                                                  object:nil]; 
    // unregister for keyboard notifications while not visible.
    [[NSNotificationCenter defaultCenter] removeObserver:self 
                                                    name:UIKeyboardWillHideNotification 
                                                  object:nil];  
	
}


- (void)dealloc {
    [super dealloc];
}

/*
-(void)playMovieAtURL:(NSURL*)theURL
{
    MPMoviePlayerController* thePlayer = [[MPMoviePlayerController alloc] initWithContentURL:theURL];
	
    thePlayer.scalingMode = MPMovieScalingModeAspectFill;
    thePlayer.controlStyle = MPMovieControlStyleNone;
	
    // Register for the playback finished notification.
    [[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(myMovieFinishedCallback:)
												 name:MPMoviePlayerPlaybackDidFinishNotification
											   object:thePlayer];
	
    // Movie playback is asynchronous, so this method returns immediately.
    [thePlayer play];
}

// When the movie is done, release the controller.
-(void)myMovieFinishedCallback:(NSNotification*)aNotification
{
    MPMoviePlayerController* thePlayer = [aNotification object];
	
    [[NSNotificationCenter defaultCenter] removeObserver:self
													name:MPMoviePlayerPlaybackDidFinishNotification
												  object:thePlayer];
	
    // Release the movie instance created in playMovieAtURL:
    [thePlayer release];
}
*/

@end
