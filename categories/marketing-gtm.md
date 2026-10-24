# Marketing & GTM

Use this category for examples where autoresearch improves marketing measurement or go-to-market execution - attribution models, channel spend, scoring the campaigns and pipelines that decide where commercial effort goes.

## Submission format

```md
- [Name](URL) - Industry: one-sentence description of the autoresearch use case.
```

## Entries

- [mmm-research](https://github.com/lucianfialho/mmm-research) - Marketing attribution: applies the autoresearch loop to Marketing Mix Modeling across roughly 137 experiments, taking holdout WAPE from a 2.73% OLS baseline to 0.23% against Google Meridian's 4.04%.
- [gtm-autoresearch](https://github.com/mazorda/gtm-autoresearch) - SaaS go-to-market: reproducible experiments over a JSON scoring spec - change feature weights, evaluate, keep only improvements and record every candidate - with integer hill-climbing as the default optimizer and no LLM in the loop.
- [GTM Command Center](https://github.com/Organized-AI/gtm-command-center) - Go-to-market operations: pairs an impact map and a 3D container graph with an autoresearch loop that keeps improving the model behind them.
- [gtm-autoresearch](https://github.com/Organized-AI/gtm-autoresearch) - Go-to-market containers: a Karpathy-style loop that mutates GTM container configuration, scores the result structurally, and keeps only the variants that improve it.
- [swarma](https://github.com/glitch-rabin/swarma) - Growth experiments: agent teams run a GROWS cycle of hypothesis, experiment, signal, verdict and playbook, where a separate model scores each output and a result is kept above +20% against baseline and discarded below -20%.
