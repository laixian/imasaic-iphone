//
//  MosaicTbCell.m
//  imasaic
//
//  Created by 张来贤 zhang on 12-5-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MosaicTbCell.h"

@implementation MosaicTbCell
@synthesize nickNameLabel, strNickName;
@synthesize timeLabel, strTime;
@synthesize faceImageView = _faceImageView, faceImage = _faceImage;
@synthesize mosaicImageView = _mosaicImageView, mosaicImage = _mosaicImage;

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setFaceRadius{
    [_faceImageView.layer setMasksToBounds:YES];
    [_faceImageView.layer setCornerRadius:4.0];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.mosaicImageView.frame = CGRectMake(40, 30, _mosaicImageView.image.size.width, _mosaicImageView.image.size.height);
}

- (void)layoutIfNeeded {
    [self setNeedsDisplay];
}


- (void)dealloc{
    [_faceImage release];
    [faceImageView release];
    [_mosaicImage release];
    [_mosaicImageView release];
}
@end
