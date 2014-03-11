//
//  main.c
//  test01
//
//  Created by Ming-Zhe on 14-3-11.
//  Copyright (c) 2014年 Ming-Zhe. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

typedef struct node{
    int data;
}node, *Tree;

node* init (node* node)
{
    node->data = 1;
    return node;
}

void replace(node* node)
{
    node->data = 2;
}

int main(int argc, const char * argv[])
{
    node* node1 = (node*)malloc(sizeof(node));
    node1 = init(node1);
    
    int* p = NULL;
    
    replace(node1);
    
    printf("%d\n",node1->data);
    return 0;
}

