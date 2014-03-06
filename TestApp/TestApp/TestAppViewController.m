//
//  TestAppViewController.m
//  TestApp
//
//  Created by Ming-Zhe on 14-3-5.
//  Copyright (c) 2014年 Ming-Zhe. All rights reserved.
//

#import "TestAppViewController.h"

@interface TestAppViewController ()

@end

@implementation TestAppViewController

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

- (IBAction)buttonPressed:(UIButton *)sender {
    self.titleLabel.text = @"haha";
}
@end
