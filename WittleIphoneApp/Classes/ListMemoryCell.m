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

@synthesize memoryTitle2,memoryContentExtract2;
@synthesize imageView2;

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
		
		imageView.tag =1;
		memoryTitle.tag=2;
		memoryContentExtract.tag =3;
		//imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mail-attachment.png"]];
		//cell.accessoryView = imageView;
		
		[self.contentView addSubview:imageView];
		
		[imageView release];	
		
		
		
		
		
		memoryTitle2 = [[UILabel alloc]init];
		memoryTitle2.textAlignment = UITextAlignmentLeft;
		memoryTitle2.font = [UIFont systemFontOfSize:14];
		memoryContentExtract2 = [[UILabel alloc]init];
		memoryContentExtract2.textAlignment = UITextAlignmentLeft;
		memoryContentExtract2.font = [UIFont systemFontOfSize:8];
		[self.contentView addSubview:memoryTitle2];
		[self.contentView addSubview:memoryContentExtract2];
		
		//imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mail-attachment.png"]];
		//cell.accessoryView = imageView;
		
		[self.contentView addSubview:imageView2];
		
		[imageView2 release];
		
		
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
	//imageView.tag =1;
	
	frame= CGRectMake(boundsX+30 ,5, 200, 25);
	memoryTitle.frame = frame;
	//memoryTitle.tag =2;
	
	frame= CGRectMake(boundsX+30 ,25, 100, 15);
	memoryContentExtract.frame = frame;
	//memoryContentExtract.tag =3;
	
	
	frame= CGRectMake(boundsX+40 ,10, 30, 30);
	imageView2.frame = frame;
	//imageView.tag =1;
	
	frame= CGRectMake(boundsX+30+40 ,5, 200, 25);
	memoryTitle2.frame = frame;
	//memoryTitle.tag =2;
	
	frame= CGRectMake(boundsX+30+40,25, 100, 15);
	memoryContentExtract2.frame = frame;
	//memoryContentExtract.tag =3;
	
	
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
