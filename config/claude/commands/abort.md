# Abort Current Task

Safely cancel the current task and clean up.

## Process

### Step 1: Identify Current State
Check:
- Current branch
- Uncommitted changes
- Active plan

### Step 2: Confirm Abort

```
## Aborting Task: [task name]

### Current State
- Branch: feat/[slug]
- Uncommitted changes: [yes/no]
- Commits on branch: [N]

### This will:
- Stash any uncommitted changes
- Switch back to main branch
- Keep the plan files in docs/plans/[slug]/

The plan can be resumed later with /resume.

Proceed with abort? (yes/no)
```

### Step 3: Clean Up
After confirmation:
1. Stash uncommitted changes (if any)
2. Switch to main branch
3. Report completion

```
✅ Task aborted safely

Uncommitted changes stashed. To recover:
  git stash pop

Plan preserved at: docs/plans/[slug]/
Resume anytime with: /resume
```

### Step 4: Optional Full Cleanup
If user wants to completely remove:
```
Delete plan files too? (yes/no)
```

If yes, remove `docs/plans/<slug>/` directory.
