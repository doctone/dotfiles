# Show git worktree in prompt
git_worktree_info() {
  if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    local worktree_path=$(git rev-parse --show-toplevel)
    local parent_dir=$(dirname "$worktree_path")
    local worktree_name=$(basename "$worktree_path")

    # Check if this is a worktree (not the main repo)
    if git worktree list | grep -q "$worktree_path" && [ "$worktree_name" != "monorepo" ]; then
      echo " %{$fg[cyan]%}[$worktree_name]%{$reset_color%}"
    fi
  fi
}

# Customize prompt to include worktree info
PROMPT='${ret_status} %{$fg[cyan]%}%c%{$reset_color%}$(git_worktree_info) $(git_prompt_info) '

# Git worktree navigation function
git-wt-cd() {
    if [ $# -eq 0 ]; then
        # Interactive mode with fzf
        local selection=$(git worktree list | fzf --height=10 --reverse)
        if [ -n "$selection" ]; then
            local path=$(echo "$selection" | awk '{print $1}')
            cd "$path"
        fi
    else
        # Direct branch name mode
        local branch="$1"
        local worktree_path=$(git worktree list | grep "\[$branch\]" | awk '{print $1}')

        if [ -z "$worktree_path" ]; then
            echo "No worktree found for branch: $branch"
            return 1
        fi

        cd "$worktree_path"
    fi
}

# Quick directory navigation
mkcd() {
    mkdir -p "$1" && cd "$1"
}
