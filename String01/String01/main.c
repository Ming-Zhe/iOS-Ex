//
//  main.c
//  String01
//
//  Created by Ming-Zhe on 14-4-12.
//  Copyright (c) 2014年 Ming-Zhe. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

int main(int argc, const char * argv[])
{
    char c;
    char in[256];
//    char stand[36] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'};
    char *stand = "0123456789abcdefghijklmnopqrstuvwxyz";
    char out[256];
    int i=0;
    
    while(scanf("%c", &c), c!='\n')
    {
        in[i++] = c;
    }
    
    int num = sizeof(in) / sizeof(in[0]);
    for (i = 0; i < num; i++) {
        char* compare = strchr(stand, in[i]);
        if(compare == NULL){
            printf("<invalid input string>\n");
            break;
        }
    }
    
    printf("%s\n", in);
}

