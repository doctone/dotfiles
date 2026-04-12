---
name: learn-agentic
description: Use this skill when starting a learning session for agentic coding expertise. It reads the learning plan, identifies the next topic to study, and gathers relevant Claude Code documentation and learning resources for a focused 30-minute session.
---

# Agentic Coding Learning Session

A skill for pulling up the next learning topic from your agentic coding expertise plan and gathering relevant resources for a focused learning session.

## How This Works

1. Read your learning plan at `/Users/samjames/goals/agentic-coding-expertise.md`
2. Identify your current position (first unchecked item in the Progress Log)
3. Search for relevant learning materials from official docs and online
4. Present a focused brief for your 30-minute morning session
5. Save the brief to `/Users/samjames/goals/learning-sessions/agentic-coding/` for future reference

## Workflow

### Step 1: Read the Learning Plan

Read the file at `/Users/samjames/goals/agentic-coding-expertise.md` and parse the Progress Log section.

### Step 2: Find Current Position

Look through these sections in order to find the FIRST unchecked item (`[ ]`):

1. **Foundations** - Claude Code architecture, hooks, skills
2. **Subagents & Orchestration** - Task tool, multi-instance, headless mode
3. **Agent SDK & Advanced Patterns** - SDK, design patterns, swarm mode
4. **Production & Leadership** - Observability, security, teaching

The first unchecked item is the current learning focus.

### Step 3: Determine Topic Context

Based on the unchecked item, identify:

- **If it's a foundations topic** (e.g., "Claude Code agentic loop architecture"):
  - The specific concepts to understand
  - How it connects to practical Claude Code usage
  - Relevant configuration files in the Xylo monorepo

- **If it's a subagents/orchestration topic** (e.g., "Git worktrees for parallel agent isolation"):
  - The specific tools and commands involved
  - How it would apply to Xylo development workflows
  - Existing agent configurations in the project

- **If it's an SDK topic** (e.g., "Agent SDK: building a custom agent"):
  - The specific API surfaces to learn
  - A concrete Xylo use case to build against
  - Related packages in the monorepo

- **If it's a pattern topic** (e.g., "Pattern: Evaluator-Optimizer"):
  - The pattern's architecture and components
  - When to use it vs alternatives
  - How it maps to a real Xylo task

- **If it's a production/leadership topic** (e.g., "Cost management and model selection"):
  - The practical concerns to address
  - Metrics and measurement approaches
  - Team impact and documentation needs

### Step 4: Gather Learning Resources

Use web search to find relevant resources based on the topic type:

**For Claude Code fundamentals:**
- `site:code.claude.com [topic]`
- `site:docs.anthropic.com claude code [topic]`
- `claude code [specific feature] guide 2026`

**For hooks and skills:**
- `site:code.claude.com hooks [topic]`
- `site:code.claude.com skills [topic]`
- `claude code hooks [specific lifecycle event] example`

**For subagents and Task tool:**
- `site:code.claude.com sub-agents`
- `site:docs.anthropic.com claude code sub-agents`
- `claude code subagent [specific pattern] best practices`

**For Claude Agent SDK:**
- `site:platform.claude.com agent-sdk [topic]`
- `claude agent sdk [specific feature] typescript`
- `@anthropic-ai/claude-agent-sdk [topic]`

**For headless mode and CI/CD:**
- `site:code.claude.com headless`
- `claude code --print [use case]`
- `claude code CI/CD automation [topic]`

**For multi-agent orchestration:**
- `claude code parallel agents [pattern]`
- `claude code git worktrees multiple instances`
- `site:anthropic.com/engineering [agents topic]`

**For agentic design patterns:**
- `site:anthropic.com/engineering agentic patterns`
- `orchestrator workers pattern LLM agents`
- `evaluator optimizer pattern agentic coding`

### Step 5: Present the Learning Brief

Format the output as:

```markdown
## Today's Learning Focus

**Topic**: [The specific topic from checklist]
**Phase**: [Foundations / Subagents & Orchestration / Agent SDK & Advanced Patterns / Production & Leadership]
**Why it matters**: [Brief connection to your goal of becoming an agentic coding expert]

## Quick Context

[2-3 sentences explaining what this topic covers and how it connects to building multi-agent systems for Xylo]

## Learning Resources

### Primary Reading (pick one for today)
1. **[Title]** - [URL]
   [1-sentence description of what you'll learn]

2. **[Title]** - [URL]
   [1-sentence description of what you'll learn]

### Reference (bookmark for later)
- [Official Doc] - [URL]
- [Related resource] - [URL]

## 30-Minute Activity

**Read** (15 min): [Specific section/page to focus on]

**Try** (10 min): [A hands-on exercise to do in the Xylo monorepo]
- Do: `[specific command or configuration to try]`
- Observe: [what to look for]

**Note** (5 min): Document what you learned -- add a note to your session file or update a CLAUDE.md

## Investigation Question

[A specific question to explore that connects the docs to your actual workflow]
```

### Step 6: Save the Session Brief

Save the learning brief to `/Users/samjames/goals/learning-sessions/agentic-coding/` with the filename format:

```
YYYY-MM-DD-agentic-[topic-slug].md
```

For example: `2026-02-11-agentic-claude-code-architecture.md`

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
- Mark the item complete in their learning plan if they feel confident
- Continue with the same topic tomorrow if they need more depth
- Move to the next item when ready
- Review past sessions in `/Users/samjames/goals/learning-sessions/agentic-coding/`

## Xylo Project Reference

When connecting learning to practical usage, these are the key locations:

**Existing agent/skill configurations:**
- `/Users/samjames/.claude/skills/` - Custom skills
- `/Users/samjames/.claude/settings.json` - User settings and hooks
- `/Users/samjames/xylo/monorepo/.claude/` - Project-level configuration
- `/Users/samjames/xylo/monorepo/CLAUDE.md` - Project constitution

**Codebase for practice:**
- `/Users/samjames/xylo/monorepo/` - Main monorepo for trying multi-agent workflows
- `/Users/samjames/xylo/infrastructure/` - Infrastructure repo for parallel work patterns

**Key technologies that interact with agentic patterns:**
- **Workflows**: Inngest (already orchestrates async work -- parallels to agent orchestration)
- **API**: ts-rest (automated review candidate)
- **Testing**: Vitest (automated test generation candidate)
- **CI/CD**: GitHub Actions (headless mode integration point)

## Notes

- Keep the brief focused -- this is for a 30-minute session, not a full course
- Prioritize official Anthropic docs (code.claude.com, docs.anthropic.com) over third-party content
- Always include a hands-on exercise -- reading alone doesn't build agentic intuition
- Suggest ONE concrete thing to try, not a list of 10 things
- For pattern topics, always include a concrete Xylo use case
- For tooling topics, always include a command to run
