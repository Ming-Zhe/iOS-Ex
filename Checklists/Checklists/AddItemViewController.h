//
//  AddItemViewController.h
//  Checklists
//
//  Created by Ming-Zhe on 14-2-13.
//  Copyright (c) 2014年 Ming-Zhe. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AddItemViewController;
@class ChecklistsItem;

@protocol AddItemViewControllerDelegate <NSObject>

-(void)addItemViewControllerDidCancel:(AddItemViewController *)controller;
//_(void)addItemViewController:(AddItemViewController *)controller didFinishAddingItem:(ChecklistsItem *)item;

@end

@interface AddItemViewController : UITableViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneBarButton;

@property (weak, nonatomic) IBOutlet UITextField *textField;

- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;

@end
