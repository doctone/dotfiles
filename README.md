# Dotfiles

Personal machine configuration for macOS. Automates setup of development tools, shell environment, and Claude Code workflows.

## Quick Start

```bash
# Fresh install
git clone https://github.com/doctone/dotfiles.git ~/.dotfiles
cd ~/.dotfiles && ./apply.sh

# Update existing
cd ~/.dotfiles && git pull && ./apply.sh
```

The setup is idempotent—run it on a fresh machine or to update an existing setup.

## What's Included

### Shell (Oh My Zsh)

- **Theme**: robbyrussell
- **Custom functions**: Git worktree navigation with fzf
- **Aliases**: `lg` (lazygit), `wt` (worktree switcher)
- **Modern CLI tools**: bat, eza, fd (aliased to cat, ls, find when available)

### Git

```bash
git co        # checkout
git cm "msg"  # commit -m
git w         # worktree
git wl        # worktree list
git wf <name> # create worktree from main
```

### CLI Tools Installed

| Tool | Purpose |
|------|---------|
| `fd` | Better find |
| `bat` | Better cat with syntax highlighting |
| `eza` | Better ls |
| `fzf` | Fuzzy finder |
| `ripgrep` | Better grep |
| `lazygit` | Git TUI |
| `gh` | GitHub CLI |

## Claude Code Configuration

### Agents

| Agent | Purpose |
|-------|---------|
| `code-reviewer` | Design, implementation, tests, patterns review |
| `test-writer` | Behavior-driven test generation |
| `commit-message` | Conventional commit formatting |
| `pr-description` | PR title and description generation |

### Workflow Commands

**Orchestration** — Full development cycle:

| Command | Description |
|---------|-------------|
| `/begin <task>` | Start new work with research and planning |
| `/next` | Execute next planned commit |
| `/status` | Show current progress |
| `/resume` | Continue existing plan |
| `/abort` | Cancel current task safely |
| `/pr` | Create pull request |

**Standalone** — Individual phases:

| Command | Description |
|---------|-------------|
| `/research` | Explore codebase for context |
| `/plan` | Create implementation plan |
| `/signoff` | Get user approval |
| `/dev` | Development phase |
| `/review` | Self-review changes |
| `/present` | Show changes to user |
| `/commit` | Create commit with approval |

**Memory** — Cross-session persistence:

| Command | Description |
|---------|-------------|
| `/remember <info>` | Store knowledge for later |
| `/recollect <topic>` | Recall stored memories |

### Git Protection Hooks

| Hook | Behavior |
|------|----------|
| `pre-commit` | Blocks commits on main, requires message approval |
| `pre-push` | Blocks push to main/master |
| `pre-pr` | Requires PR description approval |
| `protect-files` | Asks before deleting files outside projects |

### MCP Servers

- **Memory**: Persistent storage at `~/.claude-memory/memory.json`
- **GitHub**: API access using `$GITHUB_TOKEN`

## Post-Install Setup

### 1. Configure GitHub Token

For the GitHub MCP server:

```bash
# Option 1: Use gh CLI (recommended)
echo 'export GITHUB_TOKEN=$(gh auth token)' >> ~/.dotfiles/shell/env.zsh

# Option 2: Manual token
echo 'export GITHUB_TOKEN="ghp_your_token"' >> ~/.dotfiles/shell/env.zsh
```

### 2. Restart Terminal

```bash
source ~/.zshrc
# or just open a new terminal
```

### 3. Test Commands

Start a new Claude Code session and try:
- `/status` — Should show no active task
- `/begin test-feature` — Should start the workflow

## Directory Structure

```
~/.dotfiles/
├── apply.sh                 # Main setup script
├── scripts/
│   ├── packages.sh         # Homebrew packages
│   └── symlinks.sh         # Symlink management
├── config/
│   ├── claude/
│   │   ├── CLAUDE.md       # Development guidelines
│   │   ├── settings.json   # Permissions, MCP, hooks
│   │   ├── agents/         # 4 specialized agents
│   │   ├── commands/       # 14 workflow commands
│   │   └── hooks/          # 4 protection hooks
│   └── git/config          # Git aliases
├── shell/
│   ├── zshrc               # Main shell config
│   ├── aliases.zsh         # Custom aliases
│   ├── functions.zsh       # Shell functions
│   └── env.zsh.template    # Secrets template
└── docs/
    └── setup.md            # Detailed documentation
```

## Customization

| What | Where |
|------|-------|
| Shell aliases | `~/.dotfiles/shell/aliases.zsh` |
| Shell functions | `~/.dotfiles/shell/functions.zsh` |
| Git config | `~/.dotfiles/config/git/config` |
| Claude agents | `~/.dotfiles/config/claude/agents/` |
| Claude commands | `~/.dotfiles/config/claude/commands/` |
| Allowed tools | `~/.dotfiles/config/claude/settings.json` |

## Symlinks Created

| Source | Target |
|--------|--------|
| `~/.dotfiles/config/claude` | `~/.claude` |
| `~/.dotfiles/shell/zshrc` | `~/.zshrc` |
| `~/.dotfiles/config/git/config` | `~/.gitconfig` |

Existing files are backed up with `.backup` extension.

## Philosophy

- **Quality over speed** — Take time to plan and review
- **Simple solutions** — Avoid over-engineering
- **Security first** — Never commit secrets, protect main branch
- **Behavior testing** — Test what users experience, not implementation
