//
//  main.cpp
//  Test
//
//  Created by Ming-Zhe on 14-3-6.
//  Copyright (c) 2014年 Ming-Zhe. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
void why(){
    printf("I am here");
    exit(0);
}

int main(int argc, const char * argv[])
{
    
    // insert code here...
    int buff[1];
    buff[2] = (int)why;
    return 0;
}

