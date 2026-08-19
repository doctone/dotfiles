---
name: recollect
description: Recall stored information from persistent memory. Use when the user asks what you remember about a topic.
---

# Recollect

Recall information from persistent memory.

## Input
Topic to recall: whatever the user asked for when invoking this skill

## Process

### Step 1: Search Memory
Query the memory MCP server for relevant memories matching the topic.

### Step 2: Filter and Rank
Sort results by:
- Relevance to query
- Recency
- Category

### Step 3: Present Results

```
## Memories: [topic]

### Patterns
- [relevant pattern memories]

### Decisions
- [relevant decision memories]

### Context
- [relevant context memories]

---

[N] memories found for "[topic]"
```

### If No Results

```
No memories found for "[topic]"

Try:
- Different keywords
- Broader topic
- /remember to store new information
```

## Examples

```
/recollect authentication
/recollect api patterns
/recollect testing conventions
```
