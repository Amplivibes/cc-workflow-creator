---
name: notion-sync
description: Sync goals and projects from a Notion backlog
---

Fetch goals and projects from a Notion database for daily planning.

## Usage

```
/notion-sync <notion-url>
```

## What It Does

1. Connects to a Notion database via URL
2. Fetches active items (goals, projects, tasks)
3. Formats them for the daily planning workflow
4. Updates `goals.md` with the synced content

## Prerequisites

- Notion API integration (or public page access)
- Notion database should have these properties:
  - Name/title
  - Status (active, blocked, done)
  - Priority (optional)
  - Due date (optional)

## Steps

1. Accept a Notion URL or page ID from the user.
2. Attempt to fetch the content:
   - If API token available, use Notion API
   - If public page, use WebFetch to read content
3. Parse the content to extract:
   - Goals (high-level objectives)
   - Projects (multi-item efforts)
   - Active tasks with context
4. Format the content into the `goals.md` structure.
5. Write to `goals.md`, preserving any manual notes.

## Error Handling

If the fetch fails:
- Ask if the user has the content they can paste
- Offer to create `goals.md` from pasted content
- Provide guidance on Notion integration setup

After syncing, confirm: "Notion synced to goals.md! Use /plan-day to generate your daily outcomes."