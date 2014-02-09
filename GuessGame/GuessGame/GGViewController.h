//
//  GGViewController.h
//  GuessGame
//
//  Created by Ming-Zhe on 14-2-8.
//  Copyright (c) 2014年 Ming-Zhe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GGViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISlider *slider;

- (IBAction)showAlert:(id)sender;
- (IBAction)sliderMoved:(id)sender;


@end
