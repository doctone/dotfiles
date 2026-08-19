# Skills

The single source of truth for agent skills. Every harness reads from this directory —
there is no second copy to keep in sync.

## Wiring

| Harness  | Path                        | How it is linked                            |
|----------|-----------------------------|---------------------------------------------|
| Claude   | `~/.claude/skills`          | `config/claude/skills` → `../../skills` (in-repo symlink, committed) |
| Codex    | `~/.codex/skills`           | created by `scripts/symlinks.sh`            |
| OpenCode | `~/.config/opencode/skills` | `config/opencode/skills` → `../../skills` (in-repo symlink, committed) |
| Pi       | `~/.pi/agent/skills`        | created by `scripts/symlinks.sh`            |

Adding a directory here makes the skill available in all four. There is nothing to register.

## Writing a skill

One directory per skill, named in kebab-case, containing `SKILL.md`:

```markdown
---
name: my-skill          # must match the directory name
description: What it does, and when an agent should reach for it.
---

# My Skill
...
```

The `description` is what an agent matches against when deciding whether to use the
skill, so write it as "what this does + when to use it", not just a title.

Bundle any supporting files (reference docs, templates, scripts) in the same directory
and link them from `SKILL.md` with relative links.

## Keep it harness-neutral

These files are read by Claude, Codex, OpenCode and Pi alike, so avoid wording that
only makes sense in one of them. Refer to other skills by name — "use the `grilling`
skill" — rather than naming a specific harness's invocation mechanism.

`agents/openai.yaml`, where present, carries Codex display metadata. Other harnesses
ignore it.

## Validate

```sh
scripts/check-skills.sh
```
