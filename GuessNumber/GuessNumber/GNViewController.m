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
    int round;
}

@synthesize slider;
@synthesize targetLabel;
@synthesize scoreLabel;
@synthesize roundLabel;

- (void)updateLabels{
    
    self.targetLabel.text = [NSString stringWithFormat:@"%d",targetValue];
    self.scoreLabel.text = [NSString stringWithFormat:@"%d",score];
    self.roundLabel.text = [NSString stringWithFormat:@"%d",round];
}

- (void)startNewRound{

    round += 1;
    
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
    
    NSString *title;
    if(difference == 0){
        title = @"完美表现!";
        points += 100;
    }
    else if(difference <5){
        title = @"太棒了!差一点就到了!";
        if (difference == 1) {
            points += 50;
        }
    }
    else if(difference <10){
        title = @"不错!";
    }
    else{
        title = @"差太远了吧!";
    }
    
    NSString *message = [NSString stringWithFormat:@"本轮得分：%d",points];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
    [alertView show];
}

-(IBAction)sliderMoved:(UISlider *)sender{
    currentValue = sender.value;
}

-(void)alertView: (UIAlertView *)alertView didDismissWithButtonIndex: (NSInteger) buttonIndex{
    
    [self startNewRound];
    [self updateLabels];
}

-(BOOL)shouldAutorotateToInterfaceOrientation:
(UIInterfaceOrientation)toInterfaceOrientation{
    return UIInterfaceOrientationIsLandscape(toInterfaceOrientation); }

@end
