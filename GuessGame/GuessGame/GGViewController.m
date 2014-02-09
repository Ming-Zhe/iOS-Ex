//
//  GGViewController.m
//  GuessGame
//
//  Created by Ming-Zhe on 14-2-8.
//  Copyright (c) 2014年 Ming-Zhe. All rights reserved.
//

#import "GGViewController.h"

@interface GGViewController ()
@end

@implementation GGViewController{
    
    int currentValue;
    int targetValue;
}


@synthesize slider;
@synthesize targetLabel;

-(void)startNewRound{
    targetValue = 1+(arc4random()%100);
    currentValue = 50;
    self.slider.value = currentValue;
}

-(void)updateLabels{
    self.targetLabel.text = [NSString stringWithFormat:@"%d",targetValue]; }

- (void)viewDidLoad
{   
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self startNewRound];
    [self updateLabels];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showAlert:(id)sender {
    NSString *message = [NSString stringWithFormat:@"Current Value:%d",currentValue];
    [[[UIAlertView alloc]initWithTitle:@"Hello World"
                               message:message
                              delegate:nil
                     cancelButtonTitle:@"OK"
                     otherButtonTitles:nil,nil]
     show];
    [self startNewRound];
    [self updateLabels];
}

- (IBAction)sliderMoved:(id)sender {
    //UISlider *slider = (UISlider*)sender;
    currentValue = (int)lroundf(slider.value);
}


@end
