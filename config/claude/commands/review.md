# Review Phase

Review the current changes before committing.

## Process

### Step 1: Analyze Changes
Run `git diff` to see all modifications.

### Step 2: Self-Review
Use the code-reviewer agent mindset to check:

**Design**
- Does this fit the architecture?
- Are abstractions appropriate?

**Implementation**
- Is the code correct?
- Are edge cases handled?
- Is error handling proper?

**Types**
- No `any` types?
- Proper type safety?

**Tests**
- Adequate coverage?
- Testing behavior, not implementation?

### Step 3: Report Findings

```
## Code Review

### Summary
[Overall assessment]

### Issues Found
[Any problems that need fixing]

### Suggestions
[Optional improvements]

### Verdict
✅ Ready to commit
   or
⚠️ Issues to address before commit
```

### Step 4: Fix Issues
If issues found:
1. List what needs to change
2. Make fixes
3. Re-review

### Step 5: Handoff
When clean, ready for `/present` and `/commit`.
