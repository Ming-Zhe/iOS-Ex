//
//  ChecklistsItem.h
//  Checklists
//
//  Created by Ming-Zhe on 14-2-13.
//  Copyright (c) 2014年 Ming-Zhe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChecklistsItem : NSObject<NSCoding>

@property (nonatomic, copy)NSString *text;
@property (nonatomic, assign)BOOL checked;

-(void)toggleChecked;

@end
