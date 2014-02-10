//
//  GGViewController.m
//  GuessGame
//
//  Created by Ming-Zhe on 14-2-8.
//  Copyright (c) 2014年 Ming-Zhe. All rights reserved.
//

#import "GGViewController.h"
#import "AboutViewController.h"

@interface GGViewController ()
@end

@implementation GGViewController
{
    int currentValue;
    int targetValue;
    int score;
    int round;
}

@synthesize slider;
@synthesize targetLabel;
@synthesize scoreLabel;
@synthesize roundLabel;

-(void)startNewGame{
    score = 0;
    round = 0;
    [self startNewRound];
}

-(void)startNewRound{
    round += 1;
    targetValue = 1+(arc4random()%100);
    currentValue = 50;
    self.slider.value = currentValue;
}

-(void)updateLabels{
    self.targetLabel.text = [NSString stringWithFormat:@"%d",targetValue];
    self.scoreLabel.text = [NSString stringWithFormat:@"%d",score];
    self.roundLabel.text = [NSString stringWithFormat:@"%d",round];
}

- (void)viewDidLoad
{   
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIImage *thumbImageNormal = [UIImage imageNamed:@"SliderThumb-Normal"];
    [self.slider setThumbImage:thumbImageNormal forState:UIControlStateNormal];
    UIImage *thumbImageHighlighted = [UIImage imageNamed:@"SliderThumb- Highlighted"];
    [self.slider setThumbImage:thumbImageHighlighted forState:UIControlStateHighlighted];
    UIImage *trackLeftImage = [[UIImage imageNamed:@"SliderTrackLeft"] stretchableImageWithLeftCapWidth:14 topCapHeight:0];
    [self.slider setMinimumTrackImage:trackLeftImage forState:UIControlStateNormal];
    UIImage *trackRightImage = [[UIImage imageNamed:@"SliderTrackRight"] stretchableImageWithLeftCapWidth:14 topCapHeight:0];
    [self.slider setMaximumTrackImage:trackRightImage forState:UIControlStateNormal];
    
    [self startNewGame];
    [self updateLabels];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showAlert:(id)sender {
    
    int difference = abs(currentValue - targetValue);
    int points = 100 - difference;
    
    
    NSString *title;
    if(difference ==0){
        title = @"土豪你太NB了!";
        points += 100;
    }else if(difference <5){
        if(difference ==1){
            points +=50;
        }
        title = @"土豪太棒了,差一点!";
    }else if(difference <10){
        title = @"好吧,勉强算个土豪";
    }else{
        title = @"不是土豪少来装!";
    }
    
    NSString *message = [NSString stringWithFormat:@"你猜的结果：%d\n得分：%d",currentValue,points];
    [[[UIAlertView alloc]initWithTitle:title
                               message:message
                              delegate:self
                     cancelButtonTitle:@"OK"
                     otherButtonTitles:nil,nil]
     show];
    score += points;
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:
(NSInteger)buttonIndex{
    
    [self startNewRound];
    [self updateLabels];
}

- (IBAction)sliderMoved:(id)sender {
    //UISlider *slider = (UISlider*)sender;
    currentValue = lroundf(slider.value);
}

- (IBAction)startOver:(id)sender {
    [self startNewGame];
    [self updateLabels];
}

- (IBAction)showInfo:(id)sender {
    AboutViewController *controller = [[AboutViewController alloc]initWithNibName:@"AboutViewController" bundle:nil];
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal; [self presentViewController:controller animated:YES completion:nil];
}


@end
