//
//  ListMemoryCell.h
//  WittleIphoneApp
//
//  Created by Abhishek Agarwal on 19/08/11.
//  Copyright 2011 Systech. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ListMemoryCell : UITableViewCell {
	UILabel *memoryTitle;
	UILabel *memoryContentExtract;
	UIImageView *imageView;
}

@property(nonatomic,retain)UILabel *memoryTitle;
@property(nonatomic,retain)UILabel *memoryContentExtract;
@property(nonatomic,retain)UIImageView *imageView;

@end
