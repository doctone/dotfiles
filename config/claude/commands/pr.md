# Create Pull Request

Generate and create a pull request for the current branch.

## Process

### Step 1: Verify Ready State
Check:
- All planned commits complete
- On feature branch
- Branch pushed to remote
- No uncommitted changes

### Step 2: Gather Information
Analyze:
- All commits on branch (`git log main..HEAD`)
- Full diff from main (`git diff main...HEAD`)
- Plan files for context

### Step 3: Generate PR Description
Use pr-description agent to create description.

### Step 4: Present for Approval

```
## Pull Request

**Title**: [PR title]

**Description**:
## Summary
- [bullet points]

## Changes
- [list of changes]

## Test Plan
- [ ] [test steps]

---

Create this PR? (yes/edit/no)
```

### Step 5: Handle Response

**If yes**: Create PR

**If edit**: Allow modifications

**If no**: Regenerate

### Step 6: Create PR
```bash
gh pr create --title "[title]" --body "[description]"
```

### Step 7: Report Success

```
✅ Pull Request Created

[PR URL]

Title: [title]
Base: main ← [branch]

Next steps:
- Share PR for review
- Address feedback
- Merge when approved
```
