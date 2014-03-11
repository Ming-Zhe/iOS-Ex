//
//  CCTile.h
//  Pirate Adventure
//
//  Created by Eliot Arntz on 10/2/13.
//  Copyright (c) 2013 Code Coalition. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCWeapon.h"
#import "CCArmor.h"

@interface CCTile : NSObject

/* Our Tile class has properties that we will use to encapsulate data to update our view objects. We also can add a weapon, armor and/or health effect to our tile class. We will use these properties when we press the action button and trigger the method actionButtonPressed in our ViewController. */
@property (strong, nonatomic) NSString *story;
@property (strong, nonatomic) UIImage *backgroundImage;
@property (strong, nonatomic) NSString *actionButtonName;
@property (strong, nonatomic) CCWeapon *weapon;
@property (strong, nonatomic) CCArmor *armor;
@property (nonatomic) int healthEffect;

@end
