//
//  CCViewController.m
//  World Map Challenge Solution
//
//  Created by Eliot Arntz on 10/19/13.
//  Copyright (c) 2013 Code Coalition. All rights reserved.
//

#import "CCViewController.h"

@interface CCViewController ()

@end

@implementation CCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    /* Set the value of your imageView property equal to an ImageView object with an image equal to our worldMap.jpeg image */
    self.globeImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"worldMap.jpeg"]];
    
    /* Set the contentsize of your scrollview equal to the size of our image. */
    self.scrollView.contentSize = self.globeImageView.frame.size;
    
    /* Add your imageView onto your scrollview. */
    [self.scrollView addSubview:self.globeImageView];
    
    /* Set the scrollview's delegate property to self. This will allow the CCViewController to recieve messages from the UIScrollViewDelegate */
    self.scrollView.delegate = self;
    
    /* Set the maximum and minimum zoom scales to be different so that the user will be able to zoom in and out of the imageView. These repersent the maximum minimum scale factors when we zoom. */
    self.scrollView.maximumZoomScale = 2.0;
    self.scrollView.minimumZoomScale = 0.5;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/* We implement the UIScrollView delegate method so that the UIScrollView delegate will know which view on its' scrollview to zoom into and out of. */
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.globeImageView;
}

@end
