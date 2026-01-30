# Daily Top Outcomes

A daily planning workflow that generates focused outcomes with concrete next steps.

## Purpose

Transform vague goals and project notes into a focused daily plan with:
- **Top N outcomes** for the day (typically 3-5)
- **3 concrete next steps** for each outcome
- **Stop-doing list** to protect focus

Quality is immediately judgeable: you can see at a glance if you're working on the right things.

## How It Works

1. **Input**: A short note of goals and current projects, or optionally a Notion backlog URL
2. **Process**: Analyze priorities, break down into actionable steps, identify what to avoid
3. **Output**: A clean daily plan ready for execution

## Getting Started

Start Claude Code from the workflow directory with your preferred model:

```bash
cd daily-top-outcomes
claude --model :cloud
```

**Note:** This workflow is configured to use the `:cloud` model selector (for local Ollama models). Adjust the model flag as needed.

## Available Commands

| Command | Purpose |
|---------|---------|
| `/plan-day` | Generate your daily outcomes plan from goals/projects |
| `/review-day` | Review yesterday's outcomes and plan today |
| `/update-goals` | Update your goals and projects note |
| `/notion-sync` | Sync with your Notion backlog (optional) |

## Example Usage

```
/plan-day
```

You'll be prompted for:
- Your goals and projects note (or file path)
- Number of outcomes to generate (default: 3)

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

- `goals.md` - Your goals and projects (auto-created on first run)
- `today.md` - Today's plan (auto-generated)
- `yesterday.md` - Yesterday's outcomes (for review)