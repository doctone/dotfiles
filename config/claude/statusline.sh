#!/bin/bash
input=$(cat)

MODEL=$(echo "$input" | jq -r '.model.display_name' | sed 's/Claude //' | tr '[:upper:]' '[:lower:]')
DIR=$(echo "$input" | jq -r '.workspace.current_dir')
DIR_NAME="${DIR##*/}"

GIT=""
if git rev-parse --git-dir > /dev/null 2>&1; then
    BRANCH=$(git branch --show-current 2>/dev/null)
    [ -n "$BRANCH" ] && GIT="  $BRANCH"

    # Worktree indicator
    [ "$(git worktree list 2>/dev/null | wc -l | tr -d ' ')" -gt 1 ] && GIT="$GIT "

    # Dirty indicator
    [ -n "$(git status --porcelain 2>/dev/null)" ] && GIT="$GIT •"
fi

echo "$MODEL  $DIR_NAME$GIT"
