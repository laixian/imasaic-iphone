//
//  MosaicTbCell.h
//  imasaic
//
//  Created by 张来贤 zhang on 12-5-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface MosaicTbCell : UITableViewCell{
    UIImageView *faceImageView;
}

@property(strong, nonatomic) IBOutlet UIImageView *faceImageView;
@property(strong, nonatomic) IBOutlet UIImageView *mosaicImageView;
@property(strong, nonatomic) IBOutlet UILabel *nickNameLabel;
@property(strong, nonatomic) IBOutlet UILabel *timeLabel;

@property(copy, nonatomic) NSString *strNickName;
@property(copy, nonatomic) NSString *strTime;
@property(strong, nonatomic) UIImage *faceImage;
@property(strong, nonatomic) UIImage *mosaicImage;

- (void)setFaceRadius;
@end
