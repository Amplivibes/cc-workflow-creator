---
name: plan-day
description: Generate a daily outcomes plan from goals and projects
---

Generate your daily outcomes plan with Top N concrete items and 3 next steps each.

## Usage

```
/plan-day [n]
```

`n` = number of outcomes (default: 3)

## What It Does

1. Reads your goals and projects from `goals.md` (prompts to create if missing)
2. Analyzes priorities and generates Top N outcomes for today
3. Breaks down each outcome into 3 concrete, actionable next steps
4. Creates a stop-doing list to protect focus
5. Writes the plan to `today.md`

## Input Format (goals.md)

```markdown
## Current Goals
- Launch product dashboard by end of month
- Reduce customer churn to <5%

## Active Projects
1. Dashboard MVP
   - API integration in progress
   - Widget components need styling
2. Churn reduction initiative
   - Email campaign drafting
   - Analytics pipeline setup

## This Week Focus
- Complete dashboard API
- Send first churn reduction email
```

## Steps

1. Check if `goals.md` exists. If not, prompt the user to provide goals/projects and create it.
2. Read `goals.md` to understand current context.
3. Ask how many outcomes to generate (default to 3, allow 1-5).
4. Analyze the goals and projects to identify the highest-impact outcomes for today.
5. For each outcome, generate 3 concrete, specific next steps:
   - Must be actionable today
   - Should be clear enough to execute without thinking
   - Each step should move progress forward visibly
6. Generate a stop-doing list based on the outcomes:
   - Things that distract from today's priorities
   - Common time-wasters
   - Context switches to avoid
7. Write the plan to `today.md` with clear formatting.
8. Display the plan to the user.

## Output Format (today.md)

```markdown
# Today's Plan - [Date]

## Top [N] Outcomes

### 1. [Outcome title]
- [ ] [Step 1]
- [ ] [Step 2]
- [ ] [Step 3]

... (repeat for each outcome)

## Stop-Doing List Today
- [ ] [Item 1]
- [ ] [Item 2]
...
```

After generating, ask: "Ready to start working? Use /review-day tomorrow to check progress."