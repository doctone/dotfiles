#!/usr/bin/env python3
"""
Pre-push hook for Claude Code.
Blocks pushes to main/master branch.
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
        print(
            "BLOCKED: Cannot push directly to main/master.\n\n"
            "You MUST:\n"
            "1. Create a feature branch\n"
            "2. Push the feature branch\n"
            "3. Create a pull request\n"
            "4. Merge via PR after review",
            file=sys.stderr
        )
        sys.exit(2)

    # Feature branch pushes are allowed
    sys.exit(0)


if __name__ == "__main__":
    main()
