---
name: etch-review
description: Address requested changes on a GitHub pull request, reply to review comments, and return it to agentic review. Use when the user invokes `/etch-review` with a branch name, PR URL, or PR number.
---

# Etch Review

Target: `$ARGUMENTS`

1. Resolve the target to exactly one PR. Accept a branch name, PR URL, or PR
   number. With no argument, use the current branch's PR. Stop on ambiguity or
   overlapping local changes that cannot be preserved.
2. Fetch thread-aware review data with GitHub GraphQL, including resolution,
   outdated state, file, line, and replies. Inventory every unresolved
   actionable request; separate questions, duplicates, obsolete feedback, and
   already-addressed items.
3. Work on the PR head branch in an isolated worktree when the current checkout
   is dirty or on another branch. Implement every unambiguous requested change.
   Add a regression test first for bugs or behavior changes.
4. Run focused verification and relevant repository checks. Review the final
   diff against the PR intent and complete feedback inventory.
5. Commit and push only the scoped changes. Never force-push without explicit
   authorization.
6. Reply to every actionable comment in its original thread with concrete
   changes and verification evidence. If no code change is warranted, reply
   with evidence. Resolve threads only when the user explicitly requests it.
7. Refresh the PR after pushing and replying. Confirm the pushed SHA, check
   state, and that no new actionable feedback appeared.
8. As the final GitHub write, add the exact existing label `agentic:review`.
   Do not churn it if already present. Verify the final label state in the same
   mutation when possible.

Report the PR, commit, requests addressed, replies, open threads, verification,
and label state. Never claim completion with unhandled actionable feedback.

Example: `/etch-review sam/JKNN-638-controlled-egress`
