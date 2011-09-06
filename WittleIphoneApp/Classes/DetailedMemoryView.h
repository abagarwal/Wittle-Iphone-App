//
//  WittleProjectViewController.h
//  WittleProject
//
//  Created by Zoeb Sheikh on 18/08/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailedMemoryView : UIViewController <UIAlertViewDelegate> {
	IBOutlet UIButton *thumbnailButton;
	IBOutlet UIImageView *imageThumb;
	IBOutlet UIButton *shareButton;
	IBOutlet UILabel *lblMemory;
	IBOutlet UITextField *txtMemory;
	
	IBOutlet UITextField *lblMemory1;
	IBOutlet UITextView *txtMemory1;
	
	
	UIAlertView *alert;
	NSString *selectedMemoryText;	
	NSString *selectedMemoryDetails;	
	UIImageView *aImageView;
	UITableView *aTableView;
}

-(IBAction)showFullImage;

-(IBAction)sharedPopUp;

-(IBAction)backButton;

@property (nonatomic, retain) NSString *selectedMemoryText;
@property (nonatomic, retain) NSString *selectedMemoryDetails;
@property (nonatomic, retain) UIImageView *aImageView;
@property(nonatomic,retain)UITableView *aTableView;

@end
