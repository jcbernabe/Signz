//
//  FeelingDepressedViewController.m
//  Signz
//
//  Created by Hanet on 11/8/16.
//  Copyright © 2016 PeterDoak. All rights reserved.
//

#import "FeelingDepressedViewController.h"

#import "ButtonTypeCell.h"

#import "SelectionDetailsViewController.h"

@interface FeelingDepressedViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIView *titleHolder;

@property (weak, nonatomic) IBOutlet UITableView *buttonListTable;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic) NSArray *buttonTitleArray;

@property (strong, nonatomic) NSIndexPath *selectedIdxPath;

@end

@implementation FeelingDepressedViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.buttonTitleArray = @[@"Advice",
                              @"Mindfulness",
                              @"Playlist",
                              @"Support Videos",
                              @"Contacts",
                              @"Quotes",
                              @"Home"];
    
}

#pragma mark - UITableView Delegate Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.buttonTitleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ButtonTypeCell"];
    
    ButtonTypeCell *buttonTypeCell = (ButtonTypeCell*) cell;
    [buttonTypeCell setButtonTypeCellTitle:[self.buttonTitleArray objectAtIndex:indexPath.row]];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

#pragma mark - UITableView DataSource Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self hideObjects:YES];
    
    self.selectedIdxPath = indexPath;
    
    if (indexPath.row == self.buttonTitleArray.count-1) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self performSegueWithIdentifier:@"DismissFeelingDepressedViewController" sender:self];
        });
        
        return;
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self performSegueWithIdentifier:@"ShowSelectionDetailsViewController" sender:self];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Object Controls

- (void)hideObjects:(BOOL)hide
{
    self.buttonListTable.hidden = hide;
    self.titleLabel.hidden = hide;
}

#pragma mark - Navigation

- (IBAction)backToList:(UIStoryboardSegue *)sender {
    
    [self hideObjects:NO];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([segue.identifier isEqualToString:@"ShowSelectionDetailsViewController"]) {
        SelectionDetailsViewController *detailsViewController = [segue destinationViewController];
        DetailType type;
        
        switch (self.selectedIdxPath.row) {
            case 0:
                type = DetailTypeFeelingAdvice;
                break;
                
            case 1:
                type = DetailTypeFeelingMindfulness;
                break;
                
            case 2:
                type = DetailTypeFeelingPlaylist;
                break;
                
            case 3:
                type = DetailTypeFeelingSupportVideos;
                break;
                
            case 4:
                type = DetailTypeFeelingContacts;
                break;
                
            case 5:
                type = DetailTypeFeelingQuotes;
                break;
                
            case 6:
                type = DetailTypeHome;
                break;
                
            default:
                break;
        }
        
        [detailsViewController setSelectionDetailType:type];
    }
}

@end
