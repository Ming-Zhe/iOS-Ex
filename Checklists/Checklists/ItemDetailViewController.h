//
//  ItemDetailViewController.h
//  Checklists
//
//  Created by Ming-Zhe on 14-2-13.
//  Copyright (c) 2014年 Ming-Zhe. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ItemDetailViewController;
@class ChecklistsItem;

@protocol ItemDetailViewControllerDelegate <NSObject>

-(void)itemDetailViewControllerDidCancel:(ItemDetailViewController *)controller;
-(void)itemDetailViewController:(ItemDetailViewController *)controller didFinishAddingItem:(ChecklistsItem *)item;
-(void)itemDetailViewcontroller:(ItemDetailViewController*)controller didFinishEditingItem:(ChecklistsItem*)item;

@end

@interface ItemDetailViewController : UITableViewController<UITextFieldDelegate>

@property (weak, nonatomic) id <ItemDetailViewControllerDelegate> delegate;
@property (strong, nonatomic) ChecklistsItem *itemToEdit;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneBarButton;
@property (weak, nonatomic) IBOutlet UITextField *textField;

- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;

@end
