//
//  GNViewController.h
//  GuessNumber
//
//  Created by Ming-Zhe on 14-2-4.
//  Copyright (c) 2014年 Ming-Zhe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GNViewController : UIViewController<UIAlertViewDelegate>

-(IBAction)sliderMoved:(UISlider *)sender;
-(IBAction)showAlert;
-(IBAction)startOver;
-(IBAction)showInfo;

@property (nonatomic, strong) IBOutlet UISlider *slider;
@property (nonatomic, strong) IBOutlet UILabel *targetLabel;
@property (nonatomic, strong) IBOutlet UILabel *scoreLabel;
@property (nonatomic, strong) IBOutlet UILabel *roundLabel;

@end
