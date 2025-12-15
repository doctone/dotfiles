# Remember

Store information in persistent memory for future sessions.

## Input
What to remember: $ARGUMENTS

## Process

### Step 1: Parse Input
Extract the key information to store.

### Step 2: Categorize
Determine the type of memory:
- **pattern**: Code patterns and conventions
- **decision**: Architectural or design decisions
- **preference**: User preferences
- **context**: Project-specific context
- **learning**: Things learned during development

### Step 3: Store in Memory
Use the memory MCP server to persist:

```json
{
  "type": "[category]",
  "content": "[what to remember]",
  "context": "[when this applies]",
  "timestamp": "[when stored]"
}
```

### Step 4: Confirm

```
✅ Remembered: [summary]

Category: [type]
Context: [when this applies]

Recall with: /recollect [topic]
```

## Examples

```
/remember we use Zod for all API validation
/remember prefer composition over inheritance in this codebase
/remember the auth service is in packages/auth
```
