# Plan Phase

Create an implementation plan for a task.

## Input
Task to plan: $ARGUMENTS

## Process

### Step 1: Understand Requirements
Clarify the task scope and goals.

### Step 2: Break Into Commits
Divide the work into atomic commits:
- Each commit = one logical change
- Commits should be independently reviewable
- Order commits by dependency

### Step 3: Define Each Commit

For each commit, specify:
- **Goal**: What this commit achieves
- **Files**: What files will be modified
- **Checklist**: Specific tasks within the commit

### Step 4: Output Plan

```markdown
## Plan: [task name]

### Summary
[Brief description of the overall approach]

### Commits

#### 1. [ ] [Commit title]
**Goal**: [What this achieves]
**Files**:
- `path/to/file.ts`
- `path/to/other.ts`

**Tasks**:
- [ ] Task 1
- [ ] Task 2

#### 2. [ ] [Commit title]
**Goal**: [What this achieves]
**Files**:
- `path/to/file.ts`

**Tasks**:
- [ ] Task 1
- [ ] Task 2

### Notes
[Any important considerations or risks]
```

### Step 5: Review
Ask user if the plan looks good or needs adjustment.
