# Current Workload Summary

Fetch my Linear issues for the current cycle and summarise where I'm at with next steps.

## Instructions

You are summarising the user's current workload from Linear. Follow these steps:

### 1. Get Teams and My User Info

Use the Linear MCP tools:

```
Use mcp__linear-server__list_teams to get available teams
```

Then use `mcp__linear-server__list_issues` with `assignedToMe: true` to identify the user.

### 2. Fetch Current Cycle Issues

Fetch issues assigned to me in the active cycle:

```
Use mcp__linear-server__list_issues with:
- assignedToMe: true
- Filter for the current/active cycle
- Include all non-cancelled/non-duplicate statuses (Backlog, Todo, In Progress, In Review, Done)
```

If there is no active cycle, fall back to fetching all active issues assigned to me (non-Done, non-Cancelled).

### 3. Categorise Issues by Status

Group the fetched issues into these buckets:

- **In Progress** - Issues actively being worked on
- **In Review** - Issues waiting for review
- **Todo** - Issues not yet started
- **Done** - Issues completed this cycle
- **Blocked/On Hold** - Any issues that appear stalled

### 4. Present the Summary

Format the output as follows:

```
## Workload Summary - [Cycle Name or "Active Issues"]

### 🔄 In Progress ([count])
- **[ISSUE-ID]** [Title] — [Priority emoji] [one-line context if available]
- ...

### 👀 In Review ([count])
- **[ISSUE-ID]** [Title]
- ...

### 📋 Todo ([count])
- **[ISSUE-ID]** [Title] — [Priority emoji]
- ...

### ✅ Done ([count])
- **[ISSUE-ID]** [Title]
- ...

---

### Cycle Progress
- [X] of [Y] issues completed ([percentage]%)
- [In Progress count] in flight

### Suggested Next Steps
1. [Most actionable next step based on priority and status]
2. [Second priority]
3. [Third priority]
```

### 5. Determine Next Steps

Analyse the issues to suggest next steps:

- Prioritise **In Review** items that may need follow-up
- Highlight the highest-priority **Todo** item to pick up next
- Flag any issues that seem stalled (In Progress for a long time with no recent updates)
- If the cycle is close to ending, note any at-risk items

## Priority Emoji Key

Use these for priority levels:
- 🔴 Urgent
- 🟠 High
- 🟡 Medium
- 🟢 Low
- ⚪ No priority

## Notes

- If Linear authentication fails, inform the user and suggest checking their Linear MCP configuration
- Keep the summary concise and actionable — this is a quick status check, not a full report
- Focus on what needs attention **right now**
