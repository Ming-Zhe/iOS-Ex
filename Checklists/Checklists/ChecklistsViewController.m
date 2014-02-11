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
    return 5;
}

-(UITableViewCell*)tableView: (UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"ChecklistItem"];
    UILabel *label = (UILabel*)[cell viewWithTag:1000];
    if(indexPath.row ==0){
        label.text = @"观看嫦娥⻜飞天和⽟玉兔升空的视频";
    }else if(indexPath.row ==1){
        label.text = @"了解Sony a7和MBP的最新价格";
    }else if(indexPath.row ==2){
        label.text = @"复习苍⽼老师的经典视频教程";
    }else if(indexPath.row ==3){
        label.text = @"去电影院看地⼼心引⼒力";
    }else if(indexPath.row ==4){
        label.text = @"看⻄西甲巴萨新败的⽐比赛回放";
    }
    return cell;
}

@end
