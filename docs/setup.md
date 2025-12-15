# Dotfiles Setup Guide

## Quick Start

```bash
# Clone and apply
git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./apply.sh
```

## What's Included

### Shell (Oh My Zsh)
- Custom aliases and functions
- Git worktree navigation
- Modern CLI tool replacements (bat, eza, fd)

### Git
- Useful aliases (co, cm, wf for worktrees)
- Protected main branch (via Claude hooks)

### Claude Code
- 4 specialized agents
- 14 workflow commands
- Git protection hooks
- MCP servers (Memory + GitHub)

## Commands Reference

### Workflow
| Command | Description |
|---------|-------------|
| `/begin <task>` | Start new work with planning |
| `/next` | Execute next planned commit |
| `/status` | Show current progress |
| `/resume` | Continue existing plan |
| `/abort` | Cancel current task |
| `/pr` | Create pull request |

### Standalone
| Command | Description |
|---------|-------------|
| `/research` | Explore codebase |
| `/plan` | Create implementation plan |
| `/review` | Review current changes |
| `/commit` | Create commit |

### Memory
| Command | Description |
|---------|-------------|
| `/remember <info>` | Store for later |
| `/recollect <topic>` | Recall stored info |

## Configuration

### Add GitHub Token

For the GitHub MCP server:

```bash
# Option 1: Use gh CLI (recommended)
echo 'export GITHUB_TOKEN=$(gh auth token)' >> ~/.dotfiles/shell/env.zsh

# Option 2: Manual token
echo 'export GITHUB_TOKEN="your_token_here"' >> ~/.dotfiles/shell/env.zsh
```

### Customize

- **Aliases**: Edit `~/.dotfiles/shell/aliases.zsh`
- **Functions**: Edit `~/.dotfiles/shell/functions.zsh`
- **Git**: Edit `~/.dotfiles/config/git/config`
- **Claude**: Edit files in `~/.dotfiles/config/claude/`

## Updating

```bash
cd ~/.dotfiles
git pull
./apply.sh
```
