---
name: autoresearch-curation
description: Curate and expand the awesome-autoresearch repository. Use when adding new autoresearch cases, collecting discussion evidence from X/Reddit/HN/blogs, promoting discussion items into main categories, refreshing README counts, or running periodic evidence sweeps.
---

# Autoresearch Curation

Use this skill to maintain `awesome-autoresearch` as a **strict, high-signal list of direct autoresearch use cases**.

## Goal

Keep the repository focused on two questions:

1. Where is autoresearch actually being used in public?
2. Which autoresearch patterns transfer across domains?

This skill is for **curation**, not broad AI trend collection.

## Source of truth

Read these files before making changes:

- `README.md`
- `CONTRIBUTING.md`
- every file under `categories/`

`README.md` is the homepage aggregate, not the primary editing surface.
Update category files first, then refresh `README.md` from the current category files.
If available, use `scripts/build-readme.py` instead of hand-editing the aggregate.


> **2026-10-18 起：本列表的 sweep 不再自己发帖。** 三个列表的更新每天合成**一条**合并帖，
> 由独立的 `curation-digest-post` 任务发出。所以每轮结束时把结果追加到
> `~/.agent-reach/state/curation-digest.md` 的 `## <本仓库名>` 段（总数 + 每条新增一句话 +
> 一两条最值得说的未采纳原因）；**无新增就什么都不写**。格式与示例见
> /skill:tweet-posting-cdp 的「跨列表合并帖」一节。

## Hard inclusion rules

Only include items that satisfy at least one of these:

- explicitly mention `autoresearch`
- explicitly cite Karpathy's autoresearch
- clearly show a `modify → verify → keep/discard → repeat` loop

And all of these:

- source is public and citable
- description is concrete
- entry stays **one sentence**
- item is **strictly autoresearch-relevant**, not a generic research agent

Reject:

- generic agents
- vague AI commentary
- private or uncitable claims
- things that need a paragraph to justify inclusion

## Category model

Use **main category pages** for stronger evidence such as:

- public repos
- project pages
- substantial write-ups
- clear README evidence of the loop

Use **`categories/related-practices-discussions.md`** for:

- X threads
- Reddit discussions
- Hacker News discussions
- interviews
- blog mentions

when they show credible real practice signals but do not yet have a strong standalone repo or case page.

## Working strategy

### 1. Search broadly, classify narrowly

Use cross-platform searches, but keep inclusion strict.

Preferred evidence channels:

- GitHub
- X / Twitter
- Reddit
- Hacker News
- independent blogs / write-ups

**Follow roundups and lists, not only keywords.** A keyword search can only return things
named after the keyword. The catalogue already holds `autoharness` (309★) and
`recursive-improve` (290★), and it got the second one from a Reddit roundup titled "6 OSS
repos turning Karpathy's Autoresearch into self-improving agents" — two rounds of
`gh search repos "autoresearch"` had never surfaced it, because its name does not contain
the word. The same applies to the sibling lists: a broad `gh search repos "mario kart
wii"` found a 664★ project that `"mario kart wii recomp"` could not.

So when a roundup, a listicle, a newsletter or a round-up thread appears, mine its names
and check each one against the catalogue. Treat it as a source of candidates, not just as
a discussion entry — and conversely, when every name in it is already listed, that is
itself worth recording as a signal.

### 2. Keep X queries simple

Prefer medium-complexity searches such as:

- `autoresearch trading`
- `autoresearch benchmark`
- `autoresearch debugging`
- `Karpathy autoresearch robotics`

Avoid very long advanced-search expressions when the adapter is unstable.

### 3. Chinese + English

Search in both languages when useful.

Useful Chinese patterns:

- `autoresearch 回滚`
- `autoresearch 验证器`
- `autoresearch benchmark`
- `Karpathy autoresearch 工程`

But keep Chinese queries narrow to avoid noisy generic matches.

## `last30days`: the multi-channel sweep

`last30days` (mvanhorn, MIT) is installed at `~/.agents/skills/last30days`, a symlink into the vendored clone at `~/.agent-reach/vendor/last30days-skill/skills/last30days`. It resolves for every project, so this repo and its sibling list share one copy; update it with `git -C ~/.agent-reach/vendor/last30days-skill pull`.

```bash
SKILL=~/.agent-reach/vendor/last30days-skill/skills/last30days
python3 "$SKILL/scripts/last30days.py" doctor          # which sources are alive, and how to fix the dead ones
python3 "$SKILL/scripts/last30days.py" "autoresearch" --days 7 --emit json --output /tmp/sweep.json
```

Then read `/tmp/sweep.json` and pull `url` / `title` per source. Live out of the box on this machine: reddit, youtube (via yt-dlp), hackernews, polymarket, github (via `gh`). X is unconfigured until `setup --allow-browser-cookies` runs, so keep using `twitter search` for X in the meantime.

**What it reaches that the manual sweep cannot.** Two classes show up here and nowhere else:

