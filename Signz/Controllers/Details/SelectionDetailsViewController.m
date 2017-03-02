//
//  SelectionDetailsViewController.m
//  Signz
//
//  Created by Hanet on 11/8/16.
//  Copyright © 2016 PeterDoak. All rights reserved.
//

#import "SelectionDetailsViewController.h"

#import "Constants.h"

#import <KILabel.h>
#import <SRGMediaPlayer/SRGMediaPlayer.h>

#import "SupportVideoCell.h"

@interface SelectionDetailsViewController () <UITextViewDelegate, UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIView *titleHolder;

@property (weak, nonatomic) IBOutlet UIView *textViewHolder;
@property (weak, nonatomic) IBOutlet UITextView *detailTextView;
@property (weak, nonatomic) IBOutlet UILabel *detailTitleLabel;

@property (weak, nonatomic) IBOutlet UIButton *homeButton;

@property (weak, nonatomic) IBOutlet UIView *videosListHolder;
@property (weak, nonatomic) IBOutlet UITableView *videosListTable;
@property (strong, nonatomic) NSMutableArray *videoArray;
@property (strong, nonatomic) NSMutableArray *videoCellArray;

@end

@implementation SelectionDetailsViewController

- (BOOL)shouldAutorotate
{
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (NSMutableArray *)videoArray
{
    if (!_videoArray) {
        _videoArray = [[NSMutableArray alloc] init];
    }
    
    return _videoArray;
}

- (NSMutableArray *)videoCellArray
{
    if (!_videoCellArray) {
        _videoCellArray = [[NSMutableArray alloc] init];
    }
    
    return _videoCellArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.detailTextView.delegate = self;
    self.detailTextView.userInteractionEnabled = YES;
    self.detailTextView.editable = NO;
    self.detailTextView.selectable = YES;
    self.detailTextView.dataDetectorTypes = UIDataDetectorTypeLink | UIDataDetectorTypePhoneNumber;
    
    [self.videosListTable registerNib:[UINib nibWithNibName:@"SupportVideoCell" bundle:nil] forCellReuseIdentifier:@"SupportVideoCell"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self setupTextWithType:self.selectionDetailType];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self.detailTextView setContentOffset:CGPointZero animated:NO];
    [self.videosListTable setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}

- (void)setupTextWithType:(DetailType)type
{
    
    NSString *titleString = @"";
    NSString *detailText = @"";
    NSMutableAttributedString *detailAttributedText;
    
    switch (type) {
        case DetailTypeHome:
            
            break;
            
        case DetailTypeRecognizeSignsToSpot:
            titleString = @"SIGNZ TO SPOT AND ADVICE";
            
//            detailText = @"People who complete suicide usually talk about it first. They are in pain and oftentimes reach out for help because they do not know what to do and have lost hope. Always take, someone talking about suicide seriously.\n\nThe vast majority of people who are suicidal do not want to die. They are in pain, and they want to stop the pain.\n\nSuicide can be prevented.\n\nSuicide can strike anyone at any time in their lives.\n\nAsking people if they are thinking about suicide does not give them the idea for suicide. It is important to talk about suicide with people who are suicidal because you will learn more about their mindset.";
            
            detailText = @"\u2022 People who commit suicide usually talk about it first. They are in pain and oftentimes reach out for help because they do not know what do and have lost hope.\n\n\u2022 The signs are very hard to spot because there are many things that can drive the person to suicide.\n\n\u2022 Sometimes people who feel suicidal will talk about feeling a great sadness or depression.\n\n\u2022 They’re movements and speech can change usually slowing down if its depression or there movements can speed up to hide their emotions.\n\n\u2022 They may start giving their belongings, money and personal items away.\n\n\u2022 They may lose interest in hobbies and lose interest in their family and friends.\n\n\u2022 They may speak about having thoughts of suicide or wishing death.\n\n\u2022 They become secluded to themselves.\n\n\u2022 Some tend to inflict themselves by cutting or slicing their body to distract themselves from the emotional pain that they are going through.\n\n\u2022 Suicide can strike anyone at any time in his or her lives.\n\n\u2022 Asking people if they are thinking about suicide does not give them the idea for suicide. It is important to talk about suicide with people who are suicidal because you will learn more about their mindset.\n\n\u2022 ALWAYS TAKE, SOMEONE TALKING ABOUT SUICIDE SERIOUSLY.";
            
            break;
            
        case DetailTypeRecognizeContacts:
            titleString = @"CONTACTS";
            
            detailText = @"Lighthouse\n02890755070\n\nLifeline\n08088088000\n\nSamaritans Helpline\n0845799090\n\nNew Life Counselling\n02890391630\n\nContact NI\n02890744499\n\nAware Defeat Depression\n02890357820\n\nSuicide Awareness Support Group\n02890239967\n\nThe Conservation Volunteers NI\n02890645169\n\nPIPS Belfast\n02890805850\n\nTrinity Community Counseling Service\n02890200396";
            
            self.detailTextView.textAlignment = NSTextAlignmentCenter;
            
            break;
            
        case DetailTypeRecognizeSupportVides:
            titleString = @"VIDEOS TO WATCH";
            
            for (int i = 0; i<5; i++) {
                
                SupportVideoCell *supportVideoCell = [[[NSBundle mainBundle] loadNibNamed:@"SupportVideoCell" owner:self options:nil] objectAtIndex:0];
                
                switch (i) {
                    case 0:
                        [supportVideoCell setVideoId:@"GOK1tKFFIQI" withCaption:@"A video to describe exactly what depression is in facts and drawing and what chemicals in the brain’s missing or there to cause it."];
                        break;
                        
                    case 1:
                        [supportVideoCell setVideoId:@"CAMAnPRLMH8" withCaption:@"A video to show being a friend of someone suicidal and ways to deal with them and help them."];
                        break;
                        
                    case 2:
                        [supportVideoCell setVideoId:@"GJ58hvOIpp4" withCaption:@"A video of a man explaining history and the way he deal’s with his suicidal and depressive thoughts."];
                        break;
                        
                    case 3:
                        [supportVideoCell setVideoId:@"VRj5szrWb5Y" withCaption:@"Depression test to see if your depressed in yourself"];
                        break;
                        
                    case 4:
                        [supportVideoCell setVideoId:@"wwn52-d6Sc0" withCaption:@"THE IMPORTANCE AND FACTS OF MENTAL ILLNESS"];
                        break;
                        
                    case 5:
                        [supportVideoCell setVideoId:@"ChGUVLSpWh4" withCaption:@"Alan Watts talks about depression and worrying"];
                        break;
                        
                    default:
                        break;
                }
                
                [self.videoCellArray addObject:supportVideoCell];
            }
            
            self.detailTextView.hidden = YES;
            self.videosListHolder.hidden = NO;
            
            break;
            
        case DetailTypeFeelingAdvice:
            titleString = @"SIGNZ TO SPOT";
            
            detailText = @"People who complete suicide usually talk about it first. They are in pain and oftentimes reach out for help because they do not know what to do and have lost hope. Always take, someone talking about suicide seriously.\n\nThe vast majority of people who are suicidal do not want to die. They are in pain, and they want to stop the pain.\n\nSuicide can be prevented.\n\nSuicide can strike anyone at any time in their lives.\n\nAsking people if they are thinking about suicide does not give them the idea for suicide. It is important to talk about suicide with people who are suicidal because you will learn more about their mindset.";
            
            break;
            
        case DetailTypeFeelingMindfulness:
            titleString = @"MINDFULNESS";
            
            detailText = @"1. Talk about your feelings\nTalking about your feelings can help you stay in good mental health and deal with times when you feel troubled.\n\n2. Keep active\nRegular exercise can boost your self-esteem and can help you concentrate, sleep, and look and feel better. Exercise keeps the brain and your other vital organs healthy, and is also a significant benefit towards improving your mental health.\n\n3. Eat well\nYour brain needs a mix of nutrients in order to stay healthy and function well, just like the other organs in your body. A diet that’s good for your physical health is also good for your mental health.\n\n4. Drink sensibly\nWe often drink alcohol to change our mood. Some people drink to deal with fear or loneliness, but the effect is only temporary.When the drink wears off, you feel worse because of the way the alcohol has affected your brain and the rest of your body. Drinking is not a good way to manage difficult feelings.\n\n5. Keep in touch\nThere’s nothing better than catching up with someone face to face, but that’s not always possible. You can also give them a call, drop them a note, or chat to them online instead. Keep the lines of communication open: it’s good for you!\n\n6. Ask for help\nIf things are getting too much for you and you feel you can’t cope, ask for help. Your family or friends may be able to offer practical help or a listening ear.\n\n7. Take a break\nA change of scene or a change of pace is good for your mental health.\n\n8. Do something you’re good at\nWhat do you love doing? What activities can you lose yourself in? What did you love doing in the past? Enjoying yourself can help beat stress. Doing an activity you enjoy probably means you’re good at it, and achieving something boosts your self-esteem\n\n9. Accept who you are\nWe’re all different. It’s much healthier to accept that you’re unique than to wish you were more like someone else. Feeling good about yourself boosts your confidence to learn new skills, visit new places and make new friends. Good self-esteem helps you cope when life takes a difficult turn.\n\n10. Care for others\nCaring for others is often an important part of keeping up relationships with people close to you. It can even bring you closer together.";
            
            detailAttributedText = [[NSMutableAttributedString alloc] initWithString:detailText];
            
            [detailAttributedText addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"ArialMT" size:14] range:NSMakeRange(0, detailText.length)];
    
            [detailAttributedText addAttribute:NSForegroundColorAttributeName value:UIColorFromRGB(0x343434) range:NSMakeRange(0, detailText.length)];
            
            [detailAttributedText addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldMT" size:14] range:[detailText rangeOfString:@"1. Talk about your feelings"]];
            
            [detailAttributedText addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldMT" size:14] range:[detailText rangeOfString:@"2. Keep active"]];
            
            [detailAttributedText addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldMT" size:14] range:[detailText rangeOfString:@"3. Eat well"]];
            
            [detailAttributedText addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldMT" size:14] range:[detailText rangeOfString:@"4. Drink sensibly"]];
            
            [detailAttributedText addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldMT" size:14] range:[detailText rangeOfString:@"5. Keep in touch"]];
            
            [detailAttributedText addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldMT" size:14] range:[detailText rangeOfString:@"6. Ask for help"]];
            
            [detailAttributedText addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldMT" size:14] range:[detailText rangeOfString:@"7. Take a break"]];
            
            [detailAttributedText addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldMT" size:14] range:[detailText rangeOfString:@"8. Do something you’re good at"]];
            
            [detailAttributedText addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldMT" size:14] range:[detailText rangeOfString:@"9. Accept who you are"]];
            
            [detailAttributedText addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldMT" size:14] range:[detailText rangeOfString:@"10. Care for others"]];
            
            break;
            
        case DetailTypeFeelingPlaylist:
            titleString = @"PLAYLIST";
            
            detailText = @"CHEAT CODES – LET ME HOLD YOU\n\nTHE HIM – FEELS LIKE HOME\n\nBAKER MAT – LIVING\n\nMAJOR LAZER – COLD WATER ( KELLY REMIX )\n\nKYGO – STAY ( RASPO REMIX )\n\nJAMES ARTHUR – SAY YOU WONT LET GO ( RASPO REMIX )\n\nCALVIN HARRIS – MY WAY\n\nBEN HOWARD – I FORGET WHERE WE WERE ( BOHEM REMIX )\n\nRIHANNA FT DRAKE – WORK ( WELSHY BOOTLEG )\n\nSHE WILL BE LOVED ( MATT DIMANA REMIX )\n\nFINAL SONG – ( WELSHY BOOTLEG )\n\nDON’T BE SHY\n\nJOE WELLER – WHAT YOU WANNA DO\n\nADAM LAMBERT – CHEST TOWN HOUSE";
            
            detailAttributedText = [[NSMutableAttributedString alloc] initWithString:detailText];
            
            [detailAttributedText addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"ArialMT" size:14] range:NSMakeRange(0, detailText.length)];
            
            [detailAttributedText addAttribute:NSForegroundColorAttributeName value:UIColorFromRGB(0x343434) range:NSMakeRange(0, detailText.length)];
            
            [detailAttributedText addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14] range:[detailText rangeOfString:@"LET ME HOLD YOU"]];
            
            [detailAttributedText addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14] range:[detailText rangeOfString:@"FEELS LIKE HOME"]];
            
            [detailAttributedText addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14] range:[detailText rangeOfString:@"LIVING"]];
            
            [detailAttributedText addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14] range:[detailText rangeOfString:@"COLD WATER ( KELLY REMIX )"]];
            
            [detailAttributedText addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14] range:[detailText rangeOfString:@"STAY ( RASPO REMIX )"]];
            
            [detailAttributedText addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14] range:[detailText rangeOfString:@"SAY YOU WONT LET GO ( RASPO REMIX )"]];
            
            [detailAttributedText addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14] range:[detailText rangeOfString:@"MY WAY"]];
            
            [detailAttributedText addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14] range:[detailText rangeOfString:@"I FORGET WHERE WE WERE ( BOHEM REMIX )"]];
            
            [detailAttributedText addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14] range:[detailText rangeOfString:@"WORK ( WELSHY BOOTLEG )"]];
            
            [detailAttributedText addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14] range:[detailText rangeOfString:@"SHE WILL BE LOVED"]];
            
            [detailAttributedText addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14] range:[detailText rangeOfString:@"FINAL SONG"]];
            
            [detailAttributedText addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14] range:[detailText rangeOfString:@"DON’T BE SHY"]];
            
            [detailAttributedText addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14] range:[detailText rangeOfString:@"WHAT YOU WANNA DO"]];
            
            [detailAttributedText addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14] range:[detailText rangeOfString:@"CHEST TOWN HOUSE"]];
            
            break;
            
        case DetailTypeFeelingSupportVideos:
            titleString = @"VIDEOS TO WATCH";
            
            for (int i = 0; i<5; i++) {
                
                SupportVideoCell *supportVideoCell = [[[NSBundle mainBundle] loadNibNamed:@"SupportVideoCell" owner:self options:nil] objectAtIndex:0];
                
                switch (i) {
                    case 0:
                        [supportVideoCell setVideoId:@"GOK1tKFFIQI" withCaption:@"A video to describe exactly what depression is in facts and drawing and what chemicals in the brain’s missing or there to cause it."];
                        break;
                        
                    case 1:
                        [supportVideoCell setVideoId:@"CAMAnPRLMH8" withCaption:@"A video to show being a friend of someone suicidal and ways to deal with them and help them."];
                        break;
                        
                    case 2:
                        [supportVideoCell setVideoId:@"GJ58hvOIpp4" withCaption:@"A video of a man explaining history and the way he deal’s with his suicidal and depressive thoughts."];
                        break;
                        
                    case 3:
                        [supportVideoCell setVideoId:@"VRj5szrWb5Y" withCaption:@"Depression test to see if your depressed in yourself"];
                        break;
                        
                    case 4:
                        [supportVideoCell setVideoId:@"wwn52-d6Sc0" withCaption:@"THE IMPORTANCE AND FACTS OF MENTAL ILLNESS"];
                        break;
                        
                    case 5:
                        [supportVideoCell setVideoId:@"ChGUVLSpWh4" withCaption:@"Alan Watts talks about depression and worrying"];
                        break;
                        
                    default:
                        break;
                }
                
                [self.videoCellArray addObject:supportVideoCell];
            }
            
            self.detailTextView.hidden = YES;
            self.videosListHolder.hidden = NO;
            
            break;
            
        case DetailTypeFeelingContacts:
            titleString = @"CONTACTS";
            
            detailText = @"Lighthouse\n02890755070\n\nLifeline\n08088088000\n\nSamaritans Helpline\n0845799090\n\nNew Life Counselling\n02890391630\n\nContact NI\n02890744499\n\nAware Defeat Depression\n02890357820\n\nSuicide Awareness Support Group\n02890239967\n\nThe Conservation Volunteers NI\n02890645169\n\nPIPS Belfast\n02890805850\n\nTrinity Community Counseling Service\n02890200396";
            
            self.detailTextView.textAlignment = NSTextAlignmentCenter;
            
            break;
            
        case DetailTypeFeelingQuotes:
        {
            titleString = @"POSITIVE QUOTES";
            
            detailText = @"1. “Every new day is a chance to change your life”\n\n2. “BE STRONG because things will get better. It may be stormy now, but it never rains forever”\n\n3. “Be crazy. Be stupid. Be weird. Be whatever because life is too short to be anything but happy”\n\n4. “Worrying does not empty tomorrow of its troubles. It empties today of its strength”\n\n5. “Be positive, stay happy, and don’t let the negativity ordrama of the world get you down. Smile ”\n\n6. “Positive thoughts generate positive feelings and attract positive life experiences”\n\n7. “Smile, every one you meet is carrying a heavy load”\n\n8. “A negative thinker sees a difficulty in every opportunity. A positive thinker sees an opportunity in every difficulty”\n\n9. “Once you replace negative thoughts with positive ones,you’ll start having positive results.”\n\n10. “Look for something positive in each day even when you have to look a little harder. Let the challenge make you stronger”.";
            
            detailAttributedText = [[NSMutableAttributedString alloc] initWithString:detailText];
            
            [detailAttributedText addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"ArialMT" size:14] range:NSMakeRange(0, detailText.length)];
            
            [detailAttributedText addAttribute:NSForegroundColorAttributeName value:UIColorFromRGB(0x343434) range:NSMakeRange(0, detailText.length)];
            
            [detailAttributedText addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14] range:[detailText rangeOfString:@"1."]];
            
            [detailAttributedText addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14] range:[detailText rangeOfString:@"2."]];
            
            [detailAttributedText addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14] range:[detailText rangeOfString:@"3."]];
            
            [detailAttributedText addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14] range:[detailText rangeOfString:@"4."]];
            
            [detailAttributedText addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14] range:[detailText rangeOfString:@"5."]];
            
            [detailAttributedText addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14] range:[detailText rangeOfString:@"6."]];
            
            [detailAttributedText addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14] range:[detailText rangeOfString:@"7."]];
            
            [detailAttributedText addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14] range:[detailText rangeOfString:@"8."]];
            
            [detailAttributedText addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14] range:[detailText rangeOfString:@"9."]];
            
            [detailAttributedText addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldItalicMT" size:14] range:[detailText rangeOfString:@"10."]];
            
            NSTextAttachment *toBeHealthyAttachment = [[NSTextAttachment alloc] init];
            toBeHealthyAttachment.image = [UIImage imageNamed:@"tobehealthy.png"];
            
            NSTextAttachment *youCantAppreciateAttachment = [[NSTextAttachment alloc] init];
            youCantAppreciateAttachment.image = [UIImage imageNamed:@"youcantappreciate.png"];
            
            NSTextAttachment *alwaysRememberAttachment = [[NSTextAttachment alloc] init];
            alwaysRememberAttachment.image = [UIImage imageNamed:@"alwaysremember.png"];
            
            [detailAttributedText appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n\n"]];
            [detailAttributedText appendAttributedString:[NSAttributedString attributedStringWithAttachment:toBeHealthyAttachment]];
            [detailAttributedText appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n\n"]];
            [detailAttributedText appendAttributedString:[NSAttributedString attributedStringWithAttachment:youCantAppreciateAttachment]];
            [detailAttributedText appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n\n"]];
            [detailAttributedText appendAttributedString:[NSAttributedString attributedStringWithAttachment:alwaysRememberAttachment]];
        }
            break;
            
        default:
            break;
    }
    
    self.detailTitleLabel.font = [UIFont fontWithName:@"BebasNeueBold" size:31];
    self.detailTitleLabel.textColor = UIColorFromRGB(0x343434);
    self.detailTitleLabel.textAlignment = NSTextAlignmentCenter;
    self.detailTitleLabel.text = titleString;
    
    if (detailAttributedText == nil) {
        self.detailTextView.text = detailText;
    } else {
        self.detailTextView.attributedText = detailAttributedText;
    }
}

#pragma mark - UITextView Delegate Methods

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction
{
    return YES;
}

#pragma mark - UITableViewDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SupportVideoCell *cell = [self.videoCellArray objectAtIndex:indexPath.row];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.videoCellArray.count;
}

#pragma mark - UIButton Selector Methods

- (IBAction)homeButtonTapped:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"DismissSelectionDetailsController" sender:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}


@end
