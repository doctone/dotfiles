---
name: ralph
description: Start a Ralph Wiggum autonomous loop with a given prompt. Use when the user asks to run or set up a Ralph loop.
---

# Start Ralph Loop

Start a Ralph Wiggum loop with the given prompt.

## Arguments
- The prompt and options for the Ralph loop, as given by the user

## Instructions

Run the setup script to initialize the Ralph loop:

```bash
/Users/samjames/.claude/plugins/marketplaces/claude-code-plugins/plugins/ralph-wiggum/scripts/setup-ralph-loop.sh [prompt and options the user gave]
```

After running this command, read the contents of `.claude/ralph-loop.local.md` and begin working on the task described in that file.
