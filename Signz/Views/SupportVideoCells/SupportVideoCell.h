//
//  SupportVideoCell.h
//  Signz
//
//  Created by Hanet on 11/21/16.
//  Copyright © 2016 PeterDoak. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <YTPlayerView.h>

@interface SupportVideoCell : UITableViewCell <YTPlayerViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *videoCaptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *videoThumbnail;

@property (weak, nonatomic) IBOutlet UIButton *playButton;

@property (weak, nonatomic) IBOutlet YTPlayerView *playerView;

- (void)setVideoId:(NSString *)videoId withCaption:(NSString *)caption;

@end
