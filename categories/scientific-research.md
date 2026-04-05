# Scientific Research

Use this category for examples where autoresearch is applied to scientific discovery, experimentation, paper generation, or benchmark-driven research workflows.

## Submission format

```md
- [Name](URL) - Industry: one-sentence description of the autoresearch use case.
```

## Entries

- [AutoResearchClaw](https://github.com/aiming-lab/AutoResearchClaw) - Scientific research: turns a research idea into a paper through a fully autonomous multi-stage pipeline with self-healing experiments and pivot/refine loops.
- [Sibyl Research System](https://github.com/Sibyl-Research-Team/AutoResearch-SibylSystem) - Scientific research: builds a fully autonomous AI scientist on Claude Code with inner research-iteration loops and outer self-evolution across projects.
- [autoresearch-rl](https://github.com/vivekvkashyap/autoresearch-rl) - RL research: applies the autoresearch pattern to RL post-training by iterating on one training config, running fixed-time experiments, and keeping only eval improvements.
- [autoresearch-robotics](https://github.com/jellyheadandrew/autoresearch-robotics) - Robotics research: adapts Karpathy-style autoresearch to MuJoCo and Gymnasium robotics tasks by editing one training file, evaluating fixed-budget runs, and using simulator renderings plus vision feedback to keep only better policies.
- [Tinker-Explorer](https://github.com/mohammed840/autoresearch-explorer) - Evidence-retrieval research: adapts the autoresearch pattern to GRPO document exploration, comparing reward designs and keeping only retrieval policies that answer multihop questions more accurately under a token budget.
- [Autoresearch on an old research idea](https://ykumar.me/blog/eclip-autoresearch/) - Multimodal retrieval research: applies Claude Code autoresearch to an old eCLIP idea, running 42 fixed-budget experiments with commit/revert decisions and cutting mean rank from 344.68 to 157.43.
- [autoresearch@home](https://ensue.dev/blog/autoresearch-at-home/) - Distributed ML research: coordinates agents that run 5-minute training experiments, publish results to shared memory, and collectively improve a language model across contributed GPUs.
- [autoresearch-paper-benchmark](https://github.com/roth-andreas/autoresearch-paper-benchmark) - Graph ML research: runs paper-driven campaigns on a fixed Peptides-func benchmark by editing `train.py`, logging 300-second experiments, and testing only the best validation-AP model at campaign end.
- [autoresearch-cifar10](https://github.com/GuillaumeErhard/autoresearch-cifar10) - Vision research: applies autoresearch to CIFAR-10 ResNet training on a 3090, iterating under fixed time budgets and keeping changes that lift accuracy beyond a 91.89% baseline.
- [AutoResearch-GenPose](https://github.com/PeleWang/AutoResearch-GenPose) - Vision research: adapts autoresearch to CIFAR-10 UNet denoising by editing one training file, running fixed 5-minute experiments, and keeping only val_psnr improvements.
