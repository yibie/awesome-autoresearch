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
- [AutonomousTester](https://github.com/executeautomation/autoresearch_playwright) - UI testing evaluation: adapts autoresearch to Playwright test generation by editing only `tests/test_suite.py`, measuring `coverage_score`, and auto-fixing or discarding test changes until coverage improves.
- [Autoresearch for Agents from Scratch](https://github.com/rungalileo/autoresearch-for-agents) - Support-agent prompt evaluation: applies Karpathy's keep/revert loop to `system_prompt.md`, scoring frozen adversarial support cases by tool-call accuracy and lifting the prompt from 0.05 to 0.80 over 15 experiments.
- [LLM Privacy + Cost Router — Classifier Experiment](https://github.com/clawdbotags/llm-privacy-classifier) - Privacy classification evaluation: runs a Karpathy-style autoresearch experiment across regex and prompt variants for a hybrid LLM privacy classifier, validating the best configuration at 96.7% holdout accuracy with 4.6% false negatives.
- [AutoMemory](https://github.com/Shelter41/automemory) - Agent memory evaluation: lets an agent rewrite its own memory system against LongMemEval, using an immutable evaluator over random question samples and iterating on code plus strategy notes in response to scored failures.
- [How to stop your autoresearch loop from cheating](https://www.cerebras.ai/blog/how-to-stop-your-autoresearch-loop-from-cheating) - Autoresearch evaluation hardening: reports 71 experiments across nanochat training and MoE compression, showing loops drift quickly unless experiments are isolated and evaluator gates block shortcut gains.
- [Autoreason](https://github.com/NousResearch/autoreason) - Output evaluation: extends Karpathy-style autoresearch to subjective writing and coding tasks by running incumbent-versus-revision-versus-synthesis tournaments under blind multi-judge Borda scoring and stopping only when the unchanged version wins twice, outperforming standard self-refinement baselines on writing tasks and 150 CodeContests problems.
- [AutoResearchBench](https://github.com/CherYou/AutoResearchBench) - Evaluation benchmark: a dedicated benchmark for autonomous scientific literature discovery with complementary deep and wide research tasks, showing that even the most powerful LLMs achieve only ~9% accuracy on literature-focused open-ended search.
- [Jailbreak Autoresearch](https://github.com/davidondrej/jailbreak-autoresearch) - Jailbreak red-teaming: applies Karpathy's autoresearch loop to prompt-harness experiments, testing different header and footer harnesses against a fixed body and scoring responses against a rubric to find more effective jailbreak strategies.
- [JustAsk](https://github.com/x-zheng16/JustAsk) - System prompt extraction: uses autoresearch-style curiosity-driven code agents to iteratively probe and reveal system prompts from frontier LLMs, accepted at ICML 2026.
