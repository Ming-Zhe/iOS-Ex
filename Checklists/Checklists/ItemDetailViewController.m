//
//  ItemDetailViewController.m
//  Checklists
//
//  Created by Ming-Zhe on 14-2-13.
//  Copyright (c) 2014年 Ming-Zhe. All rights reserved.
//

#import "ItemDetailViewController.h"
#import "ChecklistsItem.h"

@interface ItemDetailViewController ()

@end

@implementation ItemDetailViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.textField becomeFirstResponder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    if(self.itemToEdit != nil){
        self.title = @"Edit Item";
        self.textField.text = self.itemToEdit.text;
        self.doneBarButton.enabled = YES;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSIndexPath*)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSString *newText = [textField.text stringByReplacingCharactersInRange:range
                                                                withString:string];
    if([newText length] >0){
        self.doneBarButton.enabled = YES;
    }else{
        self.doneBarButton.enabled = NO;
    }
    return YES;
}

- (IBAction)cancel:(id)sender {
    
    [self.delegate itemDetailViewControllerDidCancel:self];
//    [self.presentingViewController dismissViewControllerAnimated:YES
//                                                      completion:nil];
}

- (IBAction)done:(id)sender {
    
//    NSLog(@"%@",self.textField.text);
//    [self.presentingViewController dismissViewControllerAnimated:YES
//                                                      completion:nil];
    if (self.itemToEdit == nil) {
        ChecklistsItem *item = [[ChecklistsItem alloc]init];
        item.text = self.textField.text;
        item.checked = NO;
        
        [self.delegate itemDetailViewController:self didFinishAddingItem:item];
    }else{
        self.itemToEdit.text = self.textField.text;
        [self.delegate itemDetailViewcontroller:self didFinishEditingItem:self.itemToEdit];
    }
    
}
@end
