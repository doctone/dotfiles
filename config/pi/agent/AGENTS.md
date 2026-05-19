# Pi Agent Workflow

Use the Superpowers discipline. At the start of each task, check whether a skill applies before responding or acting.

## Frequently Used Skills

- `superpowers`: use to determine which skills apply and how to approach the task.
- `tdd`: use for feature work, bug fixes, refactors, and behavior changes.
- `grill-me`: use when the user wants design interrogation, plan stress-testing, or says "grill me".

Pi exposes skills as `/skill:<name>`. This setup also provides ergonomic aliases:

- `/superpowers`
- `/tdd`
- `/grill-me`

## Current Workflow Preferences

- Do not use the old `/begin`, `/plan`, `/research`, `/next`, or staged planning workflow unless explicitly requested.
- Prefer lightweight, direct execution guided by the applicable skill.
- Keep changes focused. Do not add unasked features or unnecessary refactors.
- Never commit, push, or create a PR without explicit user approval.

## Implementation Work

For code changes, prefer TDD unless the user explicitly opts out or the work is configuration/prototype/generated code:

1. Confirm the public behavior/interface to change.
2. Write one failing behavior test.
3. Run it and verify it fails for the right reason.
4. Implement the smallest change to pass.
5. Run it and verify it passes.
6. Repeat vertically, one behavior at a time.

Avoid horizontal slicing: do not write all tests first and then all implementation.

## Design Review / Grill Me

When using `grill-me`:

- Ask one question at a time.
- Provide your recommended answer with each question.
- Resolve dependencies between decisions one-by-one.
- If a question can be answered by exploring the codebase, explore the codebase instead of asking.

## TypeScript Standards

- Never use `any`. Use proper types, `unknown` with guards, generics, or unions.
- Use Zod for API validation at boundaries where applicable.
- Test behavior, not implementation details.
- Mock only external boundaries.

## Git Safety

- Never force push to `main` or `master`.
- Never commit directly to `main` or `master`.
- Always present commit messages, PR descriptions, and risky git actions for approval first.
