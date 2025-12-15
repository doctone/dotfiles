# Present Changes

Show the user what was done and get approval to commit.

## Process

### Step 1: Gather Information
Collect:
- Files changed
- Summary of modifications
- Diff output

### Step 2: Present Summary

```
## Changes Ready for Commit

### Goal
[What this commit achieves]

### Files Modified
| File | Changes |
|------|---------|
| `path/to/file.ts` | [description] |
| `path/to/other.ts` | [description] |

### Key Changes

**[file.ts]**
- Added [functionality]
- Modified [component]

**[other.ts]**
- Updated [logic]

### Diff Preview
[Show key parts of the diff, not everything]

---

Approve these changes? (yes/no/show more)
```

### Step 3: Handle Response

**If yes**: Proceed to commit

**If no**: Ask what needs to change

**If show more**: Display full diff or specific files

### Step 4: Handoff
When approved, ready for `/commit`.
