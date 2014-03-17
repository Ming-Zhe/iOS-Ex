//
//  main.c
//  SplayTree
//
//  Created by Ming-Zhe on 14-3-17.
//  Copyright (c) 2014年 Ming-Zhe. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

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
void splay(Tree tree, int key);

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

int main(int argc, const char * argv[])
{

    // insert code here...
    printf("Hello, World!\n");
    return 0;
}


















