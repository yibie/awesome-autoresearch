---
name: tweet-posting-cdp
description: Publish tweets via Chrome DevTools Protocol (CDP) without any browser extension, using a fixed post layout. Use for posting X/Twitter updates from scripts or agents, especially the periodic awesome-list sweep posts.
---

# Tweet Posting via CDP

Post tweets by driving the already-logged-in Chrome through the DevTools Protocol. No extension needed.

**Canonical copy:** `awesome-autoresearch/.agents/skills/tweet-posting-cdp/SKILL.md`
`~/.agents/skills/tweet-posting-cdp` symlinks here so awesome-jev and other repos resolve the same content. Edit one place only.

## 统一格式（必须遵守）

所有巡查/更新帖用同一版式，**空行必须是真的空行**（脚本按段落写入，见下）。

### A. 周期巡检帖

```
📋 {repo} 周期巡检

本轮新增 {n} 条：

1. {名称}（{分类}）：{一句话：是什么 + 为什么值得加}

2. {名称}（{分类}）：{一句话}

📂 github.com/yibie/{repo}
📊 {total} entries
```

规则：
- 首行标题写一行，空行，`本轮新增 N 条：`，空行，然后逐条。
- 每条**一行**、**一句话**；`序号. 名称（分类）：说明`。条目之间空一行。
- 结尾固定两行：仓库链接、总条目数（用 `📂` / `📊`）。
- 本轮有升格或去重时，在条目后另起一段说明（同样与上文空行分隔）。
- **无新增不发帖**（项目约定）。纯维护（去重、升格、修脚本）不算新增。
- 一轮只发一次；禁止换措辞重发、禁止中英各发一次。

### B. 上线/公告帖

```
📢 {repo} 上线

{一句话背景}

· {亮点 1}
· {亮点 2}

📂 github.com/yibie/{repo}
📊 {total} entries
```

### 发布前自检

- 段数 = 行数 + 1（脚本会打印 `内容校验通过：N 字符 / M 段落`，M 必须等于期望段落数）。
- 命令用 `DRY_RUN=1` 先跑一遍，确认读回渲染与预期完全一致再真发。

## Post a tweet

```bash
echo "推文内容" | ~/.agent-reach/scripts/post-tweet-cdp.mjs
# 或
~/.agent-reach/scripts/post-tweet-cdp.mjs "推文内容"

# 只写入并校验、不发帖、结束前清空（推荐先跑）
DRY_RUN=1 ~/.agent-reach/scripts/post-tweet-cdp.mjs "推文内容"

# 排查写入过程：每次读回值都打出来
STEP_TRACE=1 DRY_RUN=1 ~/.agent-reach/scripts/post-tweet-cdp.mjs "..."
```

脚本成功时会打印 `✅ 内容校验通过：N 字符 / M 段落`，发布后再确认 `✅ 发布成功（composer 已清空）`。任一步校验失败即中止，**不会**发布未校验内容。失败时会自动清空 composer 残稿。

## Prerequisites

Chrome running with remote debugging **and** logged into X. The script finds the port itself:

1. `CDP_PORT` env override (if set).
2. Probe `9333`, `9222`, `9223` via `http://127.0.0.1:<port>/json/version`.
3. Fall back to `~/Library/Application Support/Google/Chrome/DevToolsActivePort`.

The live instance on this Mac is usually `/tmp/chrome-pub-profile` on **9333** (started with `--user-data-dir=/tmp/chrome-pub-profile --remote-debugging-port=9333`). The main-profile `DevToolsActivePort` file can be **stale** (pointing at a dead 9222) — that is why probing comes first.

Chrome v152: `/json/version` **does** work and returns `webSocketDebuggerUrl`; use it instead of constructing the URL from the file.

### When CDP is not available at all: use `ego-browser`

Two failure modes have been hit on this Mac, and both are environmental rather than content problems:

- **Chrome is running without a debugging port.** `ensure-chrome.sh` launches it for the **OpenCLI extension**, so the process line has `--no-first-run` and no `--remote-debugging-port`. Port `9222` is listening but answers `HTTP 404` to `/json/version` — it is the extension's socket, not DevTools. Starting a second instance with `--user-data-dir=/tmp/chrome-pub-profile --remote-debugging-port=9333` restores CDP without touching the user's own window.
- **The dedicated profile is logged out.** CDP then works but lands on `x.com/i/jf/onboarding/web?redirect_after_login=%2Fhome&mode=login`, which the script reports as `composer 未就绪`.

When either happens, **`ego-browser` is a working substitute** because it drives the user's own logged-in session. Do not guess at it: this sequence is verified end to end.

