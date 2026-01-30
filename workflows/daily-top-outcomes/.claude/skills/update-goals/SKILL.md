---
name: update-goals
description: Update your goals and projects note
---

Update your goals and projects note that drives daily planning.

## Usage

```
/update-goals
```

## What It Does

1. Opens your current `goals.md` for editing
2. Guides you through updating each section
3. Validates completeness of the update

## Steps

1. Read the current `goals.md` if it exists.
2. If it doesn't exist, create it with a template.
3. Prompt the user to update each section:
   - Current Goals
   - Active Projects
   - This Week Focus
4. Offer to keep or modify each section based on current state.
5. Save the updated `goals.md`.

## Template Format

```markdown
# Goals & Projects

## Current Goals
- [Goal 1]
- [Goal 2]
- [Goal 3]

## Active Projects
1. [Project name]
   - [Status note]
   - [Next milestone]

2. [Project name]
   - [Status note]
   - [Next milestone]

## This Week Focus
- [Priority 1]
- [Priority 2]
- [Priority 3]

## Notes
[Any additional context that helps with planning]
```

After saving, confirm: "Goals updated! Use /plan-day to generate your daily outcomes."