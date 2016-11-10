//
//  ButtonTypeCell.h
//  Signz
//
//  Created by Hanet on 11/8/16.
//  Copyright © 2016 PeterDoak. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ButtonTypeCellProtocol.h"

@interface ButtonTypeCell : UITableViewCell <ButtonTypeCellProtocol>

@property (weak, nonatomic) IBOutlet UIButton *buttonObject;

@end
