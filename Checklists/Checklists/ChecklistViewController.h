//
//  ChecklistViewController.h
//  Checklists
//
//  Created by Ming-Zhe on 14-2-11.
//  Copyright (c) 2014年 Ming-Zhe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemDetailViewController.h"

@class Checklist;

@interface ChecklistViewController : UITableViewController <ItemDetailViewControllerDelegate>

@property (nonatomic, strong) Checklist *checklist;

@end
