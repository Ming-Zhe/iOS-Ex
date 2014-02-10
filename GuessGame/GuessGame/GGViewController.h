//
//  GGViewController.h
//  GuessGame
//
//  Created by Ming-Zhe on 14-2-8.
//  Copyright (c) 2014年 Ming-Zhe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GGViewController : UIViewController<UIAlertViewDelegate>


@property (strong, nonatomic) IBOutlet UISlider *slider;
@property (strong, nonatomic) IBOutlet UILabel *targetLabel;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *roundLabel;

- (IBAction)showAlert:(id)sender;
- (IBAction)sliderMoved:(id)sender;
- (IBAction)startOver:(id)sender;
- (IBAction)showInfo:(id)sender;


@end
