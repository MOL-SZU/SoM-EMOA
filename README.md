# SoM-EMOA

SoM-EMOA is an evolutionary algorithm implementation for the **Many-objective Cover Problem (MaCP)**, designed for the PlatEMO framework.

- Paper: <https://arxiv.org/abs/2601.06387>
- Implementation: MATLAB / PlatEMO algorithm plugin

## Algorithm Overview

SoM-EMOA co-evolves a population and an auxiliary archive to balance convergence and multi-objective performance on MaCP tasks. The core workflow is:

1. Initialize the population and construct the initial archive.
2. Perform mating selection based on the current population and archive.
3. Generate offspring and update the archive.
4. Apply environmental selection to update the population.
5. Repeat until the stopping criterion is met.

## Repository Structure

```text
SoMEMOA/
├── SoMEMOA.m          # Main algorithm entry (PlatEMO classdef)
├── InitializeArchive.m
├── MatingSelection.m
├── Reduce.m
└── UpdateArchive.m
```

## Parameter

- `k` (default: `3`): number of offspring generated in each main iteration.

## Usage in PlatEMO

1. Place `SoMEMOA/` under PlatEMO's algorithm directory (or add it to the MATLAB path).
2. Select `SoMEMOA` as the algorithm in PlatEMO.
3. Configure the problem, decision-variable encoding, and stopping condition, then run.

## Citation

If this implementation is useful for your research, please cite the original paper (arXiv:2601.06387).
