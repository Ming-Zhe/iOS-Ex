//
//  PBViewController.m
//  ProgressBars
//
//  Created by Ming-Zhe on 14-5-3.
//  Copyright (c) 2014年 Ming-Zhe. All rights reserved.
//

#import "PBViewController.h"
#import "PBView.h"

static const CGSize progressViewSize = { 300.0f, 8.0f };

@interface PBViewController ()

@property (nonatomic) CGFloat progress;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) NSArray *progressViews;

@end


@implementation PBViewController

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)viewDidLoad
{
//    [super viewDidLoad];
    UIView *div = [[UIView alloc] initWithFrame:CGRectMake(0, 100,CGRectGetWidth(self.view.bounds), CGRectGetMidY(self.view.bounds))];
    div.backgroundColor = [UIColor whiteColor];
    
    PBView *progressView = [[PBView alloc] initWithFrame:CGRectMake(CGRectGetMidX(div.frame) - progressViewSize.width / 2.0f,
                                                                                       CGRectGetMidY(div.frame) - progressViewSize.height / 2.0f,
                                                                                       progressViewSize.width,
                                                                                       progressViewSize.height)];
    
    progressView.progressColor = [UIColor redColor];
    [div addSubview:progressView];
    [self.view addSubview:div];
    
    self.progressViews = @[ progressView ];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateProgress) userInfo:nil repeats:YES];
}


- (void)updateProgress
{
    self.progress += 0.20f;
    if (self.progress > 1.00001f) {
        self.progress = 0;
    }
    //    NSLog(@"%f",self.progress);
    
    [self.progressViews enumerateObjectsUsingBlock:^(PBView *progressView, NSUInteger idx, BOOL *stop) {
        [progressView setProgress:self.progress animated:YES];
    }];
    //    [[self.progressViews objectAtIndex:1] setProgress:self.progress animated:YES];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
