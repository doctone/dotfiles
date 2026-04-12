# Daily Standup

Generate a concise standup summary from git history and Linear activity over the last 24 hours.

## Instructions

### 1. Gather Git History

Run these commands to get yesterday's work:

```bash
git log --all --since="24 hours ago" --pretty=format:"%h %s (%ar)" --author="$(git config user.email)"
```

If no results, try with the user's name:
```bash
git log --all --since="24 hours ago" --pretty=format:"%h %s (%ar)" --author="$(git config user.name)"
```

### 2. Gather Linear Activity

Fetch recently updated issues assigned to me:

```
Use mcp__linear-server__list_issues with:
- assignee: "me"
- updatedAt: "-P1D" (last 24 hours)
- limit: 50
```

Categorise these into:
- **Completed** — status is Done and completedAt is within the last 24 hours
- **Moved to Review** — status is In Review and updatedAt is within the last 24 hours
- **Started** — status is In Progress and createdAt or status change is recent
- **Updated** — anything else that was touched in the last 24 hours

### 3. Present the Standup

Format as a brief, copy-pasteable standup message:

```
**Yesterday**
- Completed [ISSUE-ID] [Title]
- Moved [ISSUE-ID] [Title] to review
- Worked on [ISSUE-ID] [Title] — [brief context from commits if available]
- [Any non-ticket git work, e.g. "Reviewed PRs", "Fixed CI"]

**Today**
- [Continue/pick up highest priority In Progress item]
- [Next Todo item if capacity allows]
- [Any review follow-ups needed]

**Blockers**
- [Any items stuck or waiting on others, or "None"]
```

### 4. Guidelines

- Keep it **short** — this is for a team standup, not a full report
- Correlate git commits to Linear issues where branch names match (e.g. `sam/bui-1234-*`)
- Group related commits under their parent issue rather than listing individually
- If there are commits not tied to any ticket, list them separately
- For "Today", infer from current In Progress items and the next highest-priority Todo
- Only mention blockers if something is genuinely stuck

## Notes

- If Linear is unavailable, fall back to git-only history
- If no activity in the last 24 hours, say so honestly and suggest checking `/workload` for current cycle status
