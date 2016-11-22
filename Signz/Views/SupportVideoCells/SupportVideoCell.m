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
    
//    self.playerView.delegate = self;
    self.playButton.hidden = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setVideoId:(NSString *)videoId withCaption:(NSString *)caption
{
    [self.playerView loadWithVideoId:videoId];
    
    self.videoCaptionLabel.text = caption;
}

- (IBAction)playVideo:(UIButton *)sender
{
    [self.playerView playVideo];
    sender.hidden = YES;
}

#pragma mark - YTPlayerView Delegates

- (void)playerView:(YTPlayerView *)playerView didChangeToState:(YTPlayerState)state
{
//    if (state == kYTPlayerStateEnded) {
//        self.playButton.hidden = NO;
//    }
}

@end
