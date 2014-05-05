//
//  PBViewController.m
//  PorgressBar
//
//  Created by Ming-Zhe on 14-5-2.
//  Copyright (c) 2014年 Ming-Zhe. All rights reserved.
//

#import "PBViewController.h"

@interface PBViewController ()

@end

@implementation PBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //画线
    //设置画笔线条粗细
    CGContextSetLineWidth(context, 5.0);
    //设置线条样式
    CGContextSetLineCap(context, kCGLineCapButt);
    //设置画笔颜色：黑色
    CGContextSetRGBStrokeColor(context, 1, 0, 0, 1);
    //画点连线
//    CGContextAddLines(context);
    //执行绘画
    CGContextStrokePath(context);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
