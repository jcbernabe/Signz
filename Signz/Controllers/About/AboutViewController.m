//
//  AboutViewController.m
//  Signz
//
//  Created by Hanet on 11/8/16.
//  Copyright © 2016 PeterDoak. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController () <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *titleHolder;

@property (weak, nonatomic) IBOutlet UIView *textViewHolder;
@property (weak, nonatomic) IBOutlet UITextView *aboutTextView;

@property (weak, nonatomic) IBOutlet UIButton *homeButton;

@end

@implementation AboutViewController

- (BOOL)shouldAutorotate
{
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupTextViewText];
    
    self.aboutTextView.delegate = self;
    self.aboutTextView.dataDetectorTypes = UIDataDetectorTypeLink;
    self.aboutTextView.userInteractionEnabled = YES;
}

- (void)setupTextViewText {
 
    self.aboutTextView.text = @"Signz is an app created for those who may be suffering from potential suicide issues either personally or on behalf of someone they care about, or just for those who want to protect themselves from it.\n\nStudents from Belfast Boys' Model School created the app. However, the app is available worldwide and we hope that we can save many lives in the process.\n\nAll funds raised from the sale of the app will go towards suicide prevention causes.\n\nThe app was delivered by PeterDoakGlobal.\n\n Like us on Facebook https://www.facebook.com/SignzSuicideAwareness";
}

#pragma mark - UIButton Selector Methods

- (IBAction)homeButtonTapped:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"DismissAboutViewController" sender:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
