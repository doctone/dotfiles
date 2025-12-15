#!/usr/bin/env python3
"""
Pre-commit hook for Claude Code.
Blocks commits until approval and warns about main branch.
"""

import json
import subprocess
import sys


def get_current_branch() -> str:
    """Get the current git branch name."""
    result = subprocess.run(
        ["git", "rev-parse", "--abbrev-ref", "HEAD"],
        capture_output=True,
        text=True
    )
    return result.stdout.strip()


def main():
    # Read hook input from stdin
    try:
        hook_input = json.load(sys.stdin)
    except json.JSONDecodeError:
        hook_input = {}

    branch = get_current_branch()

    if branch == "main" or branch == "master":
        # Block commits on main branch
        print(
            "BLOCKED: You are on the main branch.\n\n"
            "Before committing, you MUST:\n"
            "1. Ask the user: 'You're on main. Should I create a new branch for this commit?'\n"
            "2. If yes, create the branch and switch to it\n"
            "3. Then retry the commit following the standard commit protocol",
            file=sys.stderr
        )
        sys.exit(2)

    # On feature branches, require approval
    print(
        "BLOCKED: Commit requires approval.\n\n"
        "Before committing, you MUST:\n"
        "1. Generate a commit message using the commit-message agent\n"
        "2. Present the complete message to the user\n"
        "3. Obtain explicit approval before committing",
        file=sys.stderr
    )
    sys.exit(2)


if __name__ == "__main__":
    main()
