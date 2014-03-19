//
//  main.c
//  SplayTree
//
//  Created by Ming-Zhe on 14-3-17.
//  Copyright (c) 2014年 Ming-Zhe. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

typedef struct node{
    struct node* pre;
    struct node* lchild;
    struct node* rchild;
    int value;
}node,*Tree;

Tree zig(Tree tree);
Tree zag(Tree tree);
Tree to_right_zigzig(Tree tree);
Tree to_left_zigzig(Tree tree);
Tree to_right_double_zigzag(Tree tree);
Tree to_left_double_zigzag(Tree tree);

Tree find_item(Tree tree, int key);
void move_to_top(Tree tree, int key);

Tree zig(Tree tree)
{
    Tree newRoot, parent;
    parent  = tree->pre;
    newRoot = tree->lchild;
    
    if (newRoot->rchild != NULL){
        newRoot->rchild->pre = tree;
        tree->lchild = newRoot->rchild;
    }
    
    newRoot->rchild = tree;
    newRoot->pre = parent;
    if (parent != NULL) {
        if (parent->lchild == tree) {
            parent->lchild = newRoot;
        }
        else {
            parent->rchild = newRoot;
        }
    }
    tree->pre = newRoot;
    return newRoot;
}
Tree zag(Tree tree)
{
    Tree newRoot, parent;
    parent  = tree->pre;
    newRoot = tree->rchild;

    if (newRoot->lchild != NULL){
        newRoot->lchild->pre = tree;
        tree->rchild = newRoot->lchild;
    }
    
    newRoot->lchild = tree;
    newRoot->pre = parent;
    if (parent != NULL) {
        if (parent->lchild == tree) {
            parent->lchild = newRoot;
        }
        else {
            parent->rchild = newRoot;
        }
    }
    tree->pre = newRoot;
    return newRoot;
}
Tree to_right_zigzig(Tree tree)
{
    tree->pre = zig(tree->pre->pre);
    return zig(tree->pre);
}
Tree to_left_zigzig(Tree tree)
{
    tree->pre = zag(tree->pre->pre);
    return zag(tree->pre);
}
Tree to_right_double_zigzag(Tree tree)
{
    tree = zag(tree->pre);
    return zig(tree->pre);
}
Tree to_left_double_zigzag(Tree tree)
{
    tree = zig(tree->pre);
    return zag(tree->pre);
}

Tree find_item(Tree tree, int key)
{
    if (tree == NULL) {
        return NULL;
    }
    if (tree->value == key) {
        return tree;
    }else if (key > tree->value){
        return find_item(tree->rchild, key);
    }else{
        return find_item(tree->lchild, key);
    }
}

void move_to_top(Tree tree , int key)
{
    Tree toMove;
    toMove = find_item(tree, key);
    if (toMove == NULL) {
        printf("not exist!\n");
    }else if (toMove->pre == NULL){
        printf("already on the top\n");
    }else if (toMove->pre != NULL){
        if (toMove->pre->pre == NULL) {
            if (toMove == toMove->pre->lchild) {
                zig(toMove->pre);
            }else{
                zag(toMove->pre);
            }
        }else{
            if (toMove->pre == toMove->pre->pre->lchild) {
                if (toMove == toMove->pre->lchild) {
                    to_right_zigzig(tree);
                }else{
                    to_right_double_zigzag(tree);
                }
            }else{
                if (toMove == toMove->pre->lchild) {
                    to_left_double_zigzag(tree);
                }else{
                    to_left_zigzig(tree);
                }
            }
        }
    }
}

node *create(int key) {
    node *newnode;
    newnode = (node*)malloc(sizeof(node));
    if( newnode == NULL) {
        return NULL;
    }
    newnode->value = key;
    newnode->rchild = newnode->lchild = newnode->pre = NULL;
    return newnode;
}

bool insertNode(int key, Tree tree){
    Tree preNode = NULL;
    Tree curr = tree;
    
    while(curr != NULL) {
        if(key < curr->value) { // 向左
            preNode = curr;
            curr = curr->lchild;
        }
        else if(key > curr->value) { // 向右
            preNode = curr;
            curr = curr->rchild;
        }
        else // 失败
            return 0;
    }
    
    curr = (Tree)malloc(sizeof(node)); // 插入
    curr->value = key;
    curr->lchild = curr->rchild = NULL;
    curr->pre = preNode;
    if(preNode == NULL)
        tree = curr;
    else{
        if (curr->value < preNode->value) {
            preNode->lchild=curr;
        }
        else{
            preNode->rchild=curr;
        }
    }
    return 1;
}

bool deleteNode(Tree T, int key){
    node* par = NULL;
    node* tmp;
    while(T != NULL) {
        if(key < T->value) { // 向左
            par = T;
            T = T->lchild;
        }
        else if(key > T->value) { // 向右
            par = T;
            T = T->rchild;
        }
        else { // 找到了
            if(NULL==T->lchild && NULL==T->rchild) { // 叶子结点
                if(par == NULL) { // 根结点
                    free (T);
                    T = NULL;
                }
                else { // 非根结点
                    (par->lchild==T)?(par->lchild=NULL):(par->rchild=NULL);
                    free(T);
                    T = NULL;
                }
            }
            else if(NULL!=T->lchild && NULL==T->rchild) { // 只有左孩子
                if(par == NULL) { // 根结点
                    tmp = T;
                    T = T->lchild;
                    free(tmp);
                }
                else { // 非根结点
                    (par->lchild==T)?(par->lchild=T->lchild):(par->rchild=T->lchild);
                    free(T);
                }
            }
            else if(NULL!=T->rchild && NULL==T->lchild) { // 只有右孩子
                if(par == NULL) { // 根结点
                    tmp = T;
                    T = T->rchild;
                    free(tmp);
                }
                else { // 非根结点
                    (par->lchild==T)?(par->lchild=T->rchild):(par->rchild=T->rchild);
                    free(T);
                }
            }
            else { // 既有左孩子也有右孩子
                node* leftNode = T;
                while(leftNode->rchild != NULL) {
                    par = leftNode;
                    leftNode = leftNode->rchild;
                }
                // 交换leftNode与node
                int swapValue = leftNode->value;
                leftNode->value = T->value;
                T->value = swapValue;
                // 删除leftNode，parent肯定不为空
                (par->lchild==T)?(par->lchild=NULL):(par->rchild=NULL);
                free(T);
            }
        }
    }
    return false; // 失败
}

void InOrder(node *root) {
    if(root == NULL) {
        return; }
    InOrder(root->lchild);
    printf("%d\t",root->value);
    InOrder(root->rchild);
}


int main(int argc, const char * argv[])
{

    // insert code here...
    Tree tree;
    tree = create(10);
    insertNode(8, tree);
    insertNode(6, tree);
    insertNode(7, tree);
    insertNode(11, tree);
    insertNode(14, tree);
    insertNode(12, tree);
    insertNode(9, tree);
    
    InOrder(tree);
    
    move_to_top(tree, 9);
    
    printf("%d",tree->lchild->value);
    return 0;
}


















