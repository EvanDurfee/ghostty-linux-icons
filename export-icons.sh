#!/usr/bin/env bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

set -euo pipefail

src="$SCRIPT_DIR"/ghostty.png
export_dir="$SCRIPT_DIR"/export

# Every pixel size needed by install-icons.sh, including HiDPI (@2) variants
for size in 16 24 32 48 64 96 128 256 512 1024; do
	magick "$src" -filter Lanczos -resize ${size}x${size} -strip "$export_dir/$size.png"
done
