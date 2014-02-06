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
}

@synthesize slider;



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    currentValue = self.slider.value;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)showAlert{
    NSString *message = [NSString stringWithFormat:@"Current Number:%d",currentValue];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Log"
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
    [alertView show];
}

-(IBAction)sliderMoved:(UISlider *)sender{
    currentValue = sender.value;
}

-(BOOL)shouldAutorotateToInterfaceOrientation:
(UIInterfaceOrientation)toInterfaceOrientation{
    return UIInterfaceOrientationIsLandscape(toInterfaceOrientation); }


@end
