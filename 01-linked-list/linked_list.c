/*
 * 单链表（Singly Linked List）
 * ------------------------------------------------------------
 * 408 数据结构第 2 章核心内容，也是代码题最常考的结构。
 *
 * 学习顺序（第 5 周，2027.01）：
 *   ① 先看结构体定义，想清楚"一个节点由什么组成"
 *   ② 自己写 createNode / insert / delete / search / print
 *   ③ 最后写 reverse（反转）—— 这是 408 代码题高频考点
 *   ④ 写完跑一遍，确认没有内存泄漏
 *
 * 编译：gcc linked_list.c -o linked_list
 */

#include <stdio.h>
#include <stdlib.h>

/* ---------- ① 结构体定义 ---------- */
typedef struct Node {
    int data;              /* 数据域 */
    struct Node *next;     /* 指针域：指向下一个节点 */
} Node;

/* ---------- ② 创建节点 ---------- */
Node* createNode(int value) {
    Node *p = (Node*)malloc(sizeof(Node));
    if (p == NULL) {          /* malloc 可能失败，必须检查 */
        printf("内存分配失败\n");
        exit(1);
    }
    p->data = value;
    p->next = NULL;
    return p;
}

/* ---------- ③ 头插法（新节点插在链表头部） ---------- */
void insertHead(Node **head, int value) {
    Node *p = createNode(value);
    p->next = *head;
    *head = p;
}

/* ---------- ④ 尾插法（新节点插在链表尾部） ---------- */
void insertTail(Node **head, int value) {
    Node *p = createNode(value);
    if (*head == NULL) {      /* 空链表特殊情况 */
        *head = p;
        return;
    }
    Node *cur = *head;
    while (cur->next != NULL) cur = cur->next;   /* 走到最后一个节点 */
    cur->next = p;
}

/* ---------- ⑤ 按值删除 ---------- */
void deleteValue(Node **head, int value) {
    if (*head == NULL) return;

    /* 要删的是头节点 —— 特殊情况单独处理 */
    if ((*head)->data == value) {
        Node *tmp = *head;
        *head = (*head)->next;
        free(tmp);
        return;
    }

    /* 一般情况：找到要删节点的前一个 */
    Node *cur = *head;
    while (cur->next != NULL && cur->next->data != value) cur = cur->next;
    if (cur->next != NULL) {
        Node *tmp = cur->next;
        cur->next = tmp->next;
        free(tmp);
    }
}

/* ---------- ⑥ 查找 ---------- */
Node* search(Node *head, int value) {
    Node *cur = head;
    while (cur != NULL) {
        if (cur->data == value) return cur;
        cur = cur->next;
    }
    return NULL;
}

/* ---------- ⑦ 打印 ---------- */
void printList(Node *head) {
    Node *cur = head;
    while (cur != NULL) {
        printf("%d", cur->data);
        if (cur->next != NULL) printf(" -> ");
        cur = cur->next;
    }
    printf("\n");
}

/* ---------- ⑧ 反转链表 ★408 高频代码题 ---------- */
/*
 * 三指针法：
 *   prev 指向已反转部分的头
 *   cur  指向当前要处理的节点
 *   next 先存住 cur->next，防止断链
 */
Node* reverse(Node *head) {
    Node *prev = NULL;
    Node *cur = head;
    while (cur != NULL) {
        Node *next = cur->next;   /* ① 先存住下一个 */
        cur->next = prev;         /* ② 当前节点指向前一个 */
        prev = cur;               /* ③ prev 前移 */
        cur = next;               /* ④ cur  前移 */
    }
    return prev;                  /* prev 就是新的头 */
}

/* ---------- ⑨ 释放整条链表 ---------- */
void freeList(Node *head) {
    Node *cur = head;
    while (cur != NULL) {
        Node *next = cur->next;
        free(cur);
        cur = next;
    }
}

/* ---------- ⑩ 测试 ---------- */
int main(void) {
    Node *head = NULL;

    insertTail(&head, 1);
    insertTail(&head, 2);
    insertTail(&head, 3);
    insertHead(&head, 0);
    printf("初始链表: ");
    printList(head);                 /* 0 -> 1 -> 2 -> 3 */

    deleteValue(&head, 2);
    printf("删除 2 后: ");
    printList(head);                 /* 0 -> 1 -> 3 */

    head = reverse(head);
    printf("反转后:   ");
    printList(head);                 /* 3 -> 1 -> 0 */

    printf("查找 1: %s\n", search(head, 1) ? "找到" : "没找到");
    printf("查找 9: %s\n", search(head, 9) ? "找到" : "没找到");

    freeList(head);
    return 0;
}

/*
 * ============ 复盘问题（学完自己回答）============
 * ① 为什么 insertHead 用 Node** 而不是 Node*？
 *    （提示：要修改 head 本身，需要传它的地址）
 * ② deleteValue 里为什么要单独处理"删头节点"？
 * ③ reverse 里先存 next 是为什么？不存会怎样？
 * ④ 头插法和尾插法建出来的链表有什么不同？
 * ⑤ freeList 为什么不能直接 free(head) 然后 free(head->next)？
 */
