#!/bin/bash
set -euo pipefail

echo "🔧 Setting up dotfiles..."

DOTFILES_DIR="$HOME/.dotfiles"

# Check for Xcode Command Line Tools
if ! xcode-select -p &>/dev/null; then
    echo "📦 Installing Xcode Command Line Tools..."
    xcode-select --install
    echo "Please complete the installation and re-run this script."
    exit 1
fi

# Install Homebrew if needed
if ! command -v brew &>/dev/null; then
    echo "🍺 Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Run setup scripts
echo "📦 Installing packages..."
"$DOTFILES_DIR/scripts/packages.sh"

echo "🔗 Creating symlinks..."
"$DOTFILES_DIR/scripts/symlinks.sh"

# Make hook scripts executable
echo "🔐 Setting hook permissions..."
chmod +x "$DOTFILES_DIR/config/claude/hooks/"*.py

# Set up OpenCode dependencies
echo "⚙️ Setting up OpenCode..."
npm install --prefix "$HOME/.config/opencode"
(cd "$HOME/.config/opencode/ynab-mcp-server" && uv sync)

# Create memory directory for Claude
mkdir -p "$HOME/.claude-memory"

echo ""
echo "✅ Dotfiles setup complete!"
echo ""
echo "Next steps:"
echo "1. Copy env.zsh.template to env.zsh and add your tokens"
echo "   cp $DOTFILES_DIR/shell/env.zsh.template $DOTFILES_DIR/shell/env.zsh"
echo ""
echo "2. Log in to OpenCode providers:"
echo "   opencode providers login google"
echo ""
echo "3. Restart your terminal or run: source ~/.zshrc"
