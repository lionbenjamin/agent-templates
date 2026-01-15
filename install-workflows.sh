#!/bin/bash

# Script to install workflow files and skills to Gemini and Cursor directories

set -e

# Source directories (relative to script location)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AGENTS_DIR="$SCRIPT_DIR/agents"
SKILLS_DIR="$SCRIPT_DIR/skills"

# Destination directories
GEMINI_WORKFLOWS_DIR="$HOME/.gemini/antigravity/global_workflows"
GEMINI_SKILLS_DIR="$HOME/.gemini/antigravity/skills"
CURSOR_DIR="$HOME/.cursor/commands"

# Check if agents directory exists
if [ ! -d "$AGENTS_DIR" ]; then
    echo "Error: Agents directory not found: $AGENTS_DIR"
    exit 1
fi

# Create destination directories if they don't exist
mkdir -p "$GEMINI_WORKFLOWS_DIR"
mkdir -p "$GEMINI_SKILLS_DIR"
mkdir -p "$CURSOR_DIR"

# Copy workflow files to both destinations
echo "📋 Copying workflow files..."

for file in "$AGENTS_DIR"/*.md; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        cp "$file" "$GEMINI_WORKFLOWS_DIR/$filename"
        cp "$file" "$CURSOR_DIR/$filename"
        echo "  ✓ $filename"
    fi
done

# Copy skills to Gemini skills directory
if [ -d "$SKILLS_DIR" ]; then
    echo ""
    echo "🛠️  Copying skills..."
    
    for skill_dir in "$SKILLS_DIR"/*/; do
        if [ -d "$skill_dir" ]; then
            skill_name=$(basename "$skill_dir")
            # Copy entire skill directory
            cp -r "$skill_dir" "$GEMINI_SKILLS_DIR/"
            echo "  ✓ $skill_name"
        fi
    done
fi

echo ""
echo "✅ Installation complete!"
echo "   Gemini workflows: $GEMINI_WORKFLOWS_DIR"
echo "   Gemini skills:    $GEMINI_SKILLS_DIR"
echo "   Cursor commands:  $CURSOR_DIR"

