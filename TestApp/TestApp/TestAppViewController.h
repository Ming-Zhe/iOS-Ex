//
//  TestAppViewController.h
//  TestApp
//
//  Created by Ming-Zhe on 14-3-5.
//  Copyright (c) 2014年 Ming-Zhe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestAppViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
- (IBAction)buttonPressed:(UIButton *)sender;

@end
