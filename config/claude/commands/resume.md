# Resume Existing Plan

Continue work on an existing task plan.

## Process

### Step 1: Find Plans
Search `docs/plans/*/plan.md` for all existing plans.

### Step 2: Identify Status
For each plan, determine:
- Total commits planned
- Commits completed
- Whether it's active (has unchecked items)

### Step 3: Present Options

If multiple incomplete plans exist:
```
## Existing Plans

1. **user-authentication** (3/5 commits)
   Branch: feat/user-authentication
   Next: Add password validation

2. **api-refactor** (1/4 commits)
   Branch: feat/api-refactor
   Next: Extract service layer

Which plan would you like to resume? (1/2)
```

If single incomplete plan:
```
## Resuming: user-authentication

Progress: 3/5 commits complete
Branch: feat/user-authentication

### Completed
✅ Add user model
✅ Create auth endpoints
✅ Add JWT handling

### Remaining
⬜ Add password validation
⬜ Write integration tests

Switching to branch and ready to continue.
Run /next to execute the next commit.
```

### Step 4: Switch Branch
Checkout the appropriate feature branch:
```bash
git checkout feat/<slug>
```

### Step 5: Verify State
Check for any uncommitted changes or conflicts.
