# Begin New Work

Start a new development task with structured planning.

## Input
Task description: $ARGUMENTS

## Safety Checks

First, verify:
1. No uncommitted changes exist (`git status`)
2. Currently on main branch (or confirm branch switch)

If checks fail, ask user how to proceed.

## Process

### Step 1: Generate Task Slug
Create a kebab-case identifier from the task description:
- Lowercase alphanumeric and hyphens only
- Max 50 characters
- No path separators

### Step 2: Create Plan Directory
Create `docs/plans/<slug>/` directory. Abort if it already exists (use `/resume` instead).

### Step 3: Research Phase
Use the researcher mindset to explore:
- Existing related code
- Patterns and conventions used
- Documentation and tests
- Dependencies and constraints

Save findings to `docs/plans/<slug>/research.md`

### Step 4: Planning Phase
Break work into atomic commits:
- Each commit should be a single logical change
- Define clear goals for each commit
- List files to be modified
- Create checkboxes for progress tracking

Save plan to `docs/plans/<slug>/plan.md`

### Step 5: Signoff
Present the research and plan to the user:

```
## Research Summary
[Key findings]

## Planned Commits
1. [ ] Commit 1: [goal]
2. [ ] Commit 2: [goal]
...

Ready to proceed? (yes/no)
```

### Step 6: Create Branch
After approval, create feature branch:
```bash
git checkout -b feat/<slug>
```

## Output
Confirm the task is set up and ready for `/next` to begin execution.
