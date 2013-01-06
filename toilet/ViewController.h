//
//  ViewController.h
//  toilet
//
//  Created by Satoshi Ebina on 12/12/15.
//  Copyright (c) 2012年 Satoshi Ebina. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController
{
    AVAudioPlayer *soundMain;
    AVAudioPlayer *soundEnd;
    UISlider *slider;
    IBOutlet UIButton *button;
}

- (IBAction)playButton;
- (IBAction)volumeSlider:(id) sender;

@end
