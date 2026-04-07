# Evaluation / Red Teaming

Use this category for examples where autoresearch is used to attack, evaluate, harden, or iteratively improve systems based on measurable test results.

## Submission format

```md
- [Name](URL) - Industry: one-sentence description of the autoresearch use case.
```

## Entries

- [Claudini](https://github.com/romovpa/claudini) - AI safety research: uses an autoresearch-style loop to invent and benchmark new LLM attack algorithms, keeping only methods that outperform baselines.
- [autovoiceevals](https://github.com/ArchishmanSengupta/autovoiceevals) - Voice AI evaluation: attacks voice agents with adversarial callers, proposes prompt changes one at a time, and keeps or reverts them based on eval results.
- [autoresearch-prompt-optimization](https://github.com/az9713/autoresearch-prompt-optimization) - Prompt evaluation: applies the autoresearch loop to a fixed extraction benchmark, iteratively editing one prompt and keeping only accuracy gains on the eval set.
- [We Used Autoresearch on Our AI Skill, It Taught Us to Write Better Tests](https://langfuse.com/blog/2026-03-24-optimizing-ai-skill-with-autoresearch) - AI skill evaluation: runs a prompt-migration skill against six fixed codebase test cases, scores each change on correctness, completeness, and efficiency, and keeps only improvements while cherry-picking around harness overfit.
- [AutoPrompter](https://github.com/gauravvij/AutoPrompter) - Prompt evaluation: combines promptfoo-style metrics with autoresearch-style closed-loop iteration, generating datasets, testing target models, and refining prompts through a persistent experiment ledger.
