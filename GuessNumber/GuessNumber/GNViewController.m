//
//  GNViewController.m
//  GuessNumber
//
//  Created by Ming-Zhe on 14-2-4.
//  Copyright (c) 2014年 Ming-Zhe. All rights reserved.
//

#import "GNViewController.h"

@interface GNViewController ()

@end

@implementation GNViewController{
    int currentValue;
    int targetValue;
    int score;
}

@synthesize slider;
@synthesize targetLabel;
@synthesize scoreLabel;

- (void)updateLabels{

    self.targetLabel.text = [NSString stringWithFormat:@"%d",targetValue];
    self.scoreLabel.text = [NSString stringWithFormat:@"%d",score];
}

- (void)startNewRound{

    targetValue = 1 + (arc4random()%100);
    currentValue = 50;
    self.slider.value = currentValue;
}

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

-(IBAction)showAlert{
    int difference = abs(currentValue - targetValue);
    int points = 100 - difference;
    score += points;
    
    NSString *message = [NSString stringWithFormat:@"Current Number:%d\nTarget Number:%d\nDifference:%d\nPoints:%d",currentValue,targetValue,difference,points];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Log"
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
    [alertView show];
    [self startNewRound];
    [self updateLabels];
}

-(IBAction)sliderMoved:(UISlider *)sender{
    currentValue = sender.value;
}

-(BOOL)shouldAutorotateToInterfaceOrientation:
(UIInterfaceOrientation)toInterfaceOrientation{
    return UIInterfaceOrientationIsLandscape(toInterfaceOrientation); }


@end
