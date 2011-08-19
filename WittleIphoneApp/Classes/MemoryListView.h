//
//  MemoryListView.h
//  WittleIphoneApp
//
//  Created by Abhishek Agarwal on 18/08/11.
//  Copyright 2011 Systech. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MemoryListView : UIViewController {
	UITableView *aTableView;
	NSMutableArray *memoryArray;
	NSMutableArray *memoryContentExtractArray;
}

@property(nonatomic,retain)UITableView *aTableView;
@property(nonatomic,retain)NSMutableArray *memoryArray;

@end
