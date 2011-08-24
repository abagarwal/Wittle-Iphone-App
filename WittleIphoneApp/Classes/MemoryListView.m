//
//  MemoryListView.m
//  WittleIphoneApp
//
//  Created by Abhishek Agarwal on 18/08/11.
//  Copyright 2011 Systech. All rights reserved.
//

#import "MemoryListView.h"
#import "ListMemoryCell.h"


@implementation MemoryListView

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
	[memoryContentExtractArray addObject:@"This memory content..."];
	[memoryContentExtractArray addObject:@"This memory content..."];
	[memoryContentExtractArray addObject:@"This memory content..."];
	[memoryContentExtractArray addObject:@"This memory content..."];
	[memoryContentExtractArray addObject:@"This memory content..."];
	[memoryContentExtractArray addObject:@"This memory content..."];
	
	self.view = aTableView;
}



 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad {
 [super viewDidLoad];
	 self.navigationItem.hidesBackButton = YES;
	 
	 UIBarButtonItem *logoutBtn = [[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStylePlain target:self action:@selector(logout)];
	 //:@selector(buttonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
	 
	 self.navigationItem.rightBarButtonItem = logoutBtn;
	 [logoutBtn release];
 }

- (void) logout{
	self.navigationController.navigationBarHidden = YES;
	[self.navigationController popViewControllerAnimated:NO];
	
	
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


@end