- **Unmerged integrations.** A pull request or an issue that adds an autoresearch loop to an existing project is invisible to `gh search repos` and `gh search code`, because the code is not on the default branch and the repository never matches.
- **Discussion in places nothing indexes.** Small-subreddit threads, conference talks, personal blogs — the material that fills `related-practices-discussions.md` without ever appearing in a repository search.

Treat it as a complement, not a replacement: it is strong on recency and breadth, while `gh search` remains better for exhaustive repository coverage. Run both, and reconcile.

## Promotion workflow

Use this exact ladder:

1. **Discussion lead found**
   - Add to `categories/related-practices-discussions.md` if it is credible and directly autoresearch-related.
2. **Evidence chain search**
   - Look for repo, README, case page, blog post, or project page.
3. **Promotion test**
   - Promote only if public evidence clearly shows a real autoresearch loop or explicit autoresearch framing.
4. **Promote**
   - Move it into the best-fit main category.
5. **Deduplicate**
   - Remove the weaker discussion-only item if the main case now covers it.
6. **Refresh counts**
   - Update `README.md` counts if category totals changed.

## Entry-writing rules

### Main categories

Format:

```md
- [Name](URL) - Domain: one-sentence description of the autoresearch use case.
```

Rules:

- one sentence only
- must mention scenario + loop/value
- prefer concrete verbs like `applies`, `adapts`, `uses`, `iterates`, `keeps`
- avoid hype

### Discussions page

Format:

```md
- [Name or thread title](URL) - Source/platform: one-sentence description of the autoresearch-related practice or discussion.
```

Rules:

- keep it factual
- describe the practice signal, not your opinion
- if it is mostly about transfer of the pattern, say that clearly

## Periodic maintenance loop

When invoked for a recurring sweep:

1. Read the current category files.
2. Search for 3-10 new public leads.
3. Filter aggressively.
4. Add only high-signal entries.
5. Attempt promotion for the strongest discussion leads.
6. Remove duplicates.
7. Recount category totals.
8. Refresh `README.md` so the homepage aggregate matches the current category files and counts.
9. Summarize:
   - what was added
   - what was promoted
   - what remains discussion-only
   - what needs stronger evidence

## Suggested commands

Count entries:

```bash
python - <<'PY'
from pathlib import Path
for p in sorted(Path('categories').glob('*.md')):
    cnt=sum(1 for line in p.read_text().splitlines() if line.startswith('- ['))
    print(f'{p}:{cnt}')
PY
```

Example searches:

```bash
bb-browser site twitter/search 'autoresearch benchmark' --json
bb-browser site twitter/search 'autoresearch debugging' --json
bb-browser site twitter/search 'autoresearch robotics' --json
bb-browser site google/search 'site:reddit.com autoresearch real codebase OR autoresearch debugging' | sed -n '1,220p'
bb-browser site google/search 'site:news.ycombinator.com autoresearch OR "Karpathy autoresearch"' | sed -n '1,220p'
bb-browser site google/search 'site:github.com "autoresearch" robotics' | sed -n '1,220p'
opencli gh api repos/<owner>/<repo>/readme
```

## Quality bar

**Promote slowly. Add discussions faster.**

If evidence is good but not strong enough for a main case, keep it in discussions.
Precision beats coverage.

Before adding a repository, check depth (see CONTRIBUTING.md, "AI-assisted work, and bulk submissions"):

- Does the code implement the loop, or is the claim README-only?
- Is there a runnable check or committed result (benchmark harness, results file, demo)?
- Is the repository mostly prompt documents? Then describe it as such, or skip it.
- Does a batch of same-day repositories share one scaffold? That is a risk signal, not momentum — review each on its own merits, and cap a single author at three entries per rolling seven days.
- Are the numbers in the entry traceable to the linked page? Strip what you cannot verify.
- Is it a launch, funding, or press announcement? That is discussion material at best, never an implementation entry.

### Before rejecting for "does not mention autoresearch", look at the code

A repository can be a genuine autoresearch implementation and never use the word. Two consecutive sweeps nearly dropped large projects this way — one a 1,298-star harness, the other an agent research studio — because the README described the loop in behavioural terms ("nothing promotes below F = 0.99", "the loop gets smarter as you use it") rather than borrowing the name.

The name-based search that drives this sweep (`gh search repos "autoresearch"`) is structurally blind to that class: projects that treat autoresearch as a component or a method, not as a brand. They are often the larger ones. So before rejecting on a README read, check the repository's own code:

- `gh search code '"autoresearch" repo:OWNER/REPO'` — the word may be in the tree without being in the README, and a directory is stronger evidence than a sentence.
- `gh search code 'Karpathy repo:OWNER/REPO'` — a citation counts even when the README is silent.
- Read the file tree for the loop's signature layout: a `program.md` plus a `prepare.py`/`train.py` pair, or an `autoresearch/` directory. That structure is itself the evidence.
- Ask what promotes a change. A stated promotion gate (a metric threshold, a keep/discard rule, a versioned baseline) satisfies the inclusion rule even when the word is absent.

