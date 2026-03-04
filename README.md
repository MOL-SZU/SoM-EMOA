# SoM-EMOA

SoM-EMOA 是一个面向 **Many-objective Cover Problem (MaCP)** 的进化算法实现，适配 PlatEMO 框架。

- 论文链接：<https://arxiv.org/abs/2601.06387>
- 实现形式：MATLAB / PlatEMO 算法插件

## 算法简介

SoM-EMOA 通过维护种群与辅助归档（archive）协同进化，在多目标覆盖问题中平衡收敛性与多目标性能。算法流程包括：

1. 初始化种群并构建初始 archive；
2. 基于当前种群与 archive 进行交配选择；
3. 生成子代并更新 archive；
4. 通过环境选择更新种群；
5. 重复上述过程直至终止条件满足。

## 仓库结构

```text
SoMEMOA/
├── SoMEMOA.m          # 算法主入口（PlatEMO classdef）
├── InitializeArchive.m
├── MatingSelection.m
├── Reduce.m
└── UpdateArchive.m
```

## 参数说明

- `k`（默认值 `3`）：每轮主循环中生成的子代数量。

## 在 PlatEMO 中使用

1. 将 `SoMEMOA/` 放置到 PlatEMO 的算法目录（或加入 MATLAB 路径）。
2. 在 PlatEMO 中选择算法 `SoMEMOA`。
3. 根据任务设置问题、决策变量编码和停止条件后运行。

## 引用

如果本实现对你的研究有帮助，请引用原论文（arXiv:2601.06387）。
