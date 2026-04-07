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
- [autoresearch — Heuristic CP Edition](https://github.com/garipovroma/autoresearch-heuristic) - Heuristic solver optimization: adapts autoresearch to C++ competitive-programming solvers by editing only `solver.cpp`, scoring fixed benchmark instances, and keeping only lower average solution costs.
- [Autoresearch for game development](https://github.com/Centipede5/autogamestudio) - HTML5 Game Development: Runs agents to build better games based on player feedback and usage metrics, benchmarks using game ELO in 1/1 matchups.
- [SiliconSwarm@Ensue](https://www.ensue-network.ai/lab/ane) - Apple Silicon inference optimization: uses a multi-agent autoresearch loop to test ANE graph changes across chips and reports up to 6.31× lower median DistilBERT latency than CoreML.
- [Flash-MoE](https://github.com/gorroai/flash-moe) - Apple Silicon inference optimization: uses a Claude Code autoresearch loop to run 43 Metal optimization experiments on Qwen3.5-397B and reach 20.34 tok/s on an M5 Max by overlapping SSD reads with GPU compute.
- [Rails controller tuning with Claude Code /loop autoresearch](https://zenn.dev/dely_jp/articles/3117e590465e38) - Backend performance optimization: adapts Karpathy's keep/discard loop to Rails controller latency by locking benchmark scripts and test data, running 10-minute cycles, and auto-reverting regressions.
- [Pytest speedups via autoresearch feedback loops](https://blog.serverworks.co.jp/2026/03/30/153209) - Test performance optimization: applies autoresearch to a backend pytest suite with a fixed evaluation harness, seven autonomous experiments, and a 295s → 71s keep/discard improvement path.
- [autoresearch-sudoku](https://github.com/Rkcr7/autoresearch-sudoku) - Solver optimization: uses an enhanced autoresearch loop to rewrite a Rust sudoku solver over 312 experiments and beat Tdoku plus rust_sudoku on 4 of 6 standard benchmark datasets.
- [autospec](https://github.com/jeongph/autospec) - Backend service generation: applies an autoresearch-inspired keep-or-revert loop to natural-language business rules, iteratively building a Spring Boot service until Gradle and JUnit evaluation pass without regression.
- [How I used autoresearch to fix Gumroad's flaky tests in a week](https://gumroad.com/blog/p/how-i-used-autoresearch-to-fix-gumroad-s-flaky-tests-in-a-week) - Test reliability: uses OpenClaw autoresearch to run 206 commits and 94 CI cycles that fixed 13 flaky tests while surfacing a real file-ID remapping bug.
- [WinMoE](https://github.com/idan82labs/WinMoE) - Windows inference optimization: uses an AI-driven autoresearch methodology with one-change measurements and keep-or-reject ledgers to lift Qwen3.5-397B throughput from 0.44 to 1.9 tok/s on consumer hardware.
- [ZK Autoresearch — Plonky3 DFT Optimizer](https://github.com/Barnadrot/zk-autoresearch) - ZK prover optimization: applies Karpathy's autoresearch pattern to Plonky3's DFT code, running Rust tests plus Criterion benchmarks and keeping only commits that reduce `coset_lde_batch` time on BabyBear field workloads.
- [autoresearch-go-ane](https://github.com/tmc/autoresearch-go-ane) - Apple Silicon training optimization: ports Karpathy's loop to a Go plus ANE LLM trainer, benchmarking fixed 5-minute TinyStories runs with `benchstat` and keeping only lower `val_loss` configurations.
