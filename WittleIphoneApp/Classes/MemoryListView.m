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
	self.navigationItem.hidesBackButton = YES;
	
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

- (void)tableView: (UITableView *)tableView didSelectRowAtIndexPath: (NSIndexPath *)indexPath {
	NSLog(@"Inside cell select");
	NSString *selectedMemoryText = [memoryArray objectAtIndex:indexPath.row];
	NSString *selectedMemoryDetails = [memoryContentExtractArray objectAtIndex:indexPath.row];	
	
	DetailedMemoryView *controller = [[DetailedMemoryView alloc] initWithNibName:@"DetailedView" bundle:nil];
    controller.selectedMemoryText=selectedMemoryText;
	controller.selectedMemoryDetails=selectedMemoryDetails;
	/*
	controller.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentModalViewController:controller animated:YES];
    */
	[self.navigationController pushViewController:controller animated:YES];
	[controller release];
}


@end
