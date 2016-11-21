//
//  SupportVideoCell.m
//  Signz
//
//  Created by Hanet on 11/21/16.
//  Copyright © 2016 PeterDoak. All rights reserved.
//

#import "SupportVideoCell.h"

@implementation SupportVideoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.videoCaptionLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:13];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setCaption:(NSString *)title thumbnailImage:(UIImage *)image
{
    self.videoCaptionLabel.text = title;
    self.videoThumbnail.image = image;
}

@end
