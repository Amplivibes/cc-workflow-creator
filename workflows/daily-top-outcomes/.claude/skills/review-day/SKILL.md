---
name: review-day
description: Review yesterday's outcomes and plan today
---

Review yesterday's progress and generate a new daily plan.

## Usage

```
/review-day
```

## What It Does

1. Reviews yesterday's outcomes (`yesterday.md`)
2. Checks off completed items and identifies blockers
3. Generates a new plan for today based on progress
4. Archives yesterday's plan with timestamp

## Steps

1. Read `yesterday.md` if it exists.
2. For each outcome in yesterday's plan:
   - Ask which items were completed
   - Identify any blockers or issues
   - Note outcomes that need to carry forward
3. Summarize yesterday's achievements.
4. Ask what changed since yesterday:
   - New priorities?
   - Completed projects?
   - Urgent issues?
5. Generate today's plan using the same logic as `/plan-day`:
   - Incorporate carry-over items
   - Adjust for new context
   - Keep outcomes realistic
6. Archive yesterday's plan to `archive/[date].md`
7. Write today's plan to `today.md`

## Output Format

First, show yesterday's review:

```
Yesterday's Review - [Date]
========================

Completed:
- [Outcome 1] - 3/3 steps complete
- [Outcome 2] - 1/3 steps complete

Carrying forward:
- [Outcome 2] remaining steps

Blockers identified:
- [Any issues or blockers]

Achievements:
- [Summary of progress]
```

Then show today's plan (same format as `/plan-day`).

After generating, archive yesterday's plan and ask: "Ready to execute today's plan?"