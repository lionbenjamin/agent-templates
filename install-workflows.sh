#!/bin/bash

# Script to install workflow files to Gemini and Cursor directories

set -e

# Source directory (relative to script location)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_DIR="$SCRIPT_DIR/agents"

# Destination directories
GEMINI_DIR="$HOME/.gemini/antigravity/global_workflows"
CURSOR_DIR="$HOME/.cursor/commands"

# Check if source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Source directory not found: $SOURCE_DIR"
    exit 1
fi

# Create destination directories if they don't exist
mkdir -p "$GEMINI_DIR"
mkdir -p "$CURSOR_DIR"

# Copy markdown files to both destinations
echo "Copying workflow files..."

for file in "$SOURCE_DIR"/*.md; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        cp "$file" "$GEMINI_DIR/$filename"
        cp "$file" "$CURSOR_DIR/$filename"
        echo "  Copied: $filename"
    fi
done

echo ""
echo "Installation complete!"
echo "  Gemini workflows: $GEMINI_DIR"
echo "  Cursor commands:  $CURSOR_DIR"

