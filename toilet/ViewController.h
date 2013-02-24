//
//  ViewController.h
//  toilet
//
//  Created by Satoshi Ebina on 12/12/15.
//  Copyright (c) 2012年 Satoshi Ebina. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <iAd/iAd.h>

@interface ViewController : UIViewController
{
    AVAudioPlayer *soundMain;
    AVAudioPlayer *soundEnd;
    UISegmentedControl *segment;
    NSString *musicStr;

    IBOutlet UISlider *slider;
    IBOutlet UIButton *button;
    IBOutlet ADBannerView *adBanner;
}

- (IBAction)playButton;
- (IBAction)volumeSlider:(id)sender;
- (IBAction)changeMusicSegment:(id)sender;

@end
