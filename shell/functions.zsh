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

# Quick directory navigation
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Open worktrees in a cmux split layout:
#   ┌──────────┬──────────┐
#   │          │  impl-1  │
#   │ planning ├──────────┤
#   │          │  impl-2  │
#   └──────────┴──────────┘
cmux-worktrees() {
    if ! command -v cmux &>/dev/null; then
        echo "Error: cmux not found" >&2
        return 1
    fi

    local base="/Users/samjames/xylo"
    local planning="$base/monorepo-planning"
    local impl1="$base/monorepo-impl-1"
    local impl2="$base/monorepo-impl-2"

    for dir in "$planning" "$impl1" "$impl2"; do
        if [[ ! -d "$dir" ]]; then
            echo "Error: worktree not found: $dir" >&2
            return 1
        fi
    done

    # Create workspace — initial terminal becomes the planning pane
    cmux new-workspace >/dev/null
    sleep 0.3

    # Rename workspace
    cmux workspace-action --action rename --title "Worktrees" >/dev/null

    # cd to planning in the initial (focused) terminal
    cmux send "cd $planning && clear"
    cmux send-key enter
    sleep 0.1

    # Create right split for impl-1
    local impl1_out=$(cmux new-pane --type terminal --direction right)
    local impl1_surface=$(echo "$impl1_out" | awk '{print $2}')
    sleep 0.3
    cmux send --surface "$impl1_surface" "cd $impl1 && clear"
    cmux send-key --surface "$impl1_surface" enter
    sleep 0.1

    # Create down split from impl-1 for impl-2
    local impl2_out=$(cmux new-pane --type terminal --direction down)
    local impl2_surface=$(echo "$impl2_out" | awk '{print $2}')
    sleep 0.3
    cmux send --surface "$impl2_surface" "cd $impl2 && clear"
    cmux send-key --surface "$impl2_surface" enter

    # Rename tabs
    cmux rename-tab --surface "$impl1_surface" "impl-1" 2>/dev/null
    cmux rename-tab --surface "$impl2_surface" "impl-2" 2>/dev/null

    echo "Worktrees layout ready: planning | impl-1 / impl-2"
}
