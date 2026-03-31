# Infra / Skills / Forks

Use this category for ecosystem entries that are directly about autoresearch infrastructure, ports, or operator tooling, but are not themselves a domain case study.

## Submission format

```md
- [Name](URL) - Industry: one-sentence description of the autoresearch use case.
```

## Entries

- [n-autoresearch](https://github.com/iii-hq/n-autoresearch) - Autoresearch infra: extends Karpathy's loop with structured experiment state, multi-GPU parallelism, adaptive search, and crash recovery.
- [autoresearch-evaluation-harness](https://github.com/sou350121/autoresearch-evaluation-harness) - Evaluation infrastructure: compares autoresearch-style proposal strategies under fixed task adapters, explicit scalar scoring, and hard keep/discard gates.
- [autoresearch-mlx](https://github.com/trevin-creator/autoresearch-mlx) - Apple Silicon fork: ports Karpathy's autoresearch to MLX while keeping the fixed-time training budget, single mutable file, and git keep/revert loop.
- [Claude Autoresearch](https://github.com/uditgoenka/autoresearch) - Claude Code skill: generalizes Karpathy's autoresearch into a reusable modify → verify → keep/discard loop for measurable goals beyond ML.
- [codex-autoresearch](https://github.com/leo-lilinxiao/codex-autoresearch) - Codex skill: brings the autoresearch pattern to Codex for unattended metric-driven software iteration with automatic keep/discard decisions.
- [autoresearch-plugin](https://github.com/AILAB-H/autoresearch-plugin) - Claude Code plugin: packages the Karpathy-style experiment loop into init/test/run commands for projects with explicit evaluation scripts and git rollback.
- [Artificial General Research](https://github.com/JoaquinMulet/Artificial-General-Research) - Optimization framework: turns measurable code optimization tasks into autoresearch loops with variance-aware acceptance, artifact detection, and exhausted-approach tracking.
- [autoresearch-engram](https://github.com/tonitangpotato/autoresearch-engram) - Memory extension: adds persistent recall, pattern extraction, and reflection steps to Karpathy's autoresearch so the agent remembers what worked across long runs.
- [pi-autoresearch](https://github.com/davebcn87/pi-autoresearch) - pi extension: generalizes Karpathy's autoresearch into experiment tools, a live dashboard, and slash-command skills for metric-driven optimization beyond ML.
- [SkyPilot parallel autoresearch](https://blog.skypilot.co/scaling-autoresearch/) - GPU infrastructure: gives Karpathy's autoresearch access to 16 GPUs so the agent can run parallel experiment waves, validate winners on faster hardware, and reach about 910 runs in about 8 hours.
- [serverless-autoresearch](https://github.com/roboco-io/serverless-autoresearch) - SageMaker infrastructure: parallelizes Karpathy's autoresearch on Spot training jobs so the agent evaluates `train.py` candidates with HUGI-style burst compute instead of paying for idle GPUs.
