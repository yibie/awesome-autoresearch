---
name: tweet-posting-cdp
description: Publish tweets via Chrome DevTools Protocol (CDP) without any browser extension. Use for posting X/Twitter updates from scripts or agents when opencli-style extension tooling is unavailable or broken.
---

# Tweet Posting via CDP

Post tweets to X/Twitter by driving the already-logged-in Chrome through the DevTools Protocol. No extension needed — relies on Chrome's remote debugging endpoint.

## Prerequisites

1. Chrome running with remote debugging. If `~/Library/Application Support/Google/Chrome/DevToolsActivePort` exists, the endpoint is live (the file contains port + browser WebSocket path). If missing, relaunch Chrome:

```bash
open -a "Google Chrome" --args --remote-debugging-port=9222
```

2. Chrome logged into X (https://x.com) — the script reuses the logged-in session.

## Post a tweet

```bash
echo "推文内容" | ~/.agent-reach/scripts/post-tweet-cdp.mjs
# 或
~/.agent-reach/scripts/post-tweet-cdp.mjs "推文内容"
```

Script output: composer text length, button state, success confirmation. On success the composer is emptied (that's the verification signal).

## How it works

1. Read `DevToolsActivePort` → `ws://127.0.0.1:<port>/devtools/browser/<token>`
   - NOTE: HTTP `http://localhost:9222/json/*` returns 404/502 on modern Chrome (v136+); the WebSocket from this file is the only working entry point.
2. `Target.getTargets` → find the `page` target whose URL contains `x.com` (open one if absent).
3. `Target.attachToTarget` with `flatten: true` → session-scoped commands.
4. Focus the composer via `Runtime.evaluate`: `document.querySelector('[data-testid="tweetTextarea_0"]').focus()`, then clear any draft with `execCommand('selectAll')` + `execCommand('delete')`.
5. Insert text in ~50-char chunks via `Input.insertText` (trusted input events — React/Draft.js accepts these; a single big insertText or plain `execCommand('insertText')` does NOT enable the Post button).
6. Click `[data-testid="tweetButtonInline"]` (fallback `[data-testid="tweetButton"]`) via `Runtime.evaluate` → `.click()`.
7. Verify: composer textContent length drops to 0/gone.

## Gotchas (learned the hard way)

- `execCommand('insertText')` alone leaves the Post button `disabled` — React never registers the text. `Input.insertText` (CDP) is required.
- `Input.insertText` with the whole tweet in one call silently drops trailing chars. Chunk at ~50 chars with ~150ms sleep between chunks.
- The composer element itself is the contenteditable (`DIV.tweetTextarea_0`); `.focus()` on it works, then `Input.insertText` lands correctly.
- OpenCLI's browser-bridge approach (`opencli twitter post`) breaks with `attach failed: Cannot access a chrome-extension:// URL of different extension` when the extension ID drifts after updates — CDP avoids extensions entirely.
- cua-driver (`cua.ai/cua-driver`) native path (AX click + CGEvent typing) works for navigation but web-content writes are `unverifiable`; its `page` tool needs the same CDP port. Direct CDP is the most reliable layer.

## Posting rules (project convention)

- One post per sweep round; never retry or repost with different wording (opencli-era rule, still honored).
- No post when a sweep round adds zero entries.
