#!/usr/bin/env bash
set -euo pipefail

REPO="${1:-$(pwd)}"
MAX_ITERS="${MAX_ITERS:-12}"
MODEL="${MODEL:-mimo/mimo-auto}"
RUN_ID="${RUN_ID:-ralph-mimo-ai-tracker-$(date +%Y%m%d-%H%M%S)}"
RUN_DIR="${RUN_DIR:-/tmp/agent-runs/$RUN_ID}"
TARGET_PAGE="${TARGET_PAGE:-ai-tracker.md}"
AUTO_COMMIT="${AUTO_COMMIT:-0}"
AUTO_PUSH="${AUTO_PUSH:-0}"
VERIFY_LIVE="${VERIFY_LIVE:-1}"
LIVE_URL="${LIVE_URL:-https://yanhaoming.com/ai-tracker/}"
PAGES_REPO="${PAGES_REPO:-newtontech/yanhaoming.com}"
PAGES_WAIT_SECONDS="${PAGES_WAIT_SECONDS:-180}"
ITER_TIMEBOX_MINUTES="${ITER_TIMEBOX_MINUTES:-4}"
COMMIT_PREFIX="${COMMIT_PREFIX:-Expand AI tracker model intelligence}"

mkdir -p "$RUN_DIR"
cd "$REPO"

if ! command -v mimo >/dev/null 2>&1; then
  echo "mimo not found. Install it with: npm install -g @mimo-ai/cli"
  exit 127
fi

if [ ! -f "$TARGET_PAGE" ]; then
  echo "Target page not found: $REPO/$TARGET_PAGE"
  exit 2
fi

dirty_status="$(
  git status --short \
    | grep -v '^?? scripts/$' \
    | grep -v '^?? scripts/ralph-mimo-ai-tracker-loop.sh$' \
    || true
)"
if [ -n "$dirty_status" ] && [ "${ALLOW_DIRTY:-0}" != "1" ]; then
  echo "Worktree is dirty. Commit/stash first, or rerun with ALLOW_DIRTY=1."
  printf '%s\n' "$dirty_status"
  exit 3
fi

validate_page() {
  local js_file="$RUN_DIR/ai-tracker-inline.js"
  git diff --check
  awk '/<script>/{flag=1; next} /<\/script>/{flag=0} flag {print}' "$TARGET_PAGE" > "$js_file"
  node --check "$js_file"
  if [ -n "${TEST_CMD:-}" ]; then
    bash -lc "$TEST_CMD"
  fi
}

commit_and_maybe_push() {
  local iter="$1"
  if [ "$AUTO_COMMIT" != "1" ]; then
    return 0
  fi
  if git diff --quiet -- "$TARGET_PAGE"; then
    return 0
  fi
  git add "$TARGET_PAGE"
  git commit -m "$COMMIT_PREFIX iteration $iter"
  local commit_sha
  commit_sha="$(git rev-parse HEAD)"
  local markers_file="$RUN_DIR/live-markers-iter-$iter.txt"
  write_live_markers "$commit_sha" "$markers_file"
  if [ "$AUTO_PUSH" = "1" ]; then
    git -c http.version=HTTP/1.1 -c http.postBuffer=524288000 push origin "$(git rev-parse --abbrev-ref HEAD)"
    if [ "$VERIFY_LIVE" = "1" ]; then
      wait_for_pages_build "$commit_sha" "$markers_file"
      verify_live_page "$commit_sha" "$markers_file"
    fi
  fi
}

