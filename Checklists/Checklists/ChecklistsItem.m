//
//  ChecklistsItem.m
//  Checklists
//
//  Created by Ming-Zhe on 14-2-13.
//  Copyright (c) 2014年 Ming-Zhe. All rights reserved.
//

#import "ChecklistsItem.h"

@implementation ChecklistsItem


- (void) encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.text forKey:@"Text"];
    [aCoder encodeBool:self.checked forKey:@"Checked"];
}
- (id) initWithCoder:(NSCoder *)aDecoder{
    if((self =[super init])){
        self.text = [aDecoder decodeObjectForKey:@"Text"];
        self.checked = [aDecoder decodeBoolForKey:@"Checked"];
    }
    return self;
}

- (void) toggleChecked{
    self.checked = !self.checked;
}

@end
