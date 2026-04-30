# Git
alias lg='lazygit'

# Xylo
alias open-plan='$HOME/xylo/monorepo/scripts/open-plan.sh'

# Evening session setup
evening-session() {
  # Create Planning workspace
  cmux new-workspace --command "cd /Users/samjames/xylo/monorepo-planning && git fetch origin main && git merge origin/main --no-edit && echo 'Planning worktree synced and ready - use /begin to start new features'"

  # Get the workspace ID for next operations
  PLANNING_WS=$(cmux list-workspaces | head -1 | awk '{print $1}')

  # Create Implementation workspace
  cmux new-workspace --command "cd /Users/samjames/xylo/monorepo-impl-1 && git fetch origin main && git merge origin/main --no-edit && echo 'Impl 1 synced and ready - use /resume to continue work'"

  # Get the implementation workspace ID
  IMPL_WS=$(cmux list-workspaces | tail -1 | awk '{print $1}')

  # Add split pane for impl-2
  cmux new-split right --workspace $IMPL_WS --command "cd /Users/samjames/xylo/monorepo-impl-2 && git fetch origin main && git merge origin/main --no-edit && echo 'Impl 2 synced and ready - use /resume to continue work'"
}

# Modern CLI replacements (if installed)
command -v bat &> /dev/null && alias cat='bat'
command -v eza &> /dev/null && alias ls='eza'
command -v fd &> /dev/null && alias find='fd'
