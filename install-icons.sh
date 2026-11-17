#!/usr/bin/env bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

set -euo pipefail

name=com.mitchellh.ghostty
export_dir="$SCRIPT_DIR"/export
icons_dir="${XDG_DATA_HOME:-$HOME/.local/share}"/icons/hicolor

for size in 16 24 32 48 64 128 256 512 1024; do
	install -Dm644 "$export_dir/$size.png" "$icons_dir/${size}x${size}/apps/$name.png"
done

# HiDPI variants: NxN@2 holds a 2N px image
for size in 16 24 32 48 64 128 256 512; do
	install -Dm644 "$export_dir/$((size * 2)).png" "$icons_dir/${size}x${size}@2/apps/$name.png"
done

if command -v gtk-update-icon-cache &> /dev/null; then
	gtk-update-icon-cache -f -t "$icons_dir"
fi

if command -v xdg-icon-resource &> /dev/null; then
	xdg-icon-resource forceupdate
fi
