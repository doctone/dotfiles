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

# Shell configuration
create_symlink "$DOTFILES_DIR/shell/zshrc" "$HOME/.zshrc"

# Git configuration
create_symlink "$DOTFILES_DIR/config/git/config" "$HOME/.gitconfig"

echo "✅ Symlinks created"
