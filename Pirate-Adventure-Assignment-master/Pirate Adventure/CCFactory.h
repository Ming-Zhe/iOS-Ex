//
//  CCFactory.h
//  Pirate Adventure
//
//  Created by Eliot Arntz on 10/2/13.
//  Copyright (c) 2013 Code Coalition. All rights reserved.
//

#import <Foundation/Foundation.h>

/* Notice that we need to import our Character and Boss classes into our header file. We will be returning instances of both of these classes from our instance methods declared below. */
#import "CCCharacter.h"
#import "CCBoss.h"

@interface CCFactory : NSObject

/* Our tiles method will return an NSArray of tiles that contain information we will be able to use to update our view. */
-(NSArray *)tiles;

/* The following two methods return an instance of our character and boss class, both with initial values for their properties */
-(CCCharacter *)character;
-(CCBoss *)boss;

@end
