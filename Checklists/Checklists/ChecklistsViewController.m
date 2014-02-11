//
//  ChecklistsViewController.m
//  Checklists
//
//  Created by Ming-Zhe on 14-2-11.
//  Copyright (c) 2014年 Ming-Zhe. All rights reserved.
//

#import "ChecklistsViewController.h"

@interface ChecklistsViewController ()

@end

@implementation ChecklistsViewController

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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"ChecklistItem"];
    return cell;
}

@end