```bash
ego-browser nodejs <<'EOF'
const fs = await import("node:fs/promises");
const text = (await fs.readFile("/tmp/post.txt", "utf8")).replace(/\n+$/, "");
const task = await taskSpace("post the sweep tweet");
const page = task.page("p1");
try { await page.goto("https://x.com/compose/post", { waitUntil: "commit" }); } catch (e) {}
await page.waitForTimeout(6000);
const box = "[data-testid='tweetTextarea_0']";
await page.waitForSelector(box, { state: "visible", timeout: 20000 });
await page.click(box, { label: "focus composer" });
await page.keyboard.insertText(text);          // preserves newlines, unlike type()
await page.waitForTimeout(2500);
const len = await page.evaluate((sel) => (document.querySelector(sel)?.innerText || "").length, box);
console.log("composer:", len, "expected:", text.length, len === text.length ? "OK" : "MISMATCH");
if (len === text.length) {
  await page.click("loc=role:button[name='发帖']", { label: "click Post" });
  await page.waitForTimeout(6000);
  console.log((await page.snapshot()).split("\n").filter((l) => /已发送/.test(l)).join("\n"));
}
console.log("SPACE_ID=" + task.spaceId);
EOF
```

Notes that matter:

- **Print `SPACE_ID` last.** The task space persists across invocations but Node variables do not, and `tail`-slicing output loses anything printed earlier.
- **Spaces expire.** `task space not found` means create a new one; it is not a reason to keep retrying the id.
- **`page.keyboard.insertText()` gets the whole text in without an Enter-per-line dance**, and the length check is the equivalent of the CDP readback. On a Chinese-locale UI the Post button is `发帖`; the success toast is `你的帖子已发送`.
- A first `goto` to `/compose/post` may throw a navigation-timeout while the page is already committed, or the page may show "Something went wrong … privacy related extensions". Clicking the offered `Try again` recovers it; that is not a login problem.
- **One publication per list per round still holds.** A failed CDP attempt published nothing, so a later `ego-browser` attempt is that list's single post, not a second one. Verify with `twitter user-posts yibie -n 4` afterwards, as always.

## How it works

1. Probe for the browser WebSocket URL (see above).
2. `Target.getTargets` → take the page whose `pathname === '/home'`. **Only `/home` is acceptable** — a status page also has `[data-testid="tweetTextarea_0"]`, but that is the **reply** box. If no `/home` tab exists, create one.
3. `Target.attachToTarget` with `flatten: true` → session-scoped commands.
4. Clear the composer with CDP editing commands `['selectAll']` then `['delete']`.
5. Write the text line by line (Enter between lines), verifying after each step.
6. Verify the full readback equals the target; compare paragraph counts too.
7. Assert the post button reads `发帖`/`Post` (a `回复`/`Reply` button means we are on the wrong page → abort).
8. Click `[data-testid="tweetButtonInline"]` (fallback `[data-testid="tweetButton"]`).
9. Verify success: composer is empty.

## Gotchas (all verified empirically — do not "simplify" these away)

### 1. Newlines need an Enter key event

`Input.insertText` with `"\n"` does **not** create a paragraph in X's Draft.js composer. Measured results for inserting `AAA`, then a line break, then `BBB`:

| Method | Blocks | Content |
| --- | --- | --- |
| `Input.insertText("\n")` | 1 | `AAA BBB` — no break at all |
| `keyDown`+`char`+`keyUp`, `text: "\r"` | 2 | `["AAA", "\nBBB"]` — literal `\n` leaks into the text |
| `execCommand('insertParagraph')` | 1 | mangled |
| **`rawKeyDown`+`keyUp`, no `text`** | **2** | **`["AAA","BBB"]` ✅** |

So: Enter = `{type:'rawKeyDown', key:'Enter', code:'Enter', windowsVirtualKeyCode:13, nativeVirtualKeyCode:13}` then a matching `keyUp`. Never pass `text`.

### 2. Read the composer via per-block `textContent`

| State | `innerText` per block | `textContent` per block |
| --- | --- | --- |
| empty composer | `["\n\n\n"]` — reads as 3 newlines ❌ | `[""]` ✅ |
| `AAA` + Enter + `BBB` | `["AAA\n\n","BBB"]` ❌ | `["AAA","BBB"]` ✅ |
| trailing empty paragraph | `["AAA\n\n","BBB","\n"]` ❌ | `["AAA","BBB",""]` ✅ |

`innerText` appends `\n`/`\n\n` per block (unusable for exact comparison); `editor.textContent` concatenates all blocks and loses newlines. Join per-block `textContent` with `\n`.

### 3. Clear with CDP editing commands, not raw modifier keys

`document.execCommand('selectAll'/'delete')` bypasses Draft.js's internal state; the next `insertText` then gets reverted. A bare `rawKeyDown` with `modifiers: 4` (Cmd+A) also does not reliably select. Use `commands: ['selectAll']` and `commands: ['delete']` on `Input.dispatchKeyEvent`, then re-read to confirm the composer is empty.

