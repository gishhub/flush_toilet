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
    slider.minimumValue = 0.0;
    slider.maximumValue = 1.0;
    slider.value = 0.5;

    musicStr = @"In_toilet_main";

    super.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.jpg"]];

    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playButton
{
    if (soundMain.playing)
    {
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
        NSLog(@"%@", musicStr);
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

    [soundMain setVolume:slider.value];
    [soundEnd setVolume:slider.value];
}

- (IBAction)changeMusic:(id)sender
{
    segment = sender;

    NSLog(@"%d", segment.selectedSegmentIndex);
    switch (segment.selectedSegmentIndex) {
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
