# Related Practices / Discussions

Use this page for **public but non-code evidence** of autoresearch in the wild: X threads, forum posts, interviews, and write-ups that describe real practice or emerging usage patterns but do not yet point to a strong open-source repository or standalone case page.

## Inclusion rule

Only include items that are still **directly about autoresearch**:

- explicitly mention `autoresearch`
- explicitly cite Karpathy's autoresearch
- or clearly describe a modify → verify → keep/discard → repeat loop

This page is for **discussion evidence**, not for generic AI commentary.

## Submission format

```md
- [Name or thread title](URL) - Source/platform: one-sentence description of the autoresearch-related practice or discussion.
```

## Entries

### Trading / markets

- [mary on adapting autoresearch into AutoPredict for prediction markets](https://x.com/howdymerry/status/2037683950085378240) - X: describes a framework that applies evaluation + mutation + selection loops to prediction-market trading agents across weather, finance, and politics.
- [0xAggelos on overnight autoresearch across multiple exchanges](https://x.com/0xAggelos/status/2035762307196666153) - X: claims to apply Karpathy's autoresearch pattern to trading strategy research across exchanges and symbols with thousands of experiments and no manual tuning.
- [alex on verifier-driven autoresearch loops for Amazon seller workflows](https://x.com/nospicyplease_/status/2035682307483259073) - X: argues that verifier-driven autoresearch loops fit PPC, catalog, and ASIN-level decisions better than peer-consensus swarms because proposals are kept only when the evaluator approves them.
- [Brandon Pizzacalla on agentic paid ads systems based on Karpathy autoresearch](https://x.com/bpizzacalla/status/2038731009051824318) - X: claims to use Karpathy-style autoresearch as the planning and experiment pattern behind autonomous paid-ads workflows.

### Prompt / evaluation

- [Ali Amiri on matching Claude Code quality by optimizing prompts with AutoResearch](https://x.com/iampatten/status/2038755598981038193) - X: describes using AutoResearch to tune prompts and push a Qwen-based workflow from weak to strong performance on a large-repo task.
- [Ren on benchmark-driven skill optimization with autoresearch](https://x.com/liliIiiI1I7/status/2038528225916424395) - X: Chinese discussion noting that autoresearch can be paired with skill creation so agents define a benchmark and then iteratively optimize the skill against it.
- [Google hit: “I plugged a 2M-paper research index into autoresearch”](https://www.reddit.com/r/LocalLLM/comments/1s4i1y6/i_plugged_a_2mpaper_research_index_into/) - Reddit: discussion thread about augmenting autoresearch with a large paper index to improve method selection and benchmark-aware implementation choices.

### Software / code workflows

- [0xViviennn on adapting autoresearch to GitHub engineering workflows](https://x.com/0xViviennn/status/2038657899963281725) - X: describes a Chinese engineering adaptation of autoresearch with verifier-gated code cleanup, bug fixing, test additions, and rollback across numbered cycles.
- [Dominic Elm on the three-file autoresearch loop](https://x.com/elmd_/status/2038724362899968047) - X: summarizes autoresearch as propose → train → check → keep or revert → repeat and frames the instruction file as the new bottleneck.
- [Franci Penov on running overnight queues of autoresearch experiments](https://x.com/francip/status/2038777280995246087) - X: describes operating multiple machines that run queued autoresearch experiments, logs, summaries, and findings overnight.
- [xfu on AutoResearch bug-finding persistence](https://x.com/xfubot/status/2038808623774884250) - X: short Chinese observation that autoresearch is unusually strong at repeatedly hunting hidden bugs until it finds them.
- [Kyle Boddy on using autoresearch-claude-code to tune inference hardware parameters](https://x.com/drivelinekyle/status/2038673905368650194) - X: describes using an autoresearch Claude Code setup to tune testing inference machine parameters on 3090-based hardware.
- [Shann Holmberg on setting up autoresearch with Claude Code](https://x.com/shannholmberg/status/2038282051225608613) - X: tutorial thread that frames autoresearch as one file, one metric, and autonomous keep/revert looping inside Claude Code.
- [Google hit: “I generalized Karpathy's autoresearch into a skill for Claude Code”](https://www.reddit.com/r/ClaudeAI/comments/1s1qa97/i_generalized_karpathys_autoresearch_into_a_skill/) - Reddit: discussion thread describing a generalized Claude Code autoresearch skill beyond ML-specific workflows.
- [Google hit: “Karpathy's autoresearch applied to debugging”](https://www.reddit.com/r/ClaudeAI/comments/1rvbhk3/karpathys_autoresearch_applied_to_debugging_two/) - Reddit: discussion thread about adapting the autoresearch pattern to debugging and validation-driven repair loops.
- [Google hit: “Autoresearch with Claude on a real codebase (not ML)”](https://www.reddit.com/r/ClaudeAI/comments/1s22f7d/autoresearch_with_claude_on_a_real_codebase_not/) - Reddit: discussion thread about applying the autoresearch pattern to a production codebase rather than an ML training script.
- [Google hit: “I used Karpathy's autoresearch pattern on product workflows”](https://www.reddit.com/r/ClaudeCode/comments/1s2e8ny/i_used_karpathys_autoresearch_pattern_on_product/) - Reddit: discussion thread suggesting the autoresearch loop is being adapted into broader product and self-improving agent workflows.
- [Google hit: “Autoresearch with Claude on a real codebase (not ML training)”](https://www.reddit.com/r/BlackboxAI_/comments/1s2qs1i/autoresearch_with_claude_on_a_real_codebase_not/) - Reddit: discussion thread emphasizing high failure rates and many discarded experiments as normal when autoresearch is applied to real production codebases.
- [Google hit: “I adapted Karpathy's autoresearch to build an auto-improvement loop for agentic coding skills”](https://www.reddit.com/r/ClaudeAI/comments/1s3feaa/i_adapted_karpathys_autoresearch_to_build_an/) - Reddit: discussion thread about applying the autoresearch loop to iterative improvement of coding-agent skills.
- [vdaubry on generalizing autoresearch beyond codebases](https://x.com/vdaubry/status/2033530230011216065) - X: argues that the core autoresearch pattern can generalize from code optimization to load testing, landing page A/B tests, and infrastructure tuning when the benchmark is clear.
- [Alex C. on turning autoresearch into a bounded debugging loop skill](https://x.com/alexcovo_eth/status/2030899247470567534) - X: describes deriving a bounded-experiment-loop skill from autoresearch and using it to improve agent debugging and code fixing.

### Scientific / research augmentation

- [Show HN: Autoresearch@home](https://news.ycombinator.com/item?id=47343935) - Hacker News: presents a collaborative autoresearch effort where agents share GPU resources to improve a language model through a distributed overnight loop.
- [Makoto Tanji on Karpathy's AutoResearch](https://x.com/tan_z_tan/status/2038794997701726668) - X: explains Karpathy's autoresearch as an evolutionary search loop and highlights emerging multi-agent and parallel extensions.
- [Duy Nguyen on Karpathy, Tobi, and generalized autoresearch loops](https://x.com/goon_nguyen/status/2038764906284294428) - X: summarizes autoresearch as edit → evaluate → keep/discard → repeat and points to its use in both GPT training and Shopify Liquid optimization.
- [Darian Parrish on smaller autoresearch loops for non-coding tasks](https://x.com/darian_parrish/status/2038739302826529028) - X: mentions adapting the autoresearch pattern beyond coding into other task types.
- [Ilya on adapting autoresearch to energy-demand peak prediction](https://x.com/ilyaXindy/status/2038604642121093474) - X: describes packaging a custom scorer and composite metric so Claude Code could autoresearch seasonal calibrations and threshold interactions for energy demand prediction.
- [Google hit: “Autoresearch on Qwen3.5-397B, 36 experiments...”](https://www.reddit.com/r/LocalLLaMA/comments/1s7g8ov/autoresearch_on_qwen35397b_36_experiments_to/) - Reddit: discussion thread documenting a concrete autoresearch run with experiment counts and measured throughput on Apple Silicon.
- [Joe Harris on building the same autoresearch idea for robotics teams](https://x.com/_joe_harris_/status/2030803838501073026) - X: claims his team built an analogous loop for robotics teams to automate experiment plumbing, debugging, and iteration around harder physical-world workflows.

### Infra / benchmarking ideas

- [Show HN: Multi-agent autoresearch for ANE inference beats Apple's CoreML by 6×](https://news.ycombinator.com/item?id=47592280) - Hacker News: points to a multi-agent autoresearch system for ANE inference optimization and preserves a public discussion trail around the benchmark claim.
- [Versur on bringing autoresearch-style loops to Grasshopper solver workflows](https://x.com/VersurAi/status/2037877185210372372) - X: describes using candidate generation, fixed benchmarks, scoring, and keep-only-if-improved loops for computational design experiments.
- [Google hit: “Autoresearch-style framework for improving heuristics”](https://www.reddit.com/r/optimization/comments/1s3aohf/autoresearchstyle_framework_for_improving/) - Reddit: discussion thread about applying autoresearch-style benchmarked improvement loops to optimization heuristics under strict solver budgets.
- [Google hit: HN thread on applying autoresearch to LLM inference](https://news.ycombinator.com/item?id=47538380) - Hacker News: discussion pointing to autoresearch-style ideas being adapted from model training to LLM inference optimization.