**Historical bug worth remembering:** the combination of an uncleared draft plus chunked inserts silently dropped the **first ~50 characters** of every post (and collapsed newlines), so published tweets began mid-sentence. Full-content verification exists to catch exactly this.

### 4. Cursor must advance on the newline-preserving readback

If you strip trailing newlines before comparing, a step that only adds a blank line looks like no progress → the loop declares a stall. Keep newlines in the readback and use it for both the prefix check and the cursor; only strip trailing newlines for the final equality check.

### 4b. X autosaves the composer draft server-side

A draft left in the composer for more than a few seconds is saved by X and **restored by a reload**, so reloading alone does not always discard it (observed with a 672-character draft: two reloads both came back with the text). Clearing via DOM manipulation does not reliably clear the saved copy either — a Range selection plus `execCommand('delete')` empties the visible editor but also strips its paragraph nodes, leaving Draft.js desynced until the next reload repairs it.

Consequences, in order of importance:

- `resetComposer` retries the reload up to four times, reading the composer twice each round (a restored draft can appear later than the DOM finishing), and **aborts if the composer is still dirty**. The failure mode is a safe abort, never writing on top of an old draft.
- A `DRY_RUN` right before a real post can therefore leave a draft behind. The real run will either clear it or abort — it will not silently prepend it.
- If a draft is stuck, clear it from X's own Drafts page rather than fighting the DOM.

### 5. Never post from a non-`/home` tab

`tweetTextarea_0` exists on status pages as the reply composer. Replying to a stranger's tweet is the worst possible failure. The script hard-blocks on `pathname !== '/home'` and on a button label that isn't `发帖`/`Post`.

### 6. Chunk size

Insert line-by-line in ~24-char chunks with ~130 ms between chunks. Earlier notes recommended ~50-char chunks for `Input.insertText`; that is still fine for enabling the Post button, but smaller chunks plus after-each-step verification is what actually makes the write reliable.

## Failure handling

- Script aborts before clicking Post on any verification mismatch, and clears the composer on the way out.
- If the composer cannot be cleared in 5 attempts, it aborts rather than writing on top of a dirty editor.
- Do **not** retry with different wording after a failure that did post. If nothing was posted, a retry is fine.

## Not used anymore

- OpenCLI's browser bridge (`opencli twitter post`) — breaks with `attach failed: Cannot access a chrome-extension:// URL of different extension` when the extension ID drifts.
- `execCommand('insertText')` for the composer body — React never registers it, Post stays disabled.
- `ensure-chrome.sh` / `post-tweet.sh` — opencli-era helpers, superseded.

## 跨列表合并帖（2026-10-18 起的默认做法）

三个列表的 sweep 是**三个独立的定时任务**，如果各自发帖，同一天会出现三条内容高度重叠的帖子。所以分工如下：

**三个 sweep 任务不发帖。** 每轮结束时，把本轮结果**追加**到共享摘要文件：

```bash
cat >> ~/.agent-reach/state/curation-digest.md <<'EOF'
## awesome-jev
总数: 634（本轮 +2）
- 条目名（分类）: 一句话说清是什么 + 为什么值得加
- ...
未采纳: 一两条最值得说的 + 原因
EOF
```

规则：

- **只有真的有新增时才写这一段。** 无新增就什么都不写 —— 这样「无新增不发帖」这条约定自然成立。
- 纯维护（去重、升格、修脚本、修标签）**不算新增**，但如果是**升格**，写成「升格: 条目名 …」一行，值得出现在合并帖里。
- 每条新增**一句话**，含「是什么 + 为什么值得加」，和单列表帖子的写法一致。
- 不要写仓库 URL 和总数以外的元信息，摘要文件会被原样读去做帖子。

**`curation-digest-post` 任务**（独立定时，晚于三个 sweep）负责：读摘要 → 若空则不发帖 → 若非空则合成**一条**中文帖 → 发一次（`ego-browser` 路径见上）→ 清空摘要。

合并帖格式：

```
📋 三个列表的每日更新

▍awesome-rea（29 → 31）
1. 条目名（分类）：一句是什么 + 一句为什么值得加。
2. …

▍awesome-jev（634 → 636）
1. …

▍awesome-autoresearch（634 → 635）
1. …

📂 github.com/yibie/awesome-rea · github.com/yibie/awesome-jev · github.com/yibie/awesome-autoresearch
📊 29 / 636 / 635
```

只列**有新增的列表**，没新增的整段省略。末尾固定三行：三个仓库 URL、三个总数。

**一次调用。** 仍然只发一次，禁止换措辞重发；发完清空摘要文件，避免同一批内容第二天再发一遍。
