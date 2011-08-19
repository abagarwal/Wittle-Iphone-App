//
//  WittleIphoneAppAppDelegate.h
//  WittleIphoneApp2
//
//  Created by Abhishek Agarwal on 18/08/11.
//  Copyright Systech 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WittleIphoneAppViewController;

@interface WittleIphoneAppAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    WittleIphoneAppViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet WittleIphoneAppViewController *viewController;

@end

