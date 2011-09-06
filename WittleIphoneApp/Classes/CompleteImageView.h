//
//  CompleteImageView.h
//  WittleIphoneApp
//
//  Created by Zoeb Sheikh on 22/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CompleteImageView : UIViewController {
IBOutlet UIImageView *imageFullView;
}
//-(IBAction)backButton;
@property(nonatomic,retain)UIImageView *imageFullView;

@end
