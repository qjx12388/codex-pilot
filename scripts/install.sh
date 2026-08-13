#!/usr/bin/env bash
# Install codex-pilot as a personal Codex skill.
# Default: symlink ~/.agents/skills/codex-pilot -> this repo (edits take effect immediately).
# --copy:  rsync a standalone copy instead.
set -euo pipefail

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DEST_DIR="$HOME/.agents/skills"
DEST="$DEST_DIR/codex-pilot"
MODE="link"
[ "${1:-}" = "--copy" ] && MODE="copy"

[ -f "$SRC/SKILL.md" ] || { echo "error: $SRC/SKILL.md not found"; exit 1; }
mkdir -p "$DEST_DIR"

if [ -L "$DEST" ]; then rm "$DEST"; elif [ -d "$DEST" ]; then rm -rf "$DEST"; fi

if [ "$MODE" = "copy" ]; then
  rsync -a --delete --exclude '.git' --exclude 'knowledge/' "$SRC/" "$DEST/"
  echo "installed (copy) -> $DEST"
else
  ln -s "$SRC" "$DEST"
  echo "installed (symlink) -> $DEST -> $SRC"
fi

# Unpack the bundled knowledge pack if knowledge/ is not present yet.
if [ ! -d "$DEST/knowledge/summaries" ]; then
  [ -f "$DEST/data/knowledge.pack" ] || { echo "error: $DEST/data/knowledge.pack not found"; exit 1; }
  tar -xzf "$DEST/data/knowledge.pack" -C "$DEST"
  echo "knowledge pack unpacked -> $DEST/knowledge/"
fi

test -f "$DEST/SKILL.md" && test -d "$DEST/knowledge/summaries" \
  && echo "OK: SKILL.md and knowledge/ are in place. Restart Codex if the skill does not appear."
