# awesome-autoresearch

A curated awesome list of public autoresearch use cases across industries.

This repository focuses on one thing: how autoresearch is actually used in the wild, especially patterns that can transfer across industries.

Sources include public GitHub repositories, X threads, blog posts, and project write-ups. Each entry is intentionally kept to one sentence for fast scanning and contribution.

The repository distinguishes between:
- **main category pages** for stronger case evidence such as repos, project pages, and concrete write-ups
- **Related Practices / Discussions** for credible public practice signals — especially X threads, Reddit discussions, and interviews — that describe real autoresearch usage even when no strong standalone case page exists yet.

## Why this list

Most discussions about autoresearch are still scattered, vague, or overly tool-centric. This list is designed to answer two practical questions quickly:

- Where has autoresearch already been used in real workflows?
- Which patterns can transfer across industries?

This is not a comprehensive database. It is a high-signal, fast-scanning field guide.

## Inclusion criteria

An entry should meet all of the following:

- The source is public and citable.
- The example is **directly related to autoresearch**, not just a generic research or monitoring agent.
- The source explicitly mentions `autoresearch`, cites Karpathy's autoresearch, or clearly shows a modify → verify → keep/discard → repeat loop.
- The summary explains the scenario, method, and value in one sentence.

We do **not** include:

- Generic research agents, monitoring agents, or multi-agent systems with no explicit autoresearch loop.
- Pure theory or opinion without a concrete practice.
- Generic AI commentary with no autoresearch workflow.
- Long write-ups inside the list itself.
- Sources that are private, inaccessible, or too vague to classify.

## Current coverage

This list currently focuses on **high-confidence, direct autoresearch examples only**.

- Scientific Research — 5 entries
- Software / Systems Optimization — 6 entries
- Evaluation / Red Teaming — 4 entries
- Finance / Trading — 4 entries
- Personal Knowledge / Humanities — 2 entries
- Infra / Skills / Forks — 9 entries
- Related Practices / Discussions — 35 entries

Some categories are intentionally still sparse. That is by design: we prefer a small list with strong evidence over a broad list diluted by generic "research agents."

The **Related Practices / Discussions** page is a separate bucket for credible public discussion evidence — especially X threads and interviews — when the practice is clearly autoresearch-related but does not yet have a strong standalone repo or case page.

## Categories

Primary organization is now based on **direct autoresearch application domains**, not generic research automation patterns.

- [Scientific Research](categories/scientific-research.md)
- [Software / Systems Optimization](categories/software-systems-optimization.md)
- [Evaluation / Red Teaming](categories/evaluation-red-teaming.md)
- [Finance / Trading](categories/finance-trading.md)
- [Personal Knowledge / Humanities](categories/personal-knowledge-humanities.md)
- [Infra / Skills / Forks](categories/infra-skills-forks.md)
- [Related Practices / Discussions](categories/related-practices-discussions.md)

## How to read this repository

- Start with the **main category pages** if you want the strongest direct examples.
- Use **Infra / Skills / Forks** if you want the tooling, ports, and operator layer around autoresearch.
- Use **Related Practices / Discussions** if you want earlier public signals of real-world adoption before they mature into stronger standalone case pages.

## Submission format

Use exactly one line per entry:

```md
- [Name](URL) - Industry: one-sentence description of the autoresearch use case.
```

Examples:

```md
- [AutoKernel](https://example.com) - GPU optimization: applies Karpathy-style autoresearch to kernel bottlenecks, benchmarking each change and keeping only verified speedups.
- [Claudini](https://example.com) - AI safety research: uses an autoresearch-style loop to discover and benchmark stronger LLM attack algorithms.
- [Autoresearch Genealogy](https://example.com) - Genealogy: runs `/autoresearch` prompts to expand family trees, verify claims, and keep a structured evidence-backed vault.
```

## How to contribute

1. Pick the category that best matches the direct autoresearch application domain.
2. Add a single-line entry in the required format.
3. Keep the summary concrete and scannable.
4. Prefer examples that clearly show scenario + autoresearch loop + value.

See [CONTRIBUTING.md](CONTRIBUTING.md) for details.

## Automation

A ready-to-run updater script lives at `scripts/update-awesome-autoresearch.sh`.

It will:
- initialize the local repo if needed
- ensure `origin` exists, defaulting to `https://github.com/yibie/awesome-autoresearch.git`
- pull `main` when the remote already has history
- run pi non-interactively with `scripts/prompts/periodic-curation-prompt.md`
- commit and push only when the repository actually changed

If you prefer a different remote, set `REMOTE_URL` before running the script.

Examples:

```bash
# normal run
./scripts/update-awesome-autoresearch.sh

# curate and commit locally, but do not push
SKIP_PUSH=1 ./scripts/update-awesome-autoresearch.sh
```

For unattended runs, copy `scripts/update-awesome-autoresearch.env.example` to `scripts/update-awesome-autoresearch.env` and put your API key there.

A launchd installer is included for macOS:

```bash
./scripts/install-launchd-job.sh
```

That installs `~/Library/LaunchAgents/com.yibie.awesome-autoresearch-updater.plist` and runs the updater every 6 hours.

## Notes

- Industry is treated as a secondary label inside each entry.
- Domain categories are preferred over generic buckets like "research agent" or "monitoring agent."
- This repository optimizes for **precision over coverage**.
- Brevity is a feature, not a limitation.
- If an example needs a paragraph to make sense, it probably is not a strong fit yet.

## License

MIT
