---
name: learn-postgres
description: Use this skill when starting a learning session for PostgreSQL/Supabase expertise. It reads the learning plan, identifies the next module to study, and gathers relevant PostgreSQL docs, Supabase guides, and learning resources for a focused 30-minute session.
---

# PostgreSQL & Supabase Learning Session

A skill for pulling up the next learning topic from your database expertise plan and gathering relevant resources for a focused learning session.

## How This Works

1. Read your learning plan at `/Users/samjames/goals/database-expertise.md`
2. Identify your current position (first unchecked item in the Progress Log)
3. Search for relevant learning materials from PostgreSQL docs, Supabase docs, and online
4. Present a focused brief for your 30-minute morning session
5. Save the brief to `/Users/samjames/goals/learning-sessions/postgres/` for future reference

## Workflow

### Step 1: Read the Learning Plan

Read the file at `/Users/samjames/goals/database-expertise.md` and parse the Progress Log section.

### Step 2: Find Current Position

Look through the **Modules Completed** checklist in the Progress Log. Find the FIRST unchecked item (`[ ]`). This is the current learning focus.

### Step 3: Determine Topic Context

Based on the unchecked module, identify:

- The module's **Goal** and **Key concepts** from the learning plan
- The **Resources** already listed for that module
- How the topic connects to the Xylo codebase — check:
  - `packages/database/supabase/migrations/` for relevant SQL patterns
  - `packages/workflows/src/` for how the backend interacts with Supabase
  - `apps/web/src/` for how the frontend queries Supabase

### Step 4: Gather Learning Resources

Use web search to supplement the resources already in the learning plan:

**Search queries to use:**
- `site:postgresql.org/docs [topic]`
- `site:supabase.com/docs [topic]`
- `site:supabase.com/blog [topic]`
- `PostgreSQL [topic] internals explained`
- `site:pganalyze.com [topic]`
- `site:cybertec-postgresql.com [topic]`
- `site:interdb.jp/pg [topic]`

**Prioritize sources in this order:**
1. Official PostgreSQL documentation
2. Supabase documentation and blog posts
3. "The Internals of PostgreSQL" (interdb.jp/pg)
4. pganalyze, Cybertec, Crunchy Data blogs
5. CMU Database Group lectures

### Step 5: Present the Learning Brief

Format the output as:

```markdown
## Today's Learning Focus

**Module**: [Module number and name]
**Topic**: [The specific topic within the module]
**Why it matters**: [Connection to becoming a database expert and to Xylo's real database]

## Quick Context

[2-3 sentences explaining what this topic covers and why it matters for your Supabase/PostgreSQL work at Xylo]

## Learning Resources

### Primary Reading (pick one for today)
1. **[Title]** - [URL]
   [1-sentence description of what you'll learn]

2. **[Title]** - [URL]
   [1-sentence description of what you'll learn]

### Reference (bookmark for later)
- [PostgreSQL Doc] - [URL]
- [Supabase Doc] - [URL]

## 30-Minute Activity

**Read** (15 min): [Specific section/page to focus on]

**Connect** (10 min): Find where this concept appears in your Xylo database:
- Look in: `[specific migration file or code path]`
- Run: `[specific SQL query to explore the concept in your actual database]`

**Note** (5 min): Write down one thing you learned that changes how you think about your database

## Investigation Question

[A specific question to explore that connects the docs to your actual Xylo database — something you can answer by querying your local Supabase instance or reading a migration file]
```

### Step 6: Save the Session Brief

Save the learning brief to `/Users/samjames/goals/learning-sessions/postgres/` with the filename format:

```
YYYY-MM-DD-[topic-slug].md
```

For example: `2026-04-17-supabase-architecture-postgrest.md`

The saved file should include:
- The full learning brief content
- A "Session Notes" section (empty, for the user to fill in)
- A completion checkbox

Use this template for the saved file:

```markdown
# Learning Session: [Topic Name]

*Date: YYYY-MM-DD*

[Full learning brief content from Step 5]

---

## Session Notes

<!-- Add your notes here after the session -->

## Completed
- [ ] Mark complete when you can explain this to a teammate
```

## After the Session

Remind the user they can:
- Mark the module complete in their learning plan if they feel confident
- Continue with the same module tomorrow if they need more depth
- Move to the next module when ready
- Review past sessions in `/Users/samjames/goals/learning-sessions/postgres/`

## Notes

- Keep the brief focused - this is for a 30-minute session, not a full course
- Prioritize official PostgreSQL and Supabase docs over third-party content
- Always connect learning back to the Xylo database codebase and migrations
- Suggest ONE concrete action to take, not a list of 10 things
- Where possible, include a SQL query the user can run locally to see the concept in action
