#!/usr/bin/env bash
# generate_v_index.sh
# Creates ./V/index.html with a file list for each project vdocs

set -euo pipefail
ROOT="$(pwd)"
DEST_ROOT="$ROOT/V"
OUT="$DEST_ROOT/index.html"

if [ ! -d "$DEST_ROOT" ]; then
  echo "$DEST_ROOT does not exist. Run consolidate_vdocs.sh first."
  exit 1
fi

cat > "$OUT" <<'HTML'
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8"/>
<title>V — Vision Documents</title>
<meta name="viewport" content="width=device-width,initial-scale=1"/>
<style>
body{font-family:system-ui,-apple-system,Segoe UI,Roboto,Arial,sans-serif;margin:24px;color:#111}
h1{margin-bottom:.2em}
.project{margin:18px 0;padding:12px;border-radius:8px;border:1px solid #e6e6e6;background:#fafafa}
.filelist{margin-top:8px}
a{color:#0366d6;text-decoration:none}
small{color:#666}
</style>
</head>
<body>
<h1>V — Vision Documents</h1>
<p>Automatically generated index. Files are copied from each project's <code>vdocs</code> directory.</p>
<div id="projects">
HTML

# iterate projects
while IFS= read -r -d '' proj; do
  proj_rel="${proj#./V/}"
  proj_name="$(basename "$proj")"
  cat >> "$OUT" <<HTML
<div class="project">
  <strong>${proj_rel}</strong><br><small>path: ./V/${proj_rel}/vdocs</small>
  <div class="filelist">
HTML
  # list files (limit to top-level, feel free to change)
  while IFS= read -r -d '' file; do
    file_rel="$(realpath --relative-to="$DEST_ROOT" "$file")"
    fname="$(basename "$file")"
    # make links open in new tab for non-html (pdf/images)
    cat >> "$OUT" <<HTML
    <div>• <a href="./${file_rel}" target="_blank" rel="noopener">${fname}</a></div>
HTML
  done < <(find "$proj/vdocs" -maxdepth 2 -type f -print0 | sort -z)
  cat >> "$OUT" <<'HTML'
  </div>
</div>
HTML
done < <(find ./V -mindepth 1 -maxdepth 2 -type d -name vdocs -print0 | xargs -0 -n1 dirname -I)

cat >> "$OUT" <<'HTML'
</div>
</body>
</html>
HTML

echo "Index generated at $OUT"
