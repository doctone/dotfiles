---
name: learn-ai
description: Use this skill when starting a learning session for AI systems expertise. It reads the learning plan, identifies the next topic to study, and gathers relevant documentation and learning resources for a focused 30-minute session.
---

# AI Systems Learning Session

A skill for pulling up the next learning topic from your AI expertise plan and gathering relevant resources for a focused learning session.

## How This Works

1. Read your learning plan at `/Users/samjames/goals/ai-expertise.md`
2. Identify your current position (first unchecked item in the Progress Log)
3. Search for relevant learning materials from official docs and online
4. Present a focused brief for your 30-minute morning session
5. Save the brief to `/Users/samjames/goals/learning-sessions/ai/` for future reference

## Workflow

### Step 1: Read the Learning Plan

Read the file at `/Users/samjames/goals/ai-expertise.md` and parse the Progress Log section.

### Step 2: Find Current Position

Look through these sections in order to find the FIRST unchecked item (`[ ]`):

1. **Codebase Read & Annotated** - Xylo AI code to study
2. **Foundations Deep-Dived** - Core AI/LLM concepts
3. **Production AI Deep-Dived** - Production patterns and tools
4. **Advanced Topics** - Optimization and architecture

The first unchecked item is the current learning focus.

### Step 3: Determine Topic Context

Based on the unchecked item, identify:

- **If it's a codebase section** (e.g., `packages/ai/src/utils/`):
  - The file/directory path in the Xylo monorepo
  - The primary AI capabilities it implements
  - Key patterns and libraries used

- **If it's a foundations topic** (e.g., "Transformer architecture & attention"):
  - The specific concepts to understand
  - How it connects to practical LLM usage

- **If it's a production topic** (e.g., "Braintrust prompt versioning"):
  - The tool or pattern to learn
  - How it's used in the Xylo codebase

- **If it's an advanced topic** (e.g., "Evaluation design & metrics"):
  - The architectural concept
  - Practical applications in Xylo

### Step 4: Gather Learning Resources

Use web search to find relevant resources based on the topic type:

**For LLM fundamentals:**
- `site:platform.openai.com [topic]`
- `site:docs.anthropic.com [topic]`
- `transformer architecture explained [specific aspect]`
- `[topic] machine learning engineer guide`

**For Vercel AI SDK:**
- `site:sdk.vercel.ai [function or concept]`
- `vercel ai sdk [specific feature] examples`

**For Braintrust:**
- `site:braintrust.dev/docs [topic]`
- `braintrust [evaluations/prompts/tracing] guide`

**For embeddings and vector search:**
- `site:docs.cohere.com embeddings [topic]`
- `site:turbopuffer.com/docs [topic]`
- `vector search [specific concept] best practices`

**For prompt engineering:**
- `site:docs.anthropic.com prompt engineering [topic]`
- `site:platform.openai.com prompt engineering [topic]`
- `[technique] prompting examples`

**For RAG and agents:**
- `RAG [specific aspect] best practices 2024`
- `LLM tool calling [topic]`
- `agentic patterns [specific concept]`

### Step 5: Present the Learning Brief

Format the output as:

```markdown
## Today's Learning Focus

**Topic**: [The specific topic from checklist]
**Why it matters**: [Brief connection to your goal of becoming an AI expert at Xylo]

## Quick Context

[2-3 sentences explaining what this topic covers and how it fits into the Xylo AI systems]

## Learning Resources

### Primary Reading (pick one for today)
1. **[Title]** - [URL]
   [1-sentence description of what you'll learn]

2. **[Title]** - [URL]
   [1-sentence description of what you'll learn]

### Reference (bookmark for later)
- [Official Doc] - [URL]
- [Xylo-relevant resource] - [URL]

## 30-Minute Activity

**Read** (15 min): [Specific section/page to focus on]

**Connect** (10 min): Find where this concept appears in your Xylo AI code:
- Look in: `[specific file or package path]`
- Search for: `[specific pattern or function]`

**Note** (5 min): Add one annotation or comment to the codebase explaining what you learned

## Investigation Question

[A specific question to explore that connects the docs to your actual codebase]
```

### Step 6: Save the Session Brief

Save the learning brief to `/Users/samjames/goals/learning-sessions/ai/` with the filename format:

```
YYYY-MM-DD-ai-[topic-slug].md
```

For example: `2026-01-29-ai-transformer-architecture.md`

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
- Review past sessions in `/Users/samjames/goals/learning-sessions/ai/`

## Xylo AI Codebase Reference

When connecting learning to the codebase, these are the key locations:

**Core AI utilities:**
- `/Users/samjames/xylo/monorepo/packages/ai/src/utils/` - Embedding, reasoning helpers
- `/Users/samjames/xylo/monorepo/packages/ai/src/prompts/` - Prompt patterns

**Tool definitions:**
- `/Users/samjames/xylo/monorepo/packages/ai-tools/src/application/` - Application tools

**AI workflows:**
- `/Users/samjames/xylo/monorepo/packages/workflows/src/functions/application/` - Inngest workflows
- `/Users/samjames/xylo/monorepo/packages/workflows/src/lib/turbopuffer/` - Vector search client

**Chat endpoints:**
- `/Users/samjames/xylo/monorepo/packages/api/src/routes/chat/` - Streaming chat

**Key technologies in use:**
- **LLM**: OpenAI (gpt-5, gpt-5.2) via Vercel AI SDK v5
- **Embeddings**: Cohere (`embed-english-light-v3.0`)
- **Vector DB**: Turbopuffer
- **Observability**: Braintrust
- **Structured outputs**: Zod schemas
- **Workflows**: Inngest

## Notes

- Keep the brief focused - this is for a 30-minute session, not a full course
- Prioritize official documentation (OpenAI, Anthropic, Vercel, Braintrust) over blog posts
- Always connect learning back to the Xylo AI codebase
- Suggest ONE concrete action to take, not a list of 10 things
- For conceptual topics, find the simplest explanation that builds intuition
- For tool topics, focus on the specific features Xylo uses
