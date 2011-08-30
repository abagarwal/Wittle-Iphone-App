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
	
	UILabel *memoryTitle2;
	UILabel *memoryContentExtract2;
	UIImageView *imageView2;
}

@property(nonatomic,retain)UILabel *memoryTitle;
@property(nonatomic,retain)UILabel *memoryContentExtract;
@property(nonatomic,retain)UIImageView *imageView;

@property(nonatomic,retain)UILabel *memoryTitle2;
@property(nonatomic,retain)UILabel *memoryContentExtract2;
@property(nonatomic,retain)UIImageView *imageView2;

@end
