# Execute Next Commit

Execute the next planned commit in the current task.

## Process

### Step 1: Find Current Plan
Look for active plan in `docs/plans/*/plan.md` with unchecked items.

If no plan found, inform user to run `/begin` or `/resume`.

### Step 2: Identify Next Commit
Find the first unchecked `[ ]` item in the plan.

### Step 3: Development Phase
Implement the changes for this commit:
- Follow the defined goals
- Modify only the listed files
- Keep changes atomic and focused

### Step 4: Review Phase
Self-review the changes:
- Check for bugs or issues
- Verify TypeScript types
- Ensure tests pass
- Check for any `any` types (must fix)

### Step 5: Present Changes
Show the user what was done:

```
## Commit: [commit goal]

### Changes Made
- [file]: [what changed]

### Diff Summary
[key changes]

Ready to commit? (yes/no)
```

### Step 6: Commit
After approval:
1. Generate commit message using commit-message agent
2. Present message for approval
3. Create the commit
4. Mark item as complete `[x]` in plan.md

### Step 7: Report Progress
```
✅ Commit 2/5 complete: [goal]

Next: [next commit goal]
Run /next to continue or /status to see progress.
```
