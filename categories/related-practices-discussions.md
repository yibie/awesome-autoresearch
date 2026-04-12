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

### Business / GTM workflows

- [Brandon Pizzacalla on applying Karpathy's autoresearch pattern to cold email](https://x.com/bpizzacalla/status/2039233818994102609) - X: describes a single-agent loop that tests cold-email variants on live reply-rate metrics, commits winners as the new baseline, and stops at convergence.

### Prompt / evaluation

- [Aakash Gupta on eval design as the make-or-break constraint in autoresearch](https://x.com/aakashgupta/status/2039204610569544027) - X: argues that autoresearch only transfers cleanly when the evaluator is binary, locked, compact, and specific enough to resist gaming.
- [How to stop your autoresearch loop from cheating](https://www.cerebras.ai/blog/how-to-stop-your-autoresearch-loop-from-cheating) - Blog: reports 71 autoresearch experiments across training optimization and model compression, showing loops drift within hours unless evaluation is strict, experiments are isolated, and metrics block shortcut gains.
- [野口寛士 on nightly autoresearch-style improvement runs on a Mac mini](https://x.com/kan_guchi/status/2042052394130063742) - X: says his team lets a Mac mini run overnight improvement experiments, accepted 20 automatic wins in one night, and found success-metric definition matters more than experiment volume.
- [Ali Amiri on matching Claude Code quality by optimizing prompts with AutoResearch](https://x.com/iampatten/status/2038755598981038193) - X: describes using AutoResearch to tune prompts and push a Qwen-based workflow from weak to strong performance on a large-repo task.
- [Clement Hoang on Headway using autoresearch for mental-health-agent prompts](https://x.com/im_clemmy/status/2043126515605622960) - X: reports that Headway used Karpathy's autoresearch to run about 80 generate → evaluate → analyze → mutate iterations on mental-health-agent prompts and reach 99% accuracy against a 95% target.
- [Ren on benchmark-driven skill optimization with autoresearch](https://x.com/liliIiiI1I7/status/2038528225916424395) - X: Chinese discussion noting that autoresearch can be paired with skill creation so agents define a benchmark and then iteratively optimize the skill against it.
- [Aakash Gupta on porting autoresearch to prompt engineering](https://x.com/aakashgupta/status/2038132294817656978) - X: describes mapping autoresearch into a four-role prompt-optimization loop with a locked eval script, binary rubric, results log, and overnight iteration.
- [SonnyClawAI on adversarial second-pass evals in autoresearch](https://x.com/SonnyClawAI/status/2041657267766894777) - X: reports that a 4-hour write → eval → revise → measure loop only surfaced real failures after adding a second adversarial evaluation pass, making evaluator disagreement itself the useful signal.
- [Barna on benchmark-coupled correctness gates for zk-autoresearch](https://x.com/realbarnakiss/status/2039725945003585754) - X: reports adding a benchmark-scale bitwise validator and nondeterminism detection because small upstream tests missed bugs that only appeared at the exact workload being optimized.
- [vincent_dalmaso on treating skills like products with autoresearch](https://x.com/vincent_dalmaso/status/2041786712834105484) - X: describes running an autoresearch-skill loop with a baseline, one change at a time, and score-based keep decisions to improve skill behavior instead of rewriting prompts blindly.
- [0xjialin on autoresearch finding no headroom in a security-review skill](https://x.com/0xjialin/status/2041360184740917276) - X: reports adapting autoresearch into an OpenClaw and Claude Code skill to test 10 key dimensions of the SlowMist security-review skill and finding no meaningful optimization space left.

### Software / code workflows

- [0xViviennn on adapting autoresearch to GitHub engineering workflows](https://x.com/0xViviennn/status/2038657899963281725) - X: describes a Chinese engineering adaptation of autoresearch with verifier-gated code cleanup, bug fixing, test additions, and rollback across numbered cycles.
- [Dominic Elm on the three-file autoresearch loop](https://x.com/elmd_/status/2038724362899968047) - X: summarizes autoresearch as propose → train → check → keep or revert → repeat and frames the instruction file as the new bottleneck.
- [Franci Penov on running overnight queues of autoresearch experiments](https://x.com/francip/status/2038777280995246087) - X: describes operating multiple machines that run queued autoresearch experiments, logs, summaries, and findings overnight.
- [xfu on AutoResearch bug-finding persistence](https://x.com/xfubot/status/2038808623774884250) - X: short Chinese observation that autoresearch is unusually strong at repeatedly hunting hidden bugs until it finds them.
- [Kyle Boddy on using autoresearch-claude-code to tune inference hardware parameters](https://x.com/drivelinekyle/status/2038673905368650194) - X: describes using an autoresearch Claude Code setup to tune testing inference machine parameters on 3090-based hardware.
- [chenhua_zhang on autoresearching Claude Code configuration](https://x.com/chenhua_zhang/status/2043010543112290815) - X: describes a 9-round benchmark-driven search over six seed configurations and three greedy mutations, using isolated worktrees to optimize Claude Code settings against code-quality regressions.
- [Shann Holmberg on setting up autoresearch with Claude Code](https://x.com/shannholmberg/status/2038282051225608613) - X: tutorial thread that frames autoresearch as one file, one metric, and autonomous keep/revert looping inside Claude Code.
- [Bob on autoresearch wasting 11 days on a solved benchmark](https://x.com/TimeToBuildBob/status/2039204620774314504) - X: highlights that a loop can stay mechanically healthy yet keep burning compute after metric saturation if it lacks usefulness-aware stop criteria.
- [Doğaç on GPU-kernel autoresearch needing human nudges and repeated validation](https://x.com/dogacel0/status/2037933914879058095) - X: argues that human steering and rerunning experiments help autoresearch escape local minima and debunk noisy wins in kernel optimization.
- [Barna on model exhaustion signals in zk-autoresearch](https://x.com/realbarnakiss/status/2042244046651793832) - X: reports that once Sonnet kept circling previously eliminated NTT ideas in the iteration memory, he treated that repetition as an exhaustion signal and switched models.
- [Isaac Kargar on using autoresearch to improve another AI agent](https://x.com/kargarisaac/status/2042312695408722417) - X: reports giving Claude Code one agent's codebase, running 24 keep/discard experiments, improving memory quality by 41%, and later refactoring after the loop showed the original bottleneck hypothesis was wrong.
- [Google hit: “Karpathy's autoresearch applied to debugging”](https://www.reddit.com/r/ClaudeAI/comments/1rvbhk3/karpathys_autoresearch_applied_to_debugging_two/) - Reddit: discussion thread about adapting the autoresearch pattern to debugging and validation-driven repair loops.
- [Google hit: “Autoresearch with Claude on a real codebase (not ML)”](https://www.reddit.com/r/ClaudeAI/comments/1s22f7d/autoresearch_with_claude_on_a_real_codebase_not/) - Reddit: discussion thread about applying the autoresearch pattern to a production codebase rather than an ML training script.
- [Google hit: “I used Karpathy's autoresearch pattern on product workflows”](https://www.reddit.com/r/ClaudeCode/comments/1s2e8ny/i_used_karpathys_autoresearch_pattern_on_product/) - Reddit: discussion thread suggesting the autoresearch loop is being adapted into broader product and self-improving agent workflows.
- [Google hit: “Autoresearch with Claude on a real codebase (not ML training)”](https://www.reddit.com/r/BlackboxAI_/comments/1s2qs1i/autoresearch_with_claude_on_a_real_codebase_not/) - Reddit: discussion thread emphasizing high failure rates and many discarded experiments as normal when autoresearch is applied to real production codebases.
- [Google hit: “I adapted Karpathy's autoresearch to build an auto-improvement loop for agentic coding skills”](https://www.reddit.com/r/ClaudeAI/comments/1s3feaa/i_adapted_karpathys_autoresearch_to_build_an/) - Reddit: discussion thread about applying the autoresearch loop to iterative improvement of coding-agent skills.
- [vdaubry on generalizing autoresearch beyond codebases](https://x.com/vdaubry/status/2033530230011216065) - X: argues that the core autoresearch pattern can generalize from code optimization to load testing, landing page A/B tests, and infrastructure tuning when the benchmark is clear.
- [Alex C. on turning autoresearch into a bounded debugging loop skill](https://x.com/alexcovo_eth/status/2030899247470567534) - X: describes deriving a bounded-experiment-loop skill from autoresearch and using it to improve agent debugging and code fixing.
- [kavindpadi on using pi-autoresearch for SQL optimization](https://x.com/kavindpadi/status/2041727544530235899) - X: describes trying pi-autoresearch on intentionally inefficient BigQuery SQL and suggests the same metric-driven loop can target top-cost warehouse queries under platform-specific pricing constraints.

### Scientific / research augmentation

- [Makoto Tanji on Karpathy's AutoResearch](https://x.com/tan_z_tan/status/2038794997701726668) - X: explains Karpathy's autoresearch as an evolutionary search loop and highlights emerging multi-agent and parallel extensions.
- [Duy Nguyen on Karpathy, Tobi, and generalized autoresearch loops](https://x.com/goon_nguyen/status/2038764906284294428) - X: summarizes autoresearch as edit → evaluate → keep/discard → repeat and points to its use in both GPT training and Shopify Liquid optimization.
- [Darian Parrish on smaller autoresearch loops for non-coding tasks](https://x.com/darian_parrish/status/2038739302826529028) - X: mentions adapting the autoresearch pattern beyond coding into other task types.
- [Ilya on adapting autoresearch to energy-demand peak prediction](https://x.com/ilyaXindy/status/2038604642121093474) - X: describes packaging a custom scorer and composite metric so Claude Code could autoresearch seasonal calibrations and threshold interactions for energy demand prediction.
- [Google hit: “I built an autonomous ML agent that runs experiments on tabular data indefinitely”](https://www.reddit.com/r/MachineLearning/comments/1s73gma/p_i_built_an_autonomous_ml_agent_that_runs/) - Reddit: discussion thread describing a Claude Code setup that applies autoresearch loops to churn and conversion tabular tasks by iterating on features, models, and hyperparameters until gains plateau.
- [Dan Woods on using autoresearch plus Apple's "LLM in a Flash" to run Qwen3.5-397B locally](https://x.com/danveloper/status/2033940227736100873) - X: says Claude Code used Karpathy's autoresearch setup plus Apple's "LLM in a Flash" paper to get Qwen3.5-397B running on a 48 GB M3 Max MacBook.
- [Joe Harris on building the same autoresearch idea for robotics teams](https://x.com/_joe_harris_/status/2030803838501073026) - X: claims his team built an analogous loop for robotics teams to automate experiment plumbing, debugging, and iteration around harder physical-world workflows.
- [David Gasquez on using the autoresearch idea in ML competitions](https://x.com/davidgasquez/status/2030946939836022886) - X: says the benchmark-driven autoresearch pattern worked in a couple of ML competition settings and generalizes to scored tasks like retrieval, AUC, and performance tuning.

### Infra / benchmarking ideas

- [Versur on bringing autoresearch-style loops to Grasshopper solver workflows](https://x.com/VersurAi/status/2037877185210372372) - X: describes using candidate generation, fixed benchmarks, scoring, and keep-only-if-improved loops for computational design experiments.
- [Google hit: “Autoresearch-style framework for improving heuristics”](https://www.reddit.com/r/optimization/comments/1s3aohf/autoresearchstyle_framework_for_improving/) - Reddit: discussion thread about applying autoresearch-style benchmarked improvement loops to optimization heuristics under strict solver budgets.
- [Google hit: HN thread on applying autoresearch to LLM inference](https://news.ycombinator.com/item?id=47538380) - Hacker News: discussion pointing to autoresearch-style ideas being adapted from model training to LLM inference optimization.
- [AutoResearch vs Classical Hyperparameter Tuning](https://www.weco.ai/blog/autoresearch-vs-classical-hpo) - Blog: reports a NanoChat head-to-head where autoresearch beats Optuna on sample efficiency, cost-adjusted results, and longer-horizon generalization by escaping a fixed search space.
- [Autoresearch Hub](https://news.ycombinator.com/item?id=47374572) - Hacker News: Karpathy describes an unreleased swarm design where trusted workers verify improvements from a larger untrusted pool to parallelize autoresearch with leaderboard-style proof of progress.
