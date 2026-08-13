#!/usr/bin/env bash
# Re-fetch learn.chatgpt.com docs into knowledge/. Manual maintenance tool.
# Usage: update-knowledge.sh [--dry-run]
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
KB="$ROOT/knowledge"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

[ -d "$KB/pages" ] || { echo "error: $KB/pages not found"; exit 1; }

curl -sfL https://learn.chatgpt.com/llms.txt -o "$TMP/llms-index.txt"
grep -oE 'https://learn\.chatgpt\.com/[^) ]+' "$TMP/llms-index.txt" | sed 's/?.*//' | sort -u > "$TMP/urls.txt"
echo "found $(wc -l < "$TMP/urls.txt" | tr -d ' ') pages in llms.txt"

if [ "${1:-}" = "--dry-run" ]; then
  cat "$TMP/urls.txt"
  exit 0
fi

# Pages without an official .md twin: keep the hand-extracted copies already in the repo.
for f in docs.md resources.md videos.md guides/best-practices.md guides/build-ai-native-engineering-team.md; do
  if [ -f "$KB/pages/$f" ]; then
    mkdir -p "$TMP/pages/$(dirname "$f")"
    cp "$KB/pages/$f" "$TMP/pages/$f"
  fi
done

ok=0; fail=0
while read -r url; do
  path="${url#https://learn.chatgpt.com/}"
  case "$path" in
    docs.md|resources.md|videos.md|guides/*|docs/llms-full.txt) continue ;;  # handled above
  esac
  out="$TMP/pages/$path"
  mkdir -p "$(dirname "$out")"
  if curl -sfL "$url" -o "$out"; then ok=$((ok+1)); else fail=$((fail+1)); echo "FAIL: $url"; fi
done < "$TMP/urls.txt"
echo "downloaded ok=$ok fail=$fail"
[ "$fail" -eq 0 ] || { echo "aborting sync due to download failures"; exit 1; }

rsync -a --delete "$TMP/pages/" "$KB/pages/"
cp "$TMP/llms-index.txt" "$KB/llms-index.txt"
echo "knowledge/pages synced."
echo "NOTE: knowledge/summaries/*.md are hand-written Chinese digests - regenerate them with an LLM if pages changed."

# Repack the distributable bundle (knowledge/ itself is gitignored).
tar --exclude='.DS_Store' -czf "$ROOT/data/knowledge.pack" -C "$ROOT" knowledge
echo "data/knowledge.pack regenerated - commit it to publish the update."
