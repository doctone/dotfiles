---
name: job-skill-demand-live
description: Live analysis of software engineering skill demand from LinkedIn Jobs using browser/MCP automation. Use when user wants direct web collection (no input file), especially for filters like remote UK roles, then ranking skills by frequency.
---

# Operating Mode

Run in `live_web` mode by default.
Do not require CSV/JSON input files unless user asks for fallback.

## Required Inputs

- `query_terms`: role keywords (for example: software engineer, full stack engineer)
- `location`: default `United Kingdom`
- `remote_only`: default `true`
- `max_postings`: default `200`, hard cap `300`
- `top_n`: default `20`

If inputs are missing, assume defaults and continue.

## Collection Workflow

1. Open LinkedIn Jobs search with provided filters.
2. If auth is needed, pause and ask the user to complete login manually in the browser session.
3. Iterate result pages until `max_postings` is reached or pages are exhausted.
4. For each job card, capture:
- `job_url`
- `job_id` (if available)
- `title`
- `company`
- `location`
- `posted_at` (if visible)
- full `description`
5. Add `2-5s` pacing between page actions.
6. Stop if captcha/challenge appears and report partial results.

## Parsing And Skill Matching

- Normalize to lowercase and collapse punctuation/extra whitespace.
- Match canonical skills using aliases.
- Prioritize these skills in output: TypeScript, React, Node.js, AWS.
- Deduplicate per posting (count each skill once per job).

Baseline aliases:
- typescript: ts
- react: reactjs
- node.js: node, nodejs
- aws: amazon web services
- javascript: js

## Aggregation

Return:
1. Top N skills overall (`count`, `% of postings`)
2. Focus summary for TypeScript, React, Node.js, AWS
3. Optional split by `seniority` and `location` if fields are present
4. Coverage stats:
- postings scanned
- postings with usable descriptions
- duplicate/skipped count
- run stop reason (completed/captcha/auth timeout)

## Output Format

Always print:
- `Run Summary`
- `Top Skills Table`
- `Focus Skills Table`
- `Caveats`

Keep output concise and numeric.

## Safety Rules

- Use only pages the user can access in their own session.
- Do not attempt anti-bot bypass techniques.
- Respect pacing and stop conditions.
- If blocked, return partial analysis and a next-step suggestion.
