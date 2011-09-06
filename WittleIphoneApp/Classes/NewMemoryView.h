//
//  NewMemoryView.h
//  WittleIphoneApp
//
//  Created by Zoeb Sheikh on 24/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
 #import <MobileCoreServices/UTCoreTypes.h>



@interface NewMemoryView : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate, UITextViewDelegate, UIActionSheetDelegate> {
	IBOutlet UIButton *btnVideoIcon;
	IBOutlet UIButton *btnCameraIcon;
	IBOutlet UIButton *btnCameraIcon2;
	IBOutlet UIButton *btnLeftImage;
	IBOutlet UIButton *btnRightImage;
	IBOutlet UIButton *btnShowImage;
	IBOutlet UIButton *btnDismissKB;
	UITableView *aTableView;
	IBOutlet UITextField *memoryTitle;
	IBOutlet UITextView *memoryContent;
	
	IBOutlet UITextField *memoryContentPlaceHolder;
	UILabel *wittleLabel;
	UIImageView *imageView;
	UIImageView *paperclipImageView;
	bool *photoPicked;
}


@property(nonatomic,retain)UITableView *aTableView;
@property(nonatomic,retain)UILabel *wittleLabel;
@property (nonatomic, retain) IBOutlet UITextField *memoryTitle;
@property (nonatomic, retain) IBOutlet UITextField *memoryContentPlaceHolder;
@property (nonatomic, retain) IBOutlet UIImageView *imageView;
@property (nonatomic, retain) IBOutlet UIImageView *paperclipImageView;
@property (nonatomic, retain) IBOutlet UIButton *btnDismissKB;

-(IBAction) getVideomedium:(id) sender;
-(IBAction) getVideo:(id) sender;
-(IBAction) getPhoto:(id) sender;
- (IBAction)dismissKeyboard: (id)sender;
-(IBAction)showFullImage;
@end
