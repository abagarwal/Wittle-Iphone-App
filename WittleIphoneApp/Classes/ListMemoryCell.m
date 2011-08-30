//
//  ListMemoryCell.m
//  WittleIphoneApp
//
//  Created by Abhishek Agarwal on 19/08/11.
//  Copyright 2011 Systech. All rights reserved.
//

#import "ListMemoryCell.h"


@implementation ListMemoryCell

@synthesize memoryTitle,memoryContentExtract;
@synthesize imageView;

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier {
	if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) {
		
		// Initialization code
		memoryTitle = [[UILabel alloc]init];
		memoryTitle.textAlignment = UITextAlignmentLeft;
		memoryTitle.font = [UIFont systemFontOfSize:14];
		memoryContentExtract = [[UILabel alloc]init];
		memoryContentExtract.textAlignment = UITextAlignmentLeft;
		memoryContentExtract.font = [UIFont systemFontOfSize:8];
		[self.contentView addSubview:memoryTitle];
		[self.contentView addSubview:memoryContentExtract];
		
		//imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mail-attachment.png"]];
		//cell.accessoryView = imageView;
		
		[self.contentView addSubview:imageView];
		
		[imageView release];		
	}
	return self;
}

- (void)layoutSubviews {
	[super layoutSubviews];
	CGRect contentRect = self.contentView.bounds;
	CGFloat boundsX = contentRect.origin.x;
	CGRect frame;
	
	frame= CGRectMake(boundsX ,10, 30, 30);
	imageView.frame = frame;
	
	frame= CGRectMake(boundsX+30 ,5, 200, 25);
	memoryTitle.frame = frame;
	
	frame= CGRectMake(boundsX+30 ,25, 100, 15);
	memoryContentExtract.frame = frame;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // Initialization code
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)dealloc {
    [super dealloc];
}


@end
