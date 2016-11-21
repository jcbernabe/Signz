//
//  SupportVideoCell.h
//  Signz
//
//  Created by Hanet on 11/21/16.
//  Copyright © 2016 PeterDoak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SupportVideoCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *videoCaptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *videoThumbnail;

- (void)setCaption:(NSString *)title thumbnailImage:(UIImage *)image;

@end
