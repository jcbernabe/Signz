//
//  ButtonTypeCell.m
//  Signz
//
//  Created by Hanet on 11/8/16.
//  Copyright © 2016 PeterDoak. All rights reserved.
//

#import "ButtonTypeCell.h"

#import "Constants.h"

@implementation ButtonTypeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.buttonObject.userInteractionEnabled = NO;
    
    self.buttonObject.layer.cornerRadius = 25;
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    
    [self.buttonObject setAttributedTitle:[[NSAttributedString alloc] initWithString:@""] forState:UIControlStateNormal];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setButtonTypeCellTitle:(NSString *)title
{
//    BebasNeueBook
//    BebasNeueLight
//    BebasNeueBold
//    BebasNeue-Thin
//    BebasNeueRegular
//    ArialMT
//    Arial-BoldItalicMT
//    Arial-BoldMT
//    Arial-ItalicMT
    
//    NSArray *familyNames = [UIFont familyNames];
//    [familyNames enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop){
//        NSLog(@"* %@",obj);
//        NSArray *fontNames = [UIFont fontNamesForFamilyName:obj];
//        [fontNames enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop){
//            NSLog(@"--- %@",obj);
//        }];
//    }];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:title];
    
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"BebasNeueBold" size:31] range:NSMakeRange(0, title.length)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:UIColorFromRGB(0x343434) range:NSMakeRange(0, title.length)];
    
    [self.buttonObject setAttributedTitle:attributedString forState:UIControlStateNormal];
    
//    [self.buttonObject.titleLabel setFont:[UIFont fontWithName:@"BebasNeueBold" size:31]];
//    [self.buttonObject.titleLabel setTextAlignment:NSTextAlignmentCenter];
//    [self.buttonObject setTitleColor:UIColorFromRGB(0x343434) forState:UIControlStateNormal];
//    [self.buttonObject setTitle:title forState:UIControlStateNormal];
}

#pragma mark - UIButton Selector Methods

- (IBAction)buttonObjectTapped:(UIButton *)sender {
    
    
}

@end
