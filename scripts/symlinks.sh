#!/bin/bash
set -euo pipefail

DOTFILES_DIR="$HOME/.dotfiles"

echo "Creating symlinks..."

# Function to create symlink with backup
create_symlink() {
    local source="$1"
    local target="$2"

    # If target exists and is not a symlink, back it up
    if [[ -e "$target" && ! -L "$target" ]]; then
        echo "Backing up existing $target to ${target}.backup"
        mv "$target" "${target}.backup"
    fi

    # Remove existing symlink
    if [[ -L "$target" ]]; then
        rm "$target"
    fi

    # Create parent directory if needed
    mkdir -p "$(dirname "$target")"

    # Create symlink
    ln -s "$source" "$target"
    echo "✓ $target → $source"
}

# Claude configuration
create_symlink "$DOTFILES_DIR/config/claude" "$HOME/.claude"

# Shared skill store — one source of truth for every harness.
#
# Claude and OpenCode reach it through in-repo symlinks committed to this repo
# (config/claude/skills and config/opencode/skills -> ../../skills), so they need
# nothing here. Codex and Pi keep real directories in $HOME, so link them directly.
mkdir -p "$HOME/.codex" "$HOME/.pi/agent"
create_symlink "$DOTFILES_DIR/skills" "$HOME/.codex/skills"
create_symlink "$DOTFILES_DIR/skills" "$HOME/.pi/agent/skills"

# Pi configuration
mkdir -p "$HOME/.pi/agent/extensions"
create_symlink "$DOTFILES_DIR/config/pi/agent/AGENTS.md" "$HOME/.pi/agent/AGENTS.md"
create_symlink "$DOTFILES_DIR/config/pi/agent/settings.json" "$HOME/.pi/agent/settings.json"
create_symlink "$DOTFILES_DIR/config/pi/agent/extensions/skill-aliases.ts" "$HOME/.pi/agent/extensions/skill-aliases.ts"
create_symlink "$DOTFILES_DIR/config/pi/agent/extensions/auto-mode" "$HOME/.pi/agent/extensions/auto-mode"
create_symlink "$DOTFILES_DIR/config/pi/agent/extensions/plan-mode" "$HOME/.pi/agent/extensions/plan-mode"

# OpenCode configuration
create_symlink "$DOTFILES_DIR/config/opencode" "$HOME/.config/opencode"

# Worktrunk configuration
create_symlink "$DOTFILES_DIR/config/worktrunk" "$HOME/.config/worktrunk"

# Neovim configuration
create_symlink "$DOTFILES_DIR/config/nvim" "$HOME/.config/nvim"

# Shell configuration
create_symlink "$DOTFILES_DIR/shell/zshrc" "$HOME/.zshrc"

# Git configuration
create_symlink "$DOTFILES_DIR/config/git/config" "$HOME/.gitconfig"

# Ghostty configuration
create_symlink "$DOTFILES_DIR/config/ghostty/config" "$HOME/Library/Application Support/com.mitchellh.ghostty/config"
create_symlink "$DOTFILES_DIR/config/ghostty/config" "$HOME/.config/ghostty/config"

echo "✅ Symlinks created"
