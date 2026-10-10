# C 数据结构实现（408 考研备考）

用 C 语言从零实现 408 考研常见数据结构。

**这个仓库有三重目的**：
1. **补 C 语言功底** —— 学校课过了但基础不牢，从指针重新学
2. **打 408 地基** —— 数据结构是 408 分值最高的一门（45/150）
3. **攒项目履历** —— 复试简历需要能讲的东西

---

## 📅 学习进度

| 周 | 内容 | 状态 |
|---|---|---|
| 1 | 指针 + 数组 | ⬜ |
| 2 | 字符串（自己实现 strlen/strcpy/strcmp） | ⬜ |
| 3 | 结构体 | ⬜ |
| 4 | 动态内存 malloc/free | ⬜ |
| 5 | **单链表**（增删查改 + 反转） | ⬜ |
| 6 | **栈 + 队列**（数组版 + 链表版） | ⬜ |
| 7 | **二叉树**（递归遍历） | ⬜ |
| 8 | **快速排序 + 归并排序** | ⬜ |

---

## 📁 目录结构

```
c-data-structures/
├── 01-linked-list/     单链表
├── 02-stack-queue/     栈与队列
├── 03-binary-tree/     二叉树
├── 04-sort/            排序算法
└── docs/               学习笔记与复盘
```

---

## 🔧 编译运行

需要 gcc（Dev-C++ / CodeBlocks / MinGW 都可以）。

```bash
gcc 01-linked-list/linked_list.c -o linked_list
./linked_list
```

Windows 下：
```powershell
gcc 01-linked-list\linked_list.c -o linked_list.exe
.\linked_list.exe
```

---

## 📖 参考资料

- 教材：谭浩强《C 程序设计》第五版
- 408：王道《数据结构》
- 网课：[王道计算机考研 408](https://www.bilibili.com/video/BV1cPML6NEGd/)（B站免费）

---

## 📝 学习笔记

见 [docs/notes.md](docs/notes.md)
