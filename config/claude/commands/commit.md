# Create Commit

Generate and execute a commit for the current changes.

## Process

### Step 1: Stage Changes
Review and stage appropriate files:
```bash
git add [files]
```

### Step 2: Generate Commit Message
Use commit-message agent to create a conventional commit message.

### Step 3: Present for Approval

```
## Commit Message

```
feat(scope): subject line

Body explaining why this change was made.
```

Approve this commit message? (yes/edit/no)
```

### Step 4: Handle Response

**If yes**: Execute commit

**If edit**: Allow user to modify message

**If no**: Generate new message

### Step 5: Execute Commit
```bash
git commit -m "[message]"
```

### Step 6: Update Plan
Mark the commit as complete in `plan.md`:
- Change `[ ]` to `[x]`
- Add commit SHA as reference

### Step 7: Report Success

```
✅ Commit created: [short SHA]

[commit message]

Progress: [X/Y] commits complete
Run /next for the next commit
Run /status to see full progress
```
