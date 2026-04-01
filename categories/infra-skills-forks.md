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
- [claude-autoresearch](https://github.com/Maleick/claude-autoresearch) - Claude Code plugin: runs autoresearch on isolated branches with deterministic verification commands, scheduled overnight sessions, and structured keep/discard reports.
- [codex-autoresearch](https://github.com/leo-lilinxiao/codex-autoresearch) - Codex skill: brings the autoresearch pattern to Codex for unattended metric-driven software iteration with automatic keep/discard decisions.
- [autoresearch-plugin](https://github.com/AILAB-H/autoresearch-plugin) - Claude Code plugin: packages the Karpathy-style experiment loop into init/test/run commands for projects with explicit evaluation scripts and git rollback.
- [Artificial General Research](https://github.com/JoaquinMulet/Artificial-General-Research) - Optimization framework: turns measurable code optimization tasks into autoresearch loops with variance-aware acceptance, artifact detection, and exhausted-approach tracking.
- [autoresearch-engram](https://github.com/tonitangpotato/autoresearch-engram) - Memory extension: adds persistent recall, pattern extraction, and reflection steps to Karpathy's autoresearch so the agent remembers what worked across long runs.
- [pi-autoresearch](https://github.com/davebcn87/pi-autoresearch) - pi extension: generalizes Karpathy's autoresearch into experiment tools, a live dashboard, and slash-command skills for metric-driven optimization beyond ML.
- [openclaw-autoresearch](https://github.com/gianfrancopiana/openclaw-autoresearch) - OpenClaw plugin: ports pi-autoresearch to OpenClaw with pending-run enforcement, confidence scoring, checkpoint files, and git-backed keep/discard semantics.
- [autoresearch-opencode](https://github.com/dabiggm0e/autoresearch-opencode) - OpenCode skill: ports pi-autoresearch into OpenCode as a pure skill that logs JSONL experiment runs and resumes autonomous keep/discard loops with built-in tools.
- [pi-autoresearch-studio](https://github.com/jhochenbaum/pi-autoresearch-studio) - pi control plane: adds TUI and web dashboards, plan and ideas editing, and selective PR creation on top of pi-autoresearch sessions.
- [autoresearch-gen](https://github.com/liviaellen/autoresearch-gen) - Scaffold generator: interviews the user, generates a verified autoresearch experiment scaffold, auto-runs the baseline, and repairs broken generated code before handoff to the agent.
- [autoresearch-autoresearch](https://github.com/cavit99/autoresearch-autoresearch) - Meta-autoresearch repo: maintains a portable canonical loop distilled from karpathy/autoresearch and adjacent systems so new evidence can update a reusable agent-verifier architecture across domains.
- [Bilevel Autoresearch](https://github.com/EdwardOptimization/Bilevel-Autoresearch) - Meta-autoresearch framework: adds outer loops that rewrite autoresearch search mechanisms themselves and reports multi-run gains on Karpathy's training benchmark.
- [SkyPilot parallel autoresearch](https://blog.skypilot.co/scaling-autoresearch/) - GPU infrastructure: gives Karpathy's autoresearch access to 16 GPUs so the agent can run parallel experiment waves, validate winners on faster hardware, and reach about 910 runs in about 8 hours.
- [serverless-autoresearch](https://github.com/roboco-io/serverless-autoresearch) - SageMaker infrastructure: parallelizes Karpathy's autoresearch on Spot training jobs so the agent evaluates `train.py` candidates with HUGI-style burst compute instead of paying for idle GPUs.
