#!/usr/bin/env bash
set -euo pipefail

# Variables
URL="https://github.com/catppuccin/vscode-icons/releases/download/v1.26.0/catppuccin-vsc-icons-1.26.0.vsix"
FILE="archive.vsix"
DIR_TO_MOVE="extension"
DEST="$HOME/.config/nvim/icons/catppuccin"

# Script
if [ ! -d "$DEST" ]; then

    TMPDIR=$(mktemp -d)
    trap 'rm -rf "$TMPDIR"' EXIT

    wget -q "$URL" -O "$TMPDIR/$FILE"
    unzip -q "$TMPDIR/$FILE" -d "$TMPDIR"
    mkdir -p "$(dirname "$DEST")"
    mv "$TMPDIR/$DIR_TO_MOVE" "$DEST"

fi
