---
name: superpowers
description: Use at the start of every task to check whether a skill applies before responding or acting. Enforces skill-first workflow in Pi.
---

# Superpowers for Pi

## Core Rule

Before responding or acting, check whether any skill applies.

If there is even a small chance a skill applies, use it first. Do not gather files, inspect git, ask clarifying questions, or start implementation before the skill check.

## Pi Skill Access

Pi exposes skills as slash commands:

- `/skill:tdd` for test-driven development
- `/skill:grill-me` for design interrogation
- `/skill:superpowers` for this workflow

This dotfiles setup also provides aliases:

- `/tdd`
- `/grill-me`
- `/superpowers`

When a skill is explicitly requested, follow that skill directly.

## Skill Priority

When multiple skills could apply:

1. **Process skills first** — skills that determine how to approach the task.
2. **Implementation skills second** — skills that guide execution.

Examples:

- "Build this feature" → check `tdd` before implementation.
- "Fix this bug" → use systematic/debugging guidance if available, then `tdd` for the fix.
- "Grill me on this plan" → use `grill-me`.

## Frequently Used Skills

### `tdd`

Use for:

- feature work
- bug fixes
- refactors
- behavior changes
- requests that mention TDD, red-green-refactor, tests-first, or integration tests

Do not use for:

- pure configuration changes
- throwaway prototypes
- generated code
- documentation-only changes

When in doubt, ask whether the user wants TDD for this task.

### `grill-me`

Use when the user wants to stress-test a design or says anything like:

- "grill me"
- "poke holes in this"
- "stress test this plan"
- "interview me about this design"

Ask one question at a time and include your recommended answer.

## Red Flags

Stop if you catch yourself thinking:

- "I'll just inspect the files first."
- "This is too small for a skill."
- "I know what the skill says."
- "I need more context before checking skills."
- "I'll use TDD after writing the code."

These are rationalizations. Check and use the relevant skill first.

## User Control

User instructions override skills. If the user explicitly says not to use a skill or asks for a different workflow, follow the user.

Do not use the old `/begin`, `/plan`, `/research`, `/next`, or staged planning workflow unless the user explicitly asks for it.
