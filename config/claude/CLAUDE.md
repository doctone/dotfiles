# Development Guidelines

## Philosophy

- Quality over speed
- Simple solutions preferred
- Security is non-negotiable
- Strong developer experience

## TypeScript Standards

### Zero Tolerance for `any`

Never use the `any` type. It disables type checking and defeats the purpose of TypeScript.

**Instead of `any`, use:**

- Proper type definitions
- `unknown` with type guards for truly unknown types
- Generics for flexible, type-safe code
- Union types for multiple possibilities

```typescript
// BAD
function processData(data: any) { return data.value; }

// GOOD
interface DataItem { value: string; }
function processData(data: DataItem) { return data.value; }

// GOOD - unknown with type guard
function handleResponse(response: unknown) {
  if (typeof response === "object" && response !== null && "data" in response) {
    return response.data;
  }
}
```

### Naming Conventions

- **Files**: kebab-case (`user-service.ts`)
- **Variables/Functions**: camelCase (`getUserById`)
- **Components/Types**: PascalCase (`UserProfile`)
- **Booleans**: Prefix with `is`, `has`, `should` (`isActive`, `hasPermission`)

### Validation

Use Zod for all API validation at boundaries.

## Testing Approach

### Test Behavior, Not Implementation

```typescript
// GOOD - Tests user behavior
test("displays error when login fails", async () => {
  renderWithProviders(<LoginForm />);
  await user.type(screen.getByLabelText(/email/i), "test@example.com");
  await user.click(screen.getByRole("button", { name: /login/i }));
  expect(screen.getByText(/invalid credentials/i)).toBeInTheDocument();
});

// BAD - Tests implementation
test("calls useAuth hook", () => { /* ... */ });
```

### Mocking Rules

- Mock external dependencies only (APIs, databases)
- Don't mock internal application code
- Mock at the boundary of your application

## Git Conventions

### Commit Messages

Use conventional commits:

```
feat: add user authentication
fix: resolve login redirect issue
refactor: extract validation logic
test: add coverage for auth flow
docs: update API documentation
```

### Branch Protection

- Never commit directly to main
- Always use feature branches
- Get approval before merging

## Workflow

### Structured Development Phases

1. **Research** - Explore codebase, understand context
2. **Plan** - Break into atomic commits with clear goals
3. **Signoff** - Get explicit user approval
4. **Execute** - Per-commit cycle: Dev → Review → Present → Commit

### Agent Delegation

Use specialized agents for focused tasks:

- `code-reviewer` - Design, implementation, tests, patterns
- `test-writer` - Black-box behavior tests
- `commit-message` - Conventional commit formatting
- `pr-description` - PR title and description

## Critical Restrictions

- NEVER force push to main
- NEVER skip research/planning for non-trivial work
- NEVER commit without explicit approval
- NEVER add unasked features or unnecessary refactoring
- NEVER use `any` type in TypeScript

## Commands Reference

### Orchestration
- `/begin <task>` - Start new work
- `/next` - Execute next commit
- `/resume` - Continue existing plan
- `/status` - Show progress
- `/abort` - Cancel safely
- `/pr` - Open pull request

### Standalone
- `/research` - Explore codebase
- `/plan` - Create implementation plan
- `/signoff` - Get approval
- `/dev` - Development phase
- `/review` - Code review
- `/present` - Present changes
- `/commit` - Create commit

### Memory
- `/remember [topic]` - Store knowledge
- `/recollect <topic>` - Recall memories
