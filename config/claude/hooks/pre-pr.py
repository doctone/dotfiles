#!/usr/bin/env python3
"""
Pre-PR hook for Claude Code.
Requires PR description approval before creation.
"""

import json
import sys


def main():
    # Read hook input from stdin
    try:
        hook_input = json.load(sys.stdin)
    except json.JSONDecodeError:
        hook_input = {}

    print(
        "BLOCKED: PR creation requires approval.\n\n"
        "Before creating the PR, you MUST:\n"
        "1. Generate a PR description using the pr-description agent\n"
        "2. Present the complete title and description to the user\n"
        "3. Obtain explicit approval before creating the PR",
        file=sys.stderr
    )
    sys.exit(2)


if __name__ == "__main__":
    main()
