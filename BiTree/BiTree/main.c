//
//  main.c
//  BiTree
//
//  Created by Ming-Zhe on 14-2-14.
//  Copyright (c) 2014年 Ming-Zhe. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

typedef struct BiTNode{
	char data;
	struct BiTNode *lChild,*rChild;
}BiTNode,*BiTree;

void show(char data)
{
    printf("%c ", data);
}

BiTree Create(BiTree t)
{
    t = (BiTree)malloc(sizeof(BiTNode));
    if(t == NULL){
        return t;
    }
    char c;
    scanf("%c",&c);
    if(c == ' '){               // 空格表示叶子
        t = NULL;
    }
    else{
        t->data = c;
        t->lChild = Create(t->lChild);
        t->rChild = Create(t->rChild);
    }
    return t;
}


void PreOrder(BiTNode* root)
{
    if (root == NULL)
        return;
    show(root->data);
    PreOrder(root->lChild);
    PreOrder(root->rChild);
}

void InOrder(BiTNode* root)
{
    if (root == NULL)
        return;
    InOrder(root->lChild);
    show(root->data);
    InOrder(root->rChild);
}

void PostOrder(BiTNode* root)
{
    if (root == NULL)
        return;
    PostOrder(root->lChild);
    PostOrder(root->rChild);
    show(root->data);
}

int main(int argc, const char * argv[])
{
    

    // insert code here...
    printf("先序输入二叉树，空格表示叶子节点:\n");
    
    BiTree T = NULL;
    T = Create(T);
    
    printf("\n先序：\n");
    PreOrder(T);
    printf("\n中序：\n");
    InOrder(T);
    printf("\n后序：\n");
    PostOrder(T);
    
    return 0;
}

