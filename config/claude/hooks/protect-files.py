#!/usr/bin/env python3
"""
File protection hook for Claude Code.
Asks permission before deleting files outside ~/projects.
"""

import json
import os
import re
import sys


def is_protected_path(path: str) -> bool:
    """Check if a path is outside the projects directory."""
    home = os.path.expanduser("~")
    projects_dir = os.path.join(home, "projects")
    xylo_dir = os.path.join(home, "xylo")

    # Expand the path
    expanded = os.path.expanduser(path)
    if not os.path.isabs(expanded):
        expanded = os.path.abspath(expanded)

    # Allow operations within projects or xylo directories
    if expanded.startswith(projects_dir) or expanded.startswith(xylo_dir):
        return False

    return True


def contains_delete_operation(command: str) -> tuple[bool, str]:
    """Check if command contains a delete operation and extract the path."""
    # Patterns that indicate file deletion
    delete_patterns = [
        r'rm\s+(?:-[rf]+\s+)?([^\s;|&]+)',
        r'unlink\s+([^\s;|&]+)',
        r'rmdir\s+([^\s;|&]+)',
    ]

    for pattern in delete_patterns:
        match = re.search(pattern, command)
        if match:
            return True, match.group(1)

    return False, ""


def main():
    # Read hook input from stdin
    try:
        hook_input = json.load(sys.stdin)
    except json.JSONDecodeError:
        sys.exit(0)  # Allow if can't parse

    # Get the command being executed
    tool_input = hook_input.get("tool_input", {})
    command = tool_input.get("command", "")

    if not command:
        sys.exit(0)  # Allow if no command

    # Check for delete operations
    is_delete, path = contains_delete_operation(command)

    if is_delete and is_protected_path(path):
        print(
            f"BLOCKED: Attempting to delete file outside projects directory.\n\n"
            f"Path: {path}\n\n"
            f"Before deleting files outside ~/projects or ~/xylo, you MUST:\n"
            f"1. Explain why this file needs to be deleted\n"
            f"2. Obtain explicit permission from the user",
            file=sys.stderr
        )
        sys.exit(2)

    # Allow the operation
    sys.exit(0)


if __name__ == "__main__":
    main()
