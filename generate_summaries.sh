#!/usr/bin/env zsh

set -euo pipefail

input_dir="content"
output_dir="summaries"

for file in "$input_dir"/**/*.md(.N); do
  # (.N) = only files, no error if none match

  rel_path="${file#$input_dir/}"
  output="$output_dir/$rel_path"

  mkdir -p "${output:h}"

  grep -E '^#+ ' "$file" > "$output" || :
done
