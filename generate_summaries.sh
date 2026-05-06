#!/usr/bin/env zsh

set -euo pipefail

input_dir="content"
output_dir="summaries"

for file in "$input_dir"/**/*.md(.N); do

  rel_path="${file#$input_dir/}"
  output="$output_dir/$rel_path"

  mkdir -p "${output:h}"

  awk '
    /^#+ / {
      # count heading level
      match($0, /^#+/)
      level = RLENGTH

      # remove leading # and space
      sub(/^#+ /, "")

      # build indentation (4 spaces per level after top)
      indent = ""
      for (i = 1; i < level; i++) {
        indent = indent "    "
      }

      print indent "- [ ] " $0
    }
  ' "$file" > "$output" || :
done
