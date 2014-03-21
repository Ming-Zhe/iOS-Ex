//
//  CCViewController.h
//  World Map Challenge Solution
//
//  Created by Eliot Arntz on 10/19/13.
//  Copyright (c) 2013 Code Coalition. All rights reserved.
//

#import <UIKit/UIKit.h>

/* The angle brakets mean that the class now conforms to the UIScrollView Protocol. In short we get access to the methods defined in the UIScrollViewDelegate like viewForZoomingInScrollView */
@interface CCViewController : UIViewController <UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

/* Create a property of type UIImageView which we will create in code and add to our UIScrollView. */
@property (strong, nonatomic) UIImageView *globeImageView;

@end
