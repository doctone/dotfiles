---
name: direct-my-learning
description: Use when the user asks what to learn next, begins or continues a focused learning session, or proposes a topic that may divert an active learning spine.
---

**spine** is the single career direction governing every learning choice.

**REQUIRED SUB-SKILL:** Use teach. Never duplicate teach's lesson workflow.

For weekly/monthly review, use [references/program-state.md](references/program-state.md)'s branch without a lesson. Otherwise follow these steps.

## 1. Orient

Resolve programme root from explicit request path; otherwise find `second-brain/learning-program`. Read five programme files and `NOW`'s active topic workspace mission/records. Inspect real project read-only when needed.

Validate once: `MISSION` = outcome/success/constraints/exclusions; `ROADMAP` = ordered phases/gate criteria/reordering rule; `NOW` = roadmap phase, with one CAP ID/name/objective, spine, active workspace, active unmet gate criterion, question/action, and Status `idle|awaiting-feedback`; `EVIDENCE` = `candidate|accepted` rows linked to assessor/artifact, CAP ID, and criterion ID; `PARKING-LOT` = no active track. Stable `CAP-1`, `CAP-2`, … IDs increment per production capability and survive objective/phase changes. Gate criteria use `P<phase>-E<number>`, not CAP IDs. When awaiting feedback, populate pending workspace/outcome/lesson-exercise/criterion; resume through `teach` before Route without another outcome, then Record.

If any file is missing/malformed, load the reference; repair before teaching.

Complete Orient only when the schema is valid and the last demonstrated understanding is known.

## 2. Route

Prioritize: (1) production blocker/opportunity on spine, (2) prerequisite exposed by current work, then (3) next roadmap gap.

Classify curiosity as `advance`, `unblock`, `later`, or `park`; curiosity alone never detours. For `later|park`, append topic plus promotion condition to `PARKING-LOT`; verbal classification is incomplete. Continue current spine/outcome. Select one 30-minute outcome in the active workspace. Replace workspace only if it genuinely belongs elsewhere; update `NOW`, never use programme root. Keep one active track.

Complete Route only when the outcome closes or tests the active criterion. If production priority requires another current-phase criterion, atomically replace `NOW`'s active criterion; checkpoint the same criterion.

## 3. Teach

From selected topic workspace, invoke `teach` for the exact outcome; it cannot re-route or choose another workspace/topic. Require a tight feedback loop and 30-minute real-project/retrieval exercise; presenting material is not completion.

Before yielding, checkpoint `NOW` with Status `awaiting-feedback` and the pending workspace, outcome, lesson/exercise, and criterion. On response, give feedback, then proceed to Record.

Complete Teach only after an attempt and feedback.

## 4. Record

Only a demonstrated retrieval/application exercise may update the topic learning record. This overrides `teach`'s self-report/prior-knowledge rule: self-report may adjust difficulty but cannot create records or evidence. Create `EVIDENCE` as `candidate` only for real-project performance/artifact, public or career artifact, interview assessment, or leadership act. A lesson exercise qualifies only if it produces an inspectable real-world artifact. External/explicit assessment may promote an existing eligible candidate to `accepted`; never create `accepted` directly. Record assessor, artifact/performance, CAP ID, and criterion ID. Reading, attendance, and exposure are not demonstrations. Advance a gate only with linked accepted evidence.

Clear pending fields, set Status `idle`, and update `NOW` with exactly one next action while maintaining one spine.

Complete Record only when the attempt, feedback, qualifying records, cleared checkpoint, and single next action are consistent.