The rule is about the loop, not the label. A project that modifies, measures, and keeps or discards is in scope whether or not it says the name — and a project that merely calls itself autoresearch is not, which is the other half of the same rule.

## Handling pull requests

When a contributor opens a PR:

1. Verify the repository, do not just read the PR body — file tree, source, tests, commit history, and whether the code really calls what it claims.
2. If the repository is thinner than the entry implies (README-only claims, no runnable check, docs outweighing code), say so in a review comment and ask for the missing evidence rather than merging or silently rejecting.
3. When an author has already had three entries accepted in the current pass, state the rule in the PR comment before acting on it, and queue the extra entries to a later pass instead of rejecting them. Quote the CONTRIBUTING section so the contributor knows it is policy, not a judgement about them.
4. Never edit a contributor's wording purely for style; do fix inaccurate claims.

## Deliverable checklist

Before finishing, verify:

- entries are one sentence
- no generic agents slipped in
- promoted items have stronger evidence than discussion-only items
- discussions page remains useful as a map of emerging practice
- README homepage aggregate matches the current category files

## Recommended invocation phrases

This skill should be used for prompts like:

- "继续搜集 awesome-autoresearch"
- "做一轮 autoresearch 证据巡检"
- "把 discussions 里强条目升格"
- "更新 autoresearch awesome list"
- "定期维护这个仓库"

Keep a PR reply short: the rule in one line, what happens next in one line, then stop. No restating the contributor's work, no explaining the queue's arithmetic, no advice they did not ask for.

## 两个已固化的操作规则（2026-10-21）

### 1. 农场黑名单：同描述 ≥3 次即整类不收

同一段描述在 7 天内出现 ≥3 次（账号名多为 `FirstnameLastname+数字`）→ 判定为农场，**整类不收**，并记进下表；后续轮次**不再逐个核实**，只在摘要里写一句「农场又出现 N 个」。

| 描述开头 | 首见 | 规模 | 处理 |
|---|---|---|---|
| `Don't trust an autoresearch paper at face value`（Anti-Autoresearch） | 2026-10-14 | 24+ | 只收 1 条（已收），其余不收 |
| `Unofficial skill that teaches coding agents to build with TypeSafe Jev`（building-with-typesafe-jev） | 2026-10-10 | 24+ | 原项目 `aaddrick/building-with-typesafe-jev` 已收，克隆一律不收 |

判断口径：**「同描述」比「同账号」可靠** —— 农场会换账号，但不换文案。

### 2. 数条目只读 README 自己的计数行

三个生成器的输出格式不同，而且有两个**成功时不打印**：

| 仓库 | 读法 |
|---|---|
| awesome-rea | 生成器会打印 `README.md written: N entries across M categories` |
| awesome-jev / awesome-autoresearch | 生成器**静默** → 读 README 的 `## Current coverage` 段里的 `— N entries` |

**不要用统一正则**（已因此出错三次：`/tmp` 缓存被清、rea 的表格格式、jev 静默）。

### 3. 「AI 提及数」的正则陷阱

`\bAI\b` **会匹配 `aim`**（`A` 前是边界、`I` 后接 `m` 也是边界）。统计 AI 参与时用：

```bash
grep -icE '\b(ai|llm|agent|claude|gpt|copilot)\b' README.md | ...
grep -oicE '\bai\b' README.md   # 还要人工看一眼是否全来自 aim/aisle 之类
```

判断「AI 是否参与」不能只靠计数，**要看命中行的上下文** —— 一次把 `aim` 当 AI、一次把「in-game AI opponents」当 AI 参与，都是这条规则要防的。

### 供应链检查（2026-10-23 加，来自 issue #14）

条目指向的仓库，若**源码树里直接提交了可执行文件或压缩包**（`.zip .exe .msi .dll .bat .ps1 .scr`），尤其是这几条同时成立时，极可能是**诱饵仓库**（把恶意二进制塞进同名 fork 或仿冒项目）：

- 项目本身是 Python / JS / Go 之类**不需要二进制**的；
- README 让读者「Run anyway」跳过 SmartScreen 之类的警告；
- 下载链接指向 `raw.githubusercontent.com` 而不是 GitHub Releases；
- 仓库创建时间**晚于**同名项目；
- README 的安装步骤与项目描述对不上（例如一个打分引擎要求你装 Windows 应用）。

**处置**：不收录该仓库，去找原始项目替换，并在 issue/PR 里说明核实过什么。

核查成本很低：

```bash
gh api "repos/OWNER/REPO/git/trees/HEAD?recursive=1" \
  --jq '[.tree[] | select(.type=="blob") | select(.path|test("\\.(zip|exe|msi|dll|bat|ps1|scr)$";"i"))] | length'
```

返回 `0` 才算干净。**新增条目一律跑这一条**；命中的再逐条人看，不要自动判死（有些项目确实提交测试用的小二进制）。
