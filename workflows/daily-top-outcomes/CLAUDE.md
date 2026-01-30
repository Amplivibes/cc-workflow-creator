# Daily Top Outcomes

Transform vague goals and project notes into a focused daily plan with concrete next steps.

## Quick Start

```bash
claude --model :cloud
```

**Configurable Model:** Change `:cloud` to your preferred Ollama model (e.g., `llama3.2`, `deepseek-coder`, etc.) or use the default `:cloud` selector.

The `daily-planner` agent will auto-trigger and help you get started.

## Commands

| Command | What It Does |
|---------|--------------|
| `/plan-day [n]` | Generate today's top N outcomes with 3 steps each |
| `/review-day` | Review yesterday's progress and plan today |
| `/update-goals` | Update your goals and projects |
| `/notion-sync <url>` | Sync from your Notion backlog |

## How It Works

1. **Input**: Your goals and projects (in `goals.md`)
2. **Output**: A daily plan with Top N outcomes, 3 concrete steps each, plus a stop-doing list

## First Time Setup

Run `/update-goals` to set up your initial goals and projects, or run `/plan-day` to get started immediately.

## Example Output

```
Today's Top 3 Outcomes
======================

1. Launch MVP feature for product dashboard
   - [ ] Write API endpoint for data fetch
   - [ ] Build dashboard widget component
   - [ ] Add loading states and error handling

2. Resolve critical bug in checkout flow
   - [ ] Reproduce bug with test data
   - [ ] Patch the payment validation logic
   - [ ] Add regression test

3. Draft project proposal for Q2 roadmap
   - [ ] Outline key objectives and KPIs
   - [ ] Write executive summary
   - [ ] Create timeline visualization

Stop-Doing List Today
=====================
- Email during deep work blocks (9-12am, 2-5pm)
- Context switching between unrelated tasks
- Meetings without agendas
```

## Files

- `goals.md` - Your goals and projects (auto-created)
- `today.md` - Today's plan (auto-generated)
- `yesterday.md` - Yesterday's outcomes (for review)
- `archive/` - Past daily plans