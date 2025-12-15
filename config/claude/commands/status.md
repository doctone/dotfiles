# Show Task Status

Display the current progress of the active task.

## Process

### Step 1: Find Active Plan
Search `docs/plans/*/plan.md` for plans with unchecked items.

### Step 2: Calculate Progress
Count completed `[x]` vs total `[ ]` items.

### Step 3: Display Status

```
## Current Task: [task name]
Branch: feat/[slug]

## Progress: [X/Y] commits complete

### Completed
✅ Commit 1: [goal]
✅ Commit 2: [goal]

### Remaining
⬜ Commit 3: [goal]
⬜ Commit 4: [goal]

### Next Action
Run /next to execute: [next commit goal]
```

### If No Active Plan

```
No active task found.

Run /begin <task> to start new work
Run /resume to continue an existing plan
```

### Show Git Status
Also display:
- Current branch
- Uncommitted changes (if any)
- Commits ahead of main
