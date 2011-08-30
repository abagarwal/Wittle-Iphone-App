//
//  MemoryListView.h
//  WittleIphoneApp
//
//  Created by Abhishek Agarwal on 18/08/11.
//  Copyright 2011 Systech. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kCellImageViewTag		1000
#define kCellLabelTag			1001

#define kLabelIndentedRect	CGRectMake(40.0, 12.0, 275.0, 20.0)
#define kLabelRect			CGRectMake(15.0, 12.0, 275.0, 20.0)

@interface MemoryListView : UIViewController {
	UITableView *aTableView;
	NSMutableArray *memoryArray;
	NSMutableArray *memoryContentExtractArray;	
	UIToolbar *aToolBar;
	
	NSMutableArray *selectedArray;
	BOOL inPseudoEditMode;
	
	UIImage *selectedImage;
	UIImage *unselectedImage;	
	UIBarButtonItem	*deleteButton;
	UIBarButtonItem *editButton;
}

@property(nonatomic,retain)UITableView *aTableView;
@property(nonatomic,retain)NSMutableArray *memoryArray;
@property(nonatomic,retain)UIToolbar *aToolBar;

@property (nonatomic, retain) NSMutableArray *countries;
@property (nonatomic, retain) NSMutableArray *selectedArray;

@property (nonatomic, retain) UIImage *selectedImage;
@property (nonatomic, retain) UIImage *unselectedImage;

@property (nonatomic, retain) IBOutlet UIBarButtonItem *deleteButton;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *editButton;
@property BOOL inPseudoEditMode;
- (IBAction)togglePseudoEditMode;
- (IBAction)doDelete;
- (void)populateSelectedArray;

@end
