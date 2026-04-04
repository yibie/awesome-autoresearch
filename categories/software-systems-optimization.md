# Software / Systems Optimization

Use this category for examples where autoresearch improves code, kernels, models, or systems through repeated benchmarking, verification, and keep/revert loops.

## Submission format

```md
- [Name](URL) - Industry: one-sentence description of the autoresearch use case.
```

## Entries

- [karpathy/autoresearch](https://github.com/karpathy/autoresearch) - ML training optimization: the original autoresearch loop where an agent edits a GPT training script, runs fixed-time experiments, and keeps only improvements in validation bits-per-byte.
- [AutoKernel](https://github.com/RightNow-AI/autokernel) - GPU optimization: applies Karpathy-style autoresearch to kernel bottlenecks, iterating on code, benchmarking, and keeping only changes that improve speed without breaking correctness.
- [autoresearch-webgpu](https://github.com/lucasgelfond/autoresearch-webgpu) - Browser ML optimization: ports Karpathy's autoresearch into the browser so agents can generate training code, run GPU-backed experiments, and feed losses back into the next iteration.
- [autoresearch-local-llm](https://github.com/SohniSwatantra/autoresearch-local-llm) - Local ML optimization: replaces Claude Code with a local Qwen model to run the standard autoresearch keep/revert loop on a shared single GPU.
- [Shopify Liquid performance work via autoresearch](https://simonwillison.net/2026/Mar/13/liquid/) - Software optimization: Tobi Lütke applied an autoresearch loop to Shopify's Liquid template engine, producing 93 automated commits that improved parse+render performance by 53% with 61% fewer allocations.
- [Autoresearch for SAT Solvers](https://github.com/iliazintchenko/agent-sat) - SAT solver optimization: runs parallel MaxSAT experiments, updates reusable solver code plus expert memory, and improves public benchmark configurations against 2024 competition baselines.
- [Autoresearch for game development](https://github.com/Centipede5/autogamestudio) - HTML5 Game Development: Runs agents to build better games based on player feedback and usage metrics, benchmarks using game ELO in 1/1 matchups.
