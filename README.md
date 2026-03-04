# SoM-EMOA

本仓库提供论文 **SoM-EMOA**（[arXiv:2601.06387](https://arxiv.org/abs/2601.06387)）对应的 PlatEMO 算法实现。

## 更新内容

- 将算法实现目录从 `MaCPnew/` 统一更名为 `SoMEMOA/`。
- 将算法主类从 `MaCPnew` 更名为 `SoMEMOA`，并在代码注释中统一使用 **SoM-EMOA** 命名。
- 对辅助函数做了格式化与注释清理，保持与当前算法名称一致。

## 目录结构

```text
SoMEMOA/
├── SoMEMOA.m          # 算法主入口（PlatEMO classdef）
├── InitializeArchive.m
├── MatingSelection.m
├── Reduce.m
└── UpdateArchive.m
```

## 在 PlatEMO 中使用

1. 将 `SoMEMOA/` 放置在 PlatEMO 的算法目录下（或加入 MATLAB 路径）。
2. 在 PlatEMO GUI 或脚本中选择算法 `SoMEMOA`。
3. 参数 `k` 默认值为 `3`，表示每轮迭代生成的子代数量。

## 引用

如果该实现对你的研究有帮助，请引用对应论文：

- SoM-EMOA, arXiv:2601.06387.
