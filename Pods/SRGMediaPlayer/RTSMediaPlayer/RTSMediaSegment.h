//
//  Copyright (c) SRG. All rights reserved.
//
//  License information is available from the LICENSE file.
//

#import <CoreMedia/CoreMedia.h>
#import <Foundation/Foundation.h>

/**
 *  Protocol formally describing a media segment. A class describing a segment must conform to this protocol and implement
 *  the required methods appropriately. A segment class will in general contain more information (e.g. segment title, thumbnail
 *  URL, etc.), but is not required to
 */
@protocol RTSMediaSegment <NSObject>

/**
 *  Media Segment Identifier
 */
@property (nonatomic, readonly, copy) NSString *segmentIdentifier;

/**
 *  Segment start and end times (might be identical)
 */
@property (nonatomic, readonly) CMTimeRange timeRange;

/**
 *  Must return YES iff the segment is blocked (i.e. cannot be played)
 */
@property (nonatomic, readonly, getter=isBlocked) BOOL blocked;

/**
 *  Must return YES iff the segment is visible
 */
@property (nonatomic, readonly, getter=isVisible) BOOL visible;

/**
 * Whether the segment is a logical segment (part of a larger media) or a physical segment (a media of its own)
 */
@property (nonatomic, readonly, getter=isLogical) BOOL logical;

@end
