---
title: "Use Special Characters in Vim"
date: 2021-03-14T05:14:21+08:00
description: "在 Vim 裡面使用特殊符號。"
tags:
  - vim
  - neovim
  - math
categories: vim
draft: false
hideDate: true
---

今天是 pi day，我們來學一下怎麼在 Vim 使用 `π` 符號。

在 Insert Mode 輸入：

```text
<ctrl> k + p*
```

## 如何查看特殊符號列表

在 Normal Mode 輸入

```text
:digraphs
```

![digraphs](/posts/2021-03-14/digraphs.png)
