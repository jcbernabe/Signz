//
//  Copyright (c) SRG. All rights reserved.
//
//  License information is available from the LICENSE file.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

// Forward declarations
@class RTSAirplayOverlayView;

/**
 *  Airplay view data source protocol, providing optional customization mechanism to `RTSAirplayOverlayView`
 */
@protocol RTSAirplayOverlayViewDataSource <NSObject>
@optional

/**
 *  Attributes for the 'Airplay' title. If not implemented, a default style will be applied (bold system font, white,
 *  centered, 14 pts)
 */
- (NSDictionary *)airplayOverlayViewTitleAttributedDictionary:(RTSAirplayOverlayView *)airplayOverlayView;

/**
 *  Lets you customize how the subtitle displaying the route name is displayed. If not implemented, a default message
 *  will be used
 */
- (NSString *)airplayOverlayView:(RTSAirplayOverlayView *)airplayOverlayView subtitleForAirplayRouteName:(NSString *)routeName;

/**
 *  Attributes for the route subtitle. If not implemented, a default style will be applied (system font, light gray,
 *  centered, 12 pts)
 */
- (NSDictionary *)airplayOverlayViewSubitleAttributedDictionary:(RTSAirplayOverlayView *)airplayOverlayView;

@end

/**
 *  View automatically displaying whether Airplay playback is being made. Simply install somewhere onto your custom player
 *  interface, the view will automatically appear when Airplay playback begins and disappear when it ends
 */
@interface RTSAirplayOverlayView : UIView

/**
 *  An optional data source for customization
 */
@property (nonatomic, weak) IBOutlet id<RTSAirplayOverlayViewDataSource> dataSource;

@end
