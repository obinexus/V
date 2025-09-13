#!/usr/bin/env bash
# consolidate_vdocs.sh
# Usage: ./consolidate_vdocs.sh [--move] [--dry-run]
# Copies every **/vdocs directory into ./V/<project>/vdocs
# If --move is provided it moves instead of copying.
# If --dry-run prints actions without doing them.

set -euo pipefail
SHOULD_MOVE=0
DRY_RUN=0

for arg in "$@"; do
  case "$arg" in
    --move) SHOULD_MOVE=1 ;;
    --dry-run) DRY_RUN=1 ;;
    *) ;;
  esac
done

ROOT="$(pwd)"
DEST_ROOT="$ROOT/V"
mkdir -p "$DEST_ROOT"

echo "Scanning for 'vdocs' directories under $ROOT ..."

# find all vdocs dirs, excluding the V/ we create
mapfile -t VDOCS < <(find . -type d -name vdocs -not -path "./V/*" -print)

if [ ${#VDOCS[@]} -eq 0 ]; then
  echo "No vdocs directories found."
  exit 0
fi

for v in "${VDOCS[@]}"; do
  # normalize: ./some/project/vdocs -> some/project
  proj_dir="$(dirname "$v")"
  # create a safe project name by replacing ./ and / with --
  proj_slug="$(echo "$proj_dir" | sed -E 's#^\./##; s#/#--#g')"
  target="$DEST_ROOT/$proj_slug/vdocs"
  if [ "$DRY_RUN" -eq 1 ]; then
    if [ "$SHOULD_MOVE" -eq 1 ]; then
      echo "[DRY] mv \"$v\" -> \"$target\""
    else
      echo "[DRY] cp -r \"$v\" -> \"$target\""
    fi
    continue
  fi

  mkdir -p "$target"
  echo "Copying: $v -> $target"
  if [ "$SHOULD_MOVE" -eq 1 ]; then
    # move contents; keep source dir if empty
    mv -v "$v"/* "$target/" 2>/dev/null || true
    # attempt to remove empty vdocs dir
    rmdir --ignore-fail-on-non-empty "$v" 2>/dev/null || true
  else
    # copy preserving file attributes
    cp -a "$v/." "$target/"
  fi

  # preserve an origin file for provenance
  echo "ORIGIN: $ROOT/$v" > "$target/._ORIGIN.txt"
done

echo "Done. Consolidated ${#VDOCS[@]} vdocs into $DEST_ROOT"
