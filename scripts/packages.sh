#!/bin/bash
set -euo pipefail

echo "Installing Homebrew packages..."

# Core CLI tools
PACKAGES=(
    "fd"        # Better find
    "bat"       # Better cat
    "eza"       # Better ls
    "fzf"       # Fuzzy finder
    "ripgrep"   # Better grep
    "lazygit"   # Git TUI
    "gh"        # GitHub CLI
)

for package in "${PACKAGES[@]}"; do
    if brew list "$package" &>/dev/null; then
        echo "✓ $package already installed"
    else
        echo "Installing $package..."
        brew install "$package"
    fi
done

echo "✅ Packages installed"
