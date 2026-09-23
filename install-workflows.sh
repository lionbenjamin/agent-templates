#!/bin/bash

# Script to install workflow files and skills to Gemini, Cursor, Claude Code, and Codex directories

set -e

FORCE=false
DRY_RUN=false
for arg in "$@"; do
    case "$arg" in
        --force|-f) FORCE=true ;;
        --dry-run|-n) DRY_RUN=true ;;
        --help|-h)
            echo "Usage: $(basename "$0") [OPTIONS]"
            echo ""
            echo "Options:"
            echo "  -f, --force    Overwrite modified files without prompting"
            echo "  -n, --dry-run  Show what would be changed without copying"
            echo "  -h, --help     Show this help message"
            exit 0
            ;;
        *)
            echo "Unknown option: $arg (use --help for usage)"
            exit 1
            ;;
    esac
done

# Source directories (relative to script location)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AGENTS_DIR="$SCRIPT_DIR/agents"
SKILLS_DIR="$SCRIPT_DIR/skills"

# Destination directories
GEMINI_WORKFLOWS_DIR="$HOME/.gemini/antigravity/global_workflows"
GEMINI_SKILLS_DIR="$HOME/.gemini/antigravity/skills"
CURSOR_DIR="$HOME/.cursor/commands"
CLAUDE_COMMANDS_DIR="$HOME/.claude/commands"
CLAUDE_SKILLS_DIR="$HOME/.claude/skills"
# Codex discovers user skills from the shared agents directory.
CODEX_SKILLS_DIR="$HOME/.agents/skills"
# opencode's global config dirs. opencode auto-loads skills from the shared
# ~/.agents/skills and ~/.claude/skills dirs above, so only agents and
# commands need their own home.
OPENCODE_AGENTS_DIR="$HOME/.config/opencode/agents"
OPENCODE_COMMANDS_DIR="$HOME/.config/opencode/commands"

# Check if agents directory exists
if [ ! -d "$AGENTS_DIR" ]; then
    echo "Error: Agents directory not found: $AGENTS_DIR"
    exit 1
fi

SKIPPED=0
COPIED=0
UNCHANGED=0

# Safe copy: skip if destination exists and differs, unless --force
safe_copy() {
    local src="$1"
    local dest="$2"

    if [ ! -e "$dest" ]; then
        if $DRY_RUN; then
            echo "    [new] $dest"
        else
            cp "$src" "$dest"
        fi
        COPIED=$((COPIED + 1))
        return 0
    fi

    if diff -q "$src" "$dest" > /dev/null 2>&1; then
        UNCHANGED=$((UNCHANGED + 1))
        return 0
    fi

    if $FORCE; then
        if $DRY_RUN; then
            echo "    [overwrite] $dest"
        else
            cp "$src" "$dest"
        fi
        COPIED=$((COPIED + 1))
        return 0
    fi

    echo "    [skipped] $dest (modified locally, use --force to overwrite)"
    SKIPPED=$((SKIPPED + 1))
    return 0
}

# Safe recursive copy for skill directories
safe_copy_dir() {
    local src_dir="$1"
    local dest_dir="$2"

    if $DRY_RUN && [ ! -d "$dest_dir" ]; then
        echo "    [new dir] $dest_dir"
    else
        mkdir -p "$dest_dir"
    fi

    for src_file in "$src_dir"/*; do
        [ -e "$src_file" ] || continue
        local basename=$(basename "$src_file")
        if [ -d "$src_file" ]; then
            safe_copy_dir "$src_file" "$dest_dir/$basename"
        else
            safe_copy "$src_file" "$dest_dir/$basename"
        fi
    done
}

# Create destination directories if they don't exist
mkdir -p "$GEMINI_WORKFLOWS_DIR"
mkdir -p "$GEMINI_SKILLS_DIR"
mkdir -p "$CURSOR_DIR"
mkdir -p "$CLAUDE_COMMANDS_DIR"
mkdir -p "$CLAUDE_SKILLS_DIR"
mkdir -p "$CODEX_SKILLS_DIR"
mkdir -p "$OPENCODE_AGENTS_DIR"
mkdir -p "$OPENCODE_COMMANDS_DIR"

# Copy workflow files to both destinations
echo "Copying workflow files..."

for file in "$AGENTS_DIR"/*.md; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        safe_copy "$file" "$GEMINI_WORKFLOWS_DIR/$filename"
        safe_copy "$file" "$CURSOR_DIR/$filename"
        # Rename plan.md to planning.md for Claude Code to avoid
        # conflicting with its built-in /plan command
        if [ "$filename" = "plan.md" ]; then
            safe_copy "$file" "$CLAUDE_COMMANDS_DIR/planning.md"
            echo "  $filename (-> planning.md for Claude Code)"
        else
        safe_copy "$file" "$CLAUDE_COMMANDS_DIR/$filename"
        fi

        # opencode agents. plan -> planning to avoid the built-in /plan.
        if [ "$filename" = "plan.md" ]; then
            safe_copy "$file" "$OPENCODE_AGENTS_DIR/planning.md"
        else
            safe_copy "$file" "$OPENCODE_AGENTS_DIR/$filename"
        fi
        echo "   $filename"
    fi
done

# Copy skills to Gemini, Claude Code, and Codex skill directories.
# Also copy SKILL.md files as Claude Code slash commands.
if [ -d "$SKILLS_DIR" ]; then
    echo ""
    echo "Copying skills..."

    for skill_dir in "$SKILLS_DIR"/*/; do
        if [ -d "$skill_dir" ]; then
            skill_name=$(basename "$skill_dir")
            safe_copy_dir "$skill_dir" "$GEMINI_SKILLS_DIR/$skill_name"
            safe_copy_dir "$skill_dir" "$CLAUDE_SKILLS_DIR/$skill_name"
            safe_copy_dir "$skill_dir" "$CODEX_SKILLS_DIR/$skill_name"
            if [ -f "$skill_dir/SKILL.md" ]; then
                safe_copy "$skill_dir/SKILL.md" "$CLAUDE_COMMANDS_DIR/$skill_name.md"
                 # opencode slash commands from SKILL.md (name is valid frontmatter)
                safe_copy "$skill_dir/SKILL.md" "$OPENCODE_COMMANDS_DIR/$skill_name.md"
            fi
            echo "   $skill_name"
        fi
    done
fi

echo ""
if $DRY_RUN; then
    echo "Dry run complete (no files were modified)."
else
    echo "Installation complete!"
fi
echo "  Copied: $COPIED, Unchanged: $UNCHANGED, Skipped: $SKIPPED"
if [ $SKIPPED -gt 0 ]; then
    echo "  $SKIPPED file(s) skipped because they were modified locally."
    echo "  Run with --force to overwrite them."
fi
