#!/usr/bin/env zsh

set -euo pipefail

input_dir="content"
output_dir="summaries"

for file in "$input_dir"/**/*.md(.N); do

  rel_path="${file#$input_dir/}"

  md_output="$output_dir/$rel_path"
  pdf_output="${md_output%.md}.pdf"

  mkdir -p "${md_output:h}"

  # Build title from path
  base="${rel_path%.md}"
  title="${base//\// > }"

# Get last modified date
 updated=$(stat -f "%Sm" -t "%Y-%m-%d" "$file")

  # Generate Markdown checklist summary
  {
    print "# COPS Manual"
    print "## $title"
    print "updated $updated"
    print "</br>"
    print ""

    awk '
      /^#+ / {
        match($0, /^#+/)
        level = RLENGTH

        sub(/^#+ /, "")

        indent = ""
        for (i = 1; i < level; i++) {
          indent = indent "    "
        }

        print indent "- [ ] " $0
      }
    ' "$file"

  } > "$md_output" || :

  # Generate PDF from original markdown
  pandoc "$md_output" -o "$pdf_output" --template eisvogel

done