write_live_markers() {
  local commit_sha="$1"
  local markers_file="$2"
  git show --unified=0 --format= "$commit_sha" -- "$TARGET_PAGE" \
    | awk '
      /^\+[^+]/ {
        s = substr($0, 2)
        gsub(/^[[:space:]]+|[[:space:]]+$/, "", s)
        if (s ~ /^$/ || s ~ /^\/\// || s ~ /^\/\*/ || s ~ /^\*/ || s ~ /^<|^>|^\{|\}|^\]|\[$/) next
        if (s ~ /^(const|let|var|function|if|for|return|document|window)[[:space:](=]/) next
        marker = ""
        if (match(s, /"[^"]{8,120}"/)) {
          marker = substr(s, RSTART + 1, RLENGTH - 2)
        } else {
          marker = s
          gsub(/^[A-Za-z0-9_.$ -]+:[[:space:]]*/, "", marker)
          gsub(/[",;]+$/, "", marker)
        }
        if (marker ~ /^https?:\/\//) next
        if (tolower(marker) ~ /^(architecture|training|pre-training|mid-training|post-training|evaluation|agentic training|method|paper|official blog|model card|system card|official announcement|api docs)$/) next
        if (length(marker) >= 8 && length(marker) <= 120 && marker ~ /[[:alpha:]][[:alpha:]]/) print marker
      }
    ' \
    | awk '!seen[$0]++' \
    | head -5 > "$markers_file"
}

wait_for_pages_build() {
  local commit_sha="$1"
  local markers_file="${2:-}"
  if ! command -v gh >/dev/null 2>&1; then
    echo "gh not found; skipping GitHub Pages API wait."
    return 0
  fi
  local deadline=$((SECONDS + PAGES_WAIT_SECONDS))
  local latest_commit=""
  local latest_status=""
  echo "Waiting for GitHub Pages build for $commit_sha ..."
  while [ "$SECONDS" -le "$deadline" ]; do
    latest_commit="$(gh api "repos/$PAGES_REPO/pages/builds/latest" --jq '.commit // ""' 2>/dev/null || true)"
    latest_status="$(gh api "repos/$PAGES_REPO/pages/builds/latest" --jq '.status // ""' 2>/dev/null || true)"
    echo "pages: status=${latest_status:-unknown} commit=${latest_commit:-unknown}"
    if [ "$latest_commit" = "$commit_sha" ] && [ "$latest_status" = "built" ]; then
      return 0
    fi
    if [ -s "$markers_file" ] && live_page_has_markers "$commit_sha" "$markers_file"; then
      echo "Live page contains markers for $commit_sha; continuing despite Pages API lag."
      return 0
    fi
    sleep 8
  done
  echo "STOP: GitHub Pages did not build $commit_sha within ${PAGES_WAIT_SECONDS}s."
  return 6
}

live_page_has_markers() {
  local commit_sha="$1"
  local markers_file="${2:-}"
  local url="${LIVE_URL}?v=${commit_sha}"
  local html
  html="$(curl -L -fsS "$url" 2>/dev/null)" || return 1
  [[ "$html" == *"AI Research Tracker"* ]]
  [[ "$html" == *"ops-shell"* ]]
  [[ "$html" == *"pagerState"* ]]
  if [ -s "$markers_file" ]; then
    local marker
    while IFS= read -r marker; do
      [ -z "$marker" ] && continue
      [[ "$html" == *"$marker"* ]] || return 1
    done < "$markers_file"
  fi
}

verify_live_page() {
  local commit_sha="$1"
  local markers_file="${2:-}"
  local url="${LIVE_URL}?v=${commit_sha}"
  echo "Verifying live page: $url"
  live_page_has_markers "$commit_sha" "$markers_file"
  echo "Live page verified for $commit_sha"
}

echo "Ralph Mimo AI Tracker loop"
echo "Repo: $REPO"
echo "Target: $TARGET_PAGE"
echo "Run dir: $RUN_DIR"
echo "Max iterations: $MAX_ITERS"
echo "Model: $MODEL"

if [ "$MAX_ITERS" -le 0 ]; then
  echo "MAX_ITERS <= 0; nothing to run."
  exit 0
fi

last_diff_hash=""
same_diff_count=0

for ((iter = 1; iter <= MAX_ITERS; iter += 1)); do
  iter_dir="$RUN_DIR/iter-$iter"
  mkdir -p "$iter_dir"

  prompt_file="$iter_dir/prompt.txt"
  report_file="$iter_dir/DONE.md"
  log_file="$iter_dir/mimo.log"
  exit_file="$iter_dir/mimo.exit"

  cat > "$prompt_file" <<PROMPT
You are implementing a Ralph-style loop for the live Jekyll page:

Repo: $REPO
Target page: $TARGET_PAGE
Public route: /ai-tracker/

Goal:
Keep expanding and completing the AI Research Tracker as a multi-level interactive website for full-series frontier model intelligence. This is NOT API/interface work. It is content + interaction + source-backed interpretation work for model families, reports, training methods, benchmarks, figures, ecosystem, people, and source ledgers.

Timebox:
Finish this single iteration within about $ITER_TIMEBOX_MINUTES minutes. Choose a small unit that can be safely implemented and validated. Do not spend the whole iteration browsing. If a source lookup stalls, pick a smaller already-verifiable unit or write STOP_BLOCKED.

Use Ralph loop discipline for this iteration:
1. RFC intake:
   - Inspect $TARGET_PAGE.
   - Identify remaining gaps in full-series model coverage and interpretation panels.
2. DAG decomposition:
   - Choose exactly ONE smallest independent work unit for this iteration.
   - Prefer one model family, one report family, one method/eval panel, or one source-backed interactive module.
   - Keep the diff small enough for one commit.
3. Unit spec:
   - id
   - depends_on
   - scope
   - acceptance_tests
   - risk_level
   - rollback_plan
4. Implementation:
   - Edit only files required for /ai-tracker/.
   - Prefer $TARGET_PAGE unless a tiny helper file is clearly needed.
   - Preserve the existing static GitHub Pages/Jekyll architecture.
   - Preserve and extend existing pagination, filters, source ledger, drawer, and system layer patterns.
5. Validation:
   - Run at least: git diff --check
   - Extract inline script from $TARGET_PAGE and run node --check on it.
   - If a browser/runtime test is easy, describe or run it.
6. DONE report:
   - Write the report to: $report_file

Content requirements:
- Cover full-series model intelligence, not only one headline model.
- Important families to keep complete and separately versioned when source-backed:
  GLM-5 / GLM-5.1 / GLM-5.2,
  DeepSeek V3 / R1 / V4-Pro / V4-Flash,
  Kimi K2.5 / K2.6 / K2.7 Code,
  Qwen3.7-Max / Qwen3-Coder / Qwen3 family,
  Llama, Mistral, MiniMax, ERNIE, Hunyuan,
  OpenAI GPT system cards, Anthropic Claude system cards,
  Gemini model cards, xAI Grok cards/docs,
  Apple Foundation Models, Amazon Nova.
- Add source-backed explanation, not bare lists:
  architecture, pre-training data, mid-training, post-training,
  RL/distillation methods, optimizer details, agentic training,
  benchmark setup, benchmark scores, long-context/coding/agent evals,
  report figures/images, people/authorship, launch ecosystem, provider/application/gateway context.
- For closed models, label source type accurately:
  system card, model card, official announcement, API docs.
  Do not call it a paper unless there is a paper.
- Every new factual record must include source links.
- If a model/version cannot be verified from official pages, papers, model cards, system cards, arXiv, Hugging Face, GitHub, or docs, keep it as watchlist with explicit uncertainty.
- Do not fabricate benchmark numbers, methods, dates, authors, or links.

Frontend requirements:
- The page should remain cool, dense, and interactive.
- Preserve dark ops-room visual style.
- Preserve multi-level navigation:
  sticky nav -> module section -> paginated cards/table -> drawer details.
- Use vanilla JS only; no heavy framework.
- Keep mobile safe: no page-level horizontal overflow, no overlapping text, source links visible.
- Keep cards source-backed: do not hide all sources only in drawers.

Stop markers:
At the end of $report_file, include exactly one:
- CONTINUE
- STOP_NO_SOURCE_BACKED_GAPS
- STOP_BLOCKED
- STOP_TEST_FAILURE

Use STOP_NO_SOURCE_BACKED_GAPS only if the tracker already has complete source-backed full-series coverage and no useful scoped iteration remains.
Use STOP_BLOCKED if a source, network, or repository condition prevents safe progress.
Use STOP_TEST_FAILURE if validation fails and cannot be fixed in this iteration.
PROMPT

  echo "=== Iteration $iter / $MAX_ITERS ==="
  set +e
  mimo run \
    --model "$MODEL" \
    --dangerously-skip-permissions \
    --dir "$REPO" \
    "$(cat "$prompt_file")" > "$log_file" 2>&1
  rc=$?
  set -e
  echo "$rc" > "$exit_file"

  if [ "$rc" -ne 0 ]; then
    echo "STOP: mimo exited non-zero at iteration $iter. See $log_file"
    tail -n 120 "$log_file" || true
    exit "$rc"
  fi

  if [ ! -s "$report_file" ]; then
    echo "STOP: missing DONE report at $report_file"
    tail -n 120 "$log_file" || true
    exit 4
  fi

  echo "--- DONE report tail ---"
  tail -n 80 "$report_file"

  if grep -q "STOP_BLOCKED" "$report_file"; then
    echo "STOP: worker reported blocker."
    break
  fi
  if grep -q "STOP_TEST_FAILURE" "$report_file"; then
    echo "STOP: worker reported test failure."
    break
  fi
  if grep -q "STOP_NO_SOURCE_BACKED_GAPS" "$report_file"; then
    echo "STOP: worker reported no remaining source-backed gaps."
    break
  fi

  echo "--- Coordinator validation ---"
  validate_page > "$iter_dir/coordinator-validation.log" 2>&1 || {
    echo "STOP: coordinator validation failed. See $iter_dir/coordinator-validation.log"
    tail -n 160 "$iter_dir/coordinator-validation.log" || true
    exit 5
  }

  if [ -z "$(git diff --stat)" ]; then
    echo "STOP: no diff after iteration $iter."
    break
  fi

  diff_hash="$(git diff | shasum | awk '{print $1}')"
  if [ "$diff_hash" = "$last_diff_hash" ]; then
    same_diff_count=$((same_diff_count + 1))
  else
    same_diff_count=0
  fi
  last_diff_hash="$diff_hash"

  git diff --stat > "$iter_dir/diff.stat"

  if [ "$same_diff_count" -ge 1 ]; then
    echo "STOP: diff hash repeated across consecutive iterations."
    break
  fi

  commit_and_maybe_push "$iter"
done

echo
echo "Ralph Mimo AI Tracker loop finished."
echo "Reports: $RUN_DIR"
echo "Current git status:"
git status --short
echo "Current diff stat:"
git diff --stat || true
