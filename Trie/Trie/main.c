//
//  main.c
//  Trie
//
//  Created by Ming-Zhe on 14-3-9.
//  Copyright (c) 2014年 Ming-Zhe. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_LETTER 26

typedef struct Trie{
    int count;
    char value;
    struct Trie* next[MAX_LETTER];
}DNode,*DTree;

DTree creat(DTree tree)
{
    int i;
    tree = (DTree)malloc(sizeof(DNode));
    tree->value = ' ';
    tree->count = 0;
    for (i = 0; i < MAX_LETTER; i++) {
        tree->next[i] = NULL;
    }
    return tree;
}

DTree insert(char *str, DTree tree)
{
    unsigned long len = strlen(str);
//    const char * string =
    //GET_ARRAY_LEN(string, len);
    char string[30];
    strcpy(string, str);
    
    DNode* node = tree;
    for (int i = 0; i < len; i++) {
        if (node->next[string[i] - 'a'] != NULL) {
            node = node->next[string[i] - 'a'];
            if (i==len - 1) {
                node->count++;
            }
        }
        else
        {
            node->next[string[i] - 'a'] = (DNode *)malloc(sizeof(DNode));
            node = node->next[string[i] - 'a'];
            node->value = string[i];
            for (int j = 1; j < MAX_LETTER; j++) {
                node->next[j] = NULL;
            }
            if (i == len - 1) {
                node->count++;
            }
        }
    }
    return tree;
}

int find(char* str, DTree tree)
{
    unsigned long len = strlen(str);
    char string[30];
    strcpy(string, str);
    DNode* node = tree;
    
    for (int i = 0; i < len; i++) {
        for (int j = 0; j < MAX_LETTER; j++) {
            if (node->next[j]->value == string[i]) {
                node = node->next[j];
                break;
            }
            else
            {
                if (j == MAX_LETTER - 1) {
                    return 0;
                }
            }
        }
        if (i==len - 1) {
            return node->value;
        }
    }
    return 0;
}

int main(int argc, const char * argv[])
{

    // insert code here...
    char* str1 = "asdf";
    char str2[10];
    strcpy(str2, str1);
    
    printf("%c\n",str2[1]);
    
    printf("Hello, World!\n");
    return 0;
}


