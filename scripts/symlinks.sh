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

# Pi configuration
mkdir -p "$HOME/.pi/agent/skills" "$HOME/.pi/agent/extensions"
create_symlink "$DOTFILES_DIR/config/pi/agent/AGENTS.md" "$HOME/.pi/agent/AGENTS.md"
create_symlink "$DOTFILES_DIR/config/pi/agent/settings.json" "$HOME/.pi/agent/settings.json"
create_symlink "$DOTFILES_DIR/config/pi/agent/skills/superpowers" "$HOME/.pi/agent/skills/superpowers"
create_symlink "$DOTFILES_DIR/config/pi/agent/extensions/skill-aliases.ts" "$HOME/.pi/agent/extensions/skill-aliases.ts"

# OpenCode configuration
create_symlink "$DOTFILES_DIR/config/opencode" "$HOME/.config/opencode"

# Worktrunk configuration
create_symlink "$DOTFILES_DIR/config/worktrunk" "$HOME/.config/worktrunk"

# Shell configuration
create_symlink "$DOTFILES_DIR/shell/zshrc" "$HOME/.zshrc"

# Git configuration
create_symlink "$DOTFILES_DIR/config/git/config" "$HOME/.gitconfig"

# Ghostty configuration
create_symlink "$DOTFILES_DIR/config/ghostty/config" "$HOME/Library/Application Support/com.mitchellh.ghostty/config"

echo "✅ Symlinks created"
