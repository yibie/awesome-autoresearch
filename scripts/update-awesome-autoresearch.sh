#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BRANCH="${BRANCH:-main}"
PI_BIN="${PI_BIN:-pi}"
REMOTE_URL="${REMOTE_URL:-https://github.com/yibie/awesome-autoresearch.git}"
LOG_DIR="${LOG_DIR:-$REPO_ROOT/.logs}"
PROMPT_FILE="${PROMPT_FILE:-$REPO_ROOT/scripts/prompts/periodic-curation-prompt.md}"
ENV_FILE="${ENV_FILE:-$REPO_ROOT/scripts/update-awesome-autoresearch.env}"
TIMESTAMP="$(date -u +%Y-%m-%dT%H-%M-%SZ)"
LOG_FILE="$LOG_DIR/curation-$TIMESTAMP.log"

mkdir -p "$LOG_DIR"
cd "$REPO_ROOT"

if [ -f "$ENV_FILE" ]; then
  # shellcheck disable=SC1090
  source "$ENV_FILE"
fi

fail() {
  echo "[update-awesome-autoresearch] $*" >&2
  exit 1
}

has_changes() {
  ! git diff --quiet -- . \
    || ! git diff --cached --quiet -- . \
    || [ -n "$(git ls-files --others --exclude-standard -- .)" ]
}

ensure_git_repo() {
  if [ ! -d .git ]; then
    git init -b "$BRANCH" >/dev/null
  fi

  if ! git remote get-url origin >/dev/null 2>&1; then
    git remote add origin "$REMOTE_URL"
  fi

  if git show-ref --verify --quiet "refs/heads/$BRANCH"; then
    git checkout "$BRANCH" >/dev/null 2>&1
  else
    git checkout -B "$BRANCH" >/dev/null 2>&1
  fi
}

sync_from_remote() {
  if ! git ls-remote --exit-code origin "$BRANCH" >/dev/null 2>&1; then
    return 0
  fi

  git fetch origin "$BRANCH" >/dev/null

  if git rev-parse --verify HEAD >/dev/null 2>&1; then
    git pull --rebase origin "$BRANCH"
  else
    git reset --hard "origin/$BRANCH" >/dev/null
  fi
}

run_pi() {
  [ -f "$PROMPT_FILE" ] || fail "prompt file not found: $PROMPT_FILE"

  local prompt
  prompt="$(cat "$PROMPT_FILE")"

  if command -v "$PI_BIN" >/dev/null 2>&1; then
    "$PI_BIN" --no-session -p "$prompt" 2>&1 | tee "$LOG_FILE"
    return 0
  fi

  if [ -n "${NODE_BIN:-}" ] && [ -n "${PI_CLI_JS:-}" ]; then
    [ -x "$NODE_BIN" ] || fail "NODE_BIN is not executable: $NODE_BIN"
    [ -f "$PI_CLI_JS" ] || fail "PI_CLI_JS not found: $PI_CLI_JS"
    "$NODE_BIN" "$PI_CLI_JS" --no-session -p "$prompt" 2>&1 | tee "$LOG_FILE"
    return 0
  fi

  fail "pi not found in PATH and NODE_BIN/PI_CLI_JS fallback not configured"
}

commit_and_push() {
  if ! has_changes; then
    echo "[update-awesome-autoresearch] no repository changes"
    return 0
  fi

  git add -A

  if git diff --cached --quiet -- .; then
    echo "[update-awesome-autoresearch] nothing staged after git add"
    return 0
  fi

  git commit -m "chore: update awesome-autoresearch ($TIMESTAMP)"

  if [ "${SKIP_PUSH:-0}" = "1" ]; then
    echo "[update-awesome-autoresearch] SKIP_PUSH=1, leaving commit local"
    return 0
  fi

  git push -u origin "$BRANCH"
}

ensure_git_repo
sync_from_remote
run_pi
commit_and_push
