# Development Phase

Execute the development work for the current commit.

## Process

### Step 1: Get Context
Review the current commit's goals from the plan.

### Step 2: Implement Changes
Make the necessary code changes:
- Follow the plan's file list
- Complete each task in the checklist
- Keep changes focused and atomic

### Step 3: Verify Quality
Check the implementation:
- No TypeScript errors
- No `any` types
- Tests pass
- Code follows project conventions

### Step 4: Report Completion

```
## Development Complete

### Changes Made
- `file.ts`: [description]
- `other.ts`: [description]

### Tasks Completed
- [x] Task 1
- [x] Task 2

### Verification
- TypeScript: ✅ No errors
- Tests: ✅ Passing
- Lint: ✅ Clean

Ready for review? (yes/no)
```

### Step 5: Handoff
Ready for `/review` phase.
