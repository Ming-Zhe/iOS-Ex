//
//  GravityViewController.m
//  GravityTest
//
//  Created by Ming-Zhe on 14-3-3.
//  Copyright (c) 2014年 Ming-Zhe. All rights reserved.
//

#import "GravityViewController.h"

@interface GravityViewController ()

@property (strong, nonatomic) UIDynamicAnimator *animator;

@end

@implementation GravityViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIView *aView = [[UIView alloc] initWithFrame:CGRectMake(100, 50, 100, 100)];
    aView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:aView];
    
    UIDynamicAnimator* animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    UIGravityBehavior* gravityBeahvior = [[UIGravityBehavior alloc] initWithItems:@[aView]];
    [animator addBehavior:gravityBeahvior];
    
    UICollisionBehavior* collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[aView]];
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    [animator addBehavior:collisionBehavior];
    collisionBehavior.collisionDelegate = (id)self;
    
    aView.transform = CGAffineTransformRotate(aView.transform, 45);
    
    self.animator = animator;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
