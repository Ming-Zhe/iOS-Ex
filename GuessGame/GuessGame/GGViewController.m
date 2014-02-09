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

@implementation GGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showAlert:(id)sender {
    [[[UIAlertView alloc]initWithTitle:@"Hello World"
                               message:@"Hello"
                              delegate:nil
                     cancelButtonTitle:@"OK"
                     otherButtonTitles:nil,nil]
     show];
}


@end
