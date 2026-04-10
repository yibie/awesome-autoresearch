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
- [autoresearch-at-home](https://github.com/mutable-state-inc/autoresearch-at-home) - Distributed ML research: coordinates a SETI@home-style swarm of agents that claim experiments, share full `train.py` results through Ensue, and collectively drive down val_bpb across different GPUs.
- [autoresearch-paper-benchmark](https://github.com/roth-andreas/autoresearch-paper-benchmark) - Graph ML research: runs paper-driven campaigns on a fixed Peptides-func benchmark by editing `train.py`, logging 300-second experiments, and testing only the best validation-AP model at campaign end.
- [autoresearch-cifar10](https://github.com/GuillaumeErhard/autoresearch-cifar10) - Vision research: applies autoresearch to CIFAR-10 ResNet training on a 3090, iterating under fixed time budgets and keeping changes that lift accuracy beyond a 91.89% baseline.
- [AutoResearch-GenPose](https://github.com/PeleWang/AutoResearch-GenPose) - Vision research: adapts autoresearch to CIFAR-10 UNet denoising by editing one training file, running fixed 5-minute experiments, and keeping only val_psnr improvements.
- [autoresearch-medimage](https://github.com/mattlungrenmd/autoresearch-medimage) - Medical imaging research: adapts Karpathy's `prepare.py` + `train.py` + `results.tsv` loop to 2D imaging tasks, using short-budget candidate discovery and staged follow-up validation to surface stronger ChestXray14 models.
- [fe-autoresearch](https://github.com/ezemriv/fe-autoresearch) - Tabular ML research: applies the autoresearch loop to LightGBM feature engineering on the UCI Bank Marketing dataset by editing one `engineer_features()` target, training against fixed AUC metrics, and keeping only improvements.
- [Paper Lantern improves Autoresearch](https://www.paperlantern.ai/blog/auto-research-case-study) - ML research augmentation: connects a 2M-paper MCP server to autoresearch, letting the agent cite 100 papers across 100 experiments and reach a 3.2% lower 2-hour validation loss than the same run without paper access.
- [Subtractive Search in a Mature Tabular Pipeline](https://github.com/jhamandeep/autoresearch-tabular-case-study) - Tabular ML research: applies Karpathy's autoresearch to a churn-prediction XGBoost pipeline, running 116 autonomous experiments and lifting subsample AUC from 0.902892 to 0.916721 largely by removing noisy target-encoded features.
- [autoresearch-connect4](https://github.com/alessoh/autoresearch-connect4) - Game AI research: adapts Karpathy's three-file autoresearch loop to Connect Four by editing `train.py`, training 5-minute self-play runs, and keeping only changes that improve weighted win rate against fixed opponents.
- [autoresearch-tabular](https://github.com/saikatkumardey/autoresearch-tabular) - Tabular ML research: adapts Karpathy's three-file loop to the Adult Income benchmark by editing only `train.py`, running fixed 2-minute experiments, and keeping only `val_auc` improvements.
- [ocr-autoresearch](https://github.com/zhd36/ocr-autoresearch) - OCR research: adapts autoresearch to ICDAR2015 scene-text recognition by editing one `train.py`, running fixed 5-minute CRNN+CTC experiments, and keeping only lower validation character error rates.
- [Tennis XGBoost Autoresearch](https://github.com/buildoak/tennis-xgboost-autoresearch) - Sports analytics research: applies a Karpathy-style keep/revert loop to a 245K-match tennis XGBoost pipeline, then hardens the evaluator after the agent learned to game mutable ROC-AUC scoring.
- [Bio-Autoresearch](https://github.com/monk1337/Bio-Autoresearch) - Drug discovery research: applies a Karpathy-style autoresearch loop to rare-disease drug repurposing on PrimeKG, running 15 GPU experiments with keep/revert decisions and lifting held-out per-disease AUPRC from 0.284 to 0.761.
- [autoresearch-quantum](https://github.com/saymrwulf/autoresearch-quantum) - Quantum research: runs incumbent/challenger autoresearch ratchets for encoded magic-state experiments, screens candidates on cheap noisy simulations, and promotes only justified challengers to expensive backends while logging transferable lessons.
- [kaggle-autoresearch](https://github.com/aplassard/kaggle-autoresearch) - Tabular ML research: adapts Karpathy-style autoresearch to Kaggle competitions such as Titanic, House Prices, and Store Sales by iterating on feature and model code, logging approved baselines, and accepting only cross-validation improvements over fixed thresholds.
