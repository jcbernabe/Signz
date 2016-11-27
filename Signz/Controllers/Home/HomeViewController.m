//
//  HomeViewController.m
//  Signz
//
//  Created by Hanet on 11/8/16.
//  Copyright © 2016 PeterDoak. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@property (weak, nonatomic) IBOutlet UIView *titleHolder;

@property (weak, nonatomic) IBOutlet UIButton *recognizeSignzButton;
@property (weak, nonatomic) IBOutlet UILabel *recognizeSignzTitle;
@property (weak, nonatomic) IBOutlet UIButton *feelingDepressedButton;
@property (weak, nonatomic) IBOutlet UILabel *feelingDepressedTitle;
@property (weak, nonatomic) IBOutlet UIButton *aboutButton;
@property (weak, nonatomic) IBOutlet UILabel *aboutTitle;

@property (weak, nonatomic) IBOutlet UIImageView *boysHomeLogo;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - UIButton Selector Methods

- (IBAction)recognizeButtonTapped:(UIButton *)sender {
    
    [self hideObjects:YES];
    
    [self performSegueWithIdentifier:@"ShowRecognizingSignzViewController" sender:self];
}

- (IBAction)feelingDepressedTapped:(UIButton *)sender {
    
    [self hideObjects:YES];
    
    [self performSegueWithIdentifier:@"ShowFeelingDepressedViewController" sender:self];
}

- (IBAction)aboutTapped:(UIButton *)sender {
    
    [self hideObjects:YES];
    
    [self performSegueWithIdentifier:@"ShowAboutViewController" sender:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Object Controls

- (void)hideObjects:(BOOL)hide
{
    self.recognizeSignzButton.hidden = hide;
    self.recognizeSignzTitle.hidden = hide;
    
    self.feelingDepressedButton.hidden = hide;
    self.feelingDepressedTitle.hidden = hide;
    
    self.aboutButton.hidden = hide;
    self.aboutTitle.hidden = hide;
    
    self.boysHomeLogo.hidden = hide;
}

#pragma mark - Navigation

- (IBAction)backToHomeController:(UIStoryboardSegue *)sender {

    [self hideObjects:NO];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

}


@end
