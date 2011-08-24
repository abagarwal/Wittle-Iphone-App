//
//  WittleIphoneAppViewController.h
//  WittleIphoneApp
//
//  Created by Abhishek Agarwal on 18/08/11.
//  Copyright Systech 2011. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MemoryListView.h"

@interface WittleIphoneAppViewController : UIViewController<UITextFieldDelegate> {
	
	UITableView *aTableView;
	UIView *aRootView;
	NSMutableArray *memoryArray;
	NSMutableArray *memoryContentExtractArray;
	IBOutlet UITextField *usernameField;
	IBOutlet UITextField *passwordField;
	IBOutlet UIButton *loginButton;
	IBOutlet UIActivityIndicatorView *loginIndicator;
	
	UILabel *aLabel;
	UIButton *aButton;
	UIButton *logoutButton;
	UIView *mainView;
	MemoryListView *nextView;
}


@property (nonatomic, retain) UITextField *usernameField;
@property (nonatomic, retain) UITextField *passwordField;
@property (nonatomic, retain) UIButton *loginButton;
@property (nonatomic, retain) UIActivityIndicatorView *loginIndicator;

@property (nonatomic, retain) UILabel *aLabel;
@property (nonatomic, retain) UIButton *aButton;
@property (nonatomic, retain) UIButton *logoutButton;

@property (nonatomic, retain) UIView *mainView;

@property(nonatomic,retain)UITableView *aTableView;
@property(nonatomic,retain)UIView *aRootView;
@property(nonatomic,retain)NSMutableArray *memoryArray;

- (IBAction) login;

@end

