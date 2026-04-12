---
name: learn-infra
description: Use this skill when starting a learning session for infrastructure expertise. It reads the learning plan, identifies the next topic to study, and gathers relevant AWS documentation and learning resources for a focused 30-minute session.
---

# Infrastructure Learning Session

A skill for pulling up the next learning topic from your infrastructure expertise plan and gathering relevant resources for a focused learning session.

## How This Works

1. Read your learning plan at `/Users/samjames/goals/infrastructure-expertise.md`
2. Identify your current position (first unchecked item in the Progress Log)
3. Search for relevant learning materials from AWS and online
4. Present a focused brief for your 30-minute morning session
5. Save the brief to `/Users/samjames/goals/learning-sessions/` for future reference

## Workflow

### Step 1: Read the Learning Plan

Read the file at `/Users/samjames/goals/infrastructure-expertise.md` and parse the Progress Log section.

### Step 2: Find Current Position

Look through these sections in order to find the FIRST unchecked item (`[ ]`):

1. **Modules Read & Annotated** - Terraform modules to study
2. **AWS Services Deep-Dived** - AWS services to learn

The first unchecked item is the current learning focus.

### Step 3: Determine Topic Context

Based on the unchecked item, identify:

- **If it's a Terraform module** (e.g., `modules/s3-static-site/`):
  - The module path in `/Users/samjames/xylo/infrastructure/`
  - The primary AWS services it configures
  - Key Terraform concepts involved

- **If it's an AWS service** (e.g., "Lambda containers, IAM, concurrency"):
  - The specific sub-topics listed
  - How it relates to the Xylo infrastructure

### Step 4: Gather Learning Resources

Use web search to find:

**For Terraform modules:**
- Terraform registry documentation for relevant providers/resources
- AWS documentation for the underlying services
- Best practices articles (2024-2025)

**For AWS services:**
- Official AWS documentation (developer guides, not just API reference)
- AWS blog posts explaining concepts
- Terraform documentation for related resources
- Recent tutorials or deep-dives

**Search queries to use:**
- `site:docs.aws.amazon.com [service] [specific topic]`
- `site:registry.terraform.io aws [resource type]`
- `AWS [service] best practices 2024`
- `[service] serverless patterns`

### Step 5: Present the Learning Brief

Format the output as:

```markdown
## Today's Learning Focus

**Topic**: [The specific topic from checklist]
**Why it matters**: [Brief connection to your goal of becoming an infra expert]

## Quick Context

[2-3 sentences explaining what this topic covers and how it fits into the Xylo infrastructure]

## Learning Resources

### Primary Reading (pick one for today)
1. **[Title]** - [URL]
   [1-sentence description of what you'll learn]

2. **[Title]** - [URL]
   [1-sentence description of what you'll learn]

### Reference (bookmark for later)
- [AWS Doc] - [URL]
- [Terraform Registry] - [URL]

## 30-Minute Activity

**Read** (15 min): [Specific section/page to focus on]

**Connect** (10 min): Find where this concept appears in your Xylo infrastructure code:
- Look in: `[specific file or module path]`
- Search for: `[specific resource type or pattern]`

**Note** (5 min): Add one annotation or comment to the codebase explaining what you learned

## Investigation Question

[A specific question to explore that connects the docs to your actual codebase]
```

### Step 6: Save the Session Brief

Save the learning brief to `/Users/samjames/goals/learning-sessions/` with the filename format:

```
YYYY-MM-DD-[topic-slug].md
```

For example: `2025-12-30-main-tf-root-orchestration.md`

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
- Review past sessions in `/Users/samjames/goals/learning-sessions/`

## Notes

- Keep the brief focused - this is for a 30-minute session, not a full course
- Prioritize official AWS and Terraform docs over third-party content
- Always connect learning back to the Xylo infrastructure codebase
- Suggest ONE concrete action to take, not a list of 10 things
