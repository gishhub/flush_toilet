//
//  ViewController.m
//  toilet
//
//  Created by Satoshi Ebina on 12/12/15.
//  Copyright (c) 2012年 Satoshi Ebina. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    // Initialize slider values.
    slider.minimumValue = 0.0;
    slider.maximumValue = 1.0;
    slider.value = 0.5;

    // Default music is flush toilet.
    musicStr = @"In_toilet_main";

    // Changing the back ground image.
    super.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.jpg"]];

    // ADView is hidden until it reads AD.
    adBanner.delegate = self;
    adBanner.hidden = YES;

    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    // ADView is displayed if reading AD is completed.
    adBanner.hidden = NO;
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
}

- (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave
{
    return YES;
}

- (void)bannerViewActionDidFinish:(ADBannerView *)banner
{
}

- (IBAction)playButton
{
    if (soundMain.playing)
    {
        // If "flush toilet" is selected, play the end music.
        if ([musicStr isEqualToString:@"In_toilet_main"])
        {
            NSString *bgmPath = [[NSBundle mainBundle] pathForResource:@"In_toilet_end" ofType:@"m4a"];
            NSURL *bgmUrl = [NSURL fileURLWithPath:bgmPath];
            
            soundEnd = [[AVAudioPlayer alloc] initWithContentsOfURL:bgmUrl error:nil];
            [soundEnd setNumberOfLoops:0];
            [soundEnd play];
        }

        [soundMain stop];
        [button setTitle:@"▷" forState:UIControlStateNormal];
    }
    else
    {
        NSString *bgmPath = [[NSBundle mainBundle] pathForResource:musicStr ofType:@"m4a"];
        NSURL *bgmUrl = [NSURL fileURLWithPath:bgmPath];
        
        soundMain = [[AVAudioPlayer alloc] initWithContentsOfURL:bgmUrl error:nil];
        [soundMain setNumberOfLoops:-1];
        [soundMain play];
        [button setTitle:@"□" forState:UIControlStateNormal];
    }
}

- (IBAction)volumeSlider:(id)sender
{
    slider = sender;

    // Set the slider value to sound volume.
    [soundMain setVolume:slider.value];
    [soundEnd setVolume:slider.value];
}

- (IBAction)changeMusicSegment:(id)sender
{
    segment = sender;

    // Case 0 : set the flush toilet music.
    // Case 1 : set the gas music.
    switch (segment.selectedSegmentIndex)
    {
        case 0:
            musicStr = @"In_toilet_main";
            break;

        case 1:
            musicStr = @"nc51153";
            break;

        default:
            break;
    }
}

@end
