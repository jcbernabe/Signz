//
//  SelectionDetailsViewController.h
//  Signz
//
//  Created by Hanet on 11/8/16.
//  Copyright © 2016 PeterDoak. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    DetailTypeHome,
    DetailTypeRecognizeSignsToSpot,
    DetailTypeRecognizeAdvice,
    DetailTypeRecognizeContacts,
    DetailTypeRecognizeSupportVides,
    DetailTypeFeelingAdvice,
    DetailTypeFeelingMindfulness,
    DetailTypeFeelingPlaylist,
    DetailTypeFeelingSupportVideos,
    DetailTypeFeelingContacts,
    DetailTypeFeelingQuotes,
} DetailType;

@interface SelectionDetailsViewController : UIViewController

@property (nonatomic) DetailType selectionDetailType;

@end
