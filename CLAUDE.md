# Workflow Creator (meta-project)

Purpose: create *job-to-be-done* Claude Code workflows on demand. Output is a self-contained `.claude/` folder packaged as `claude-[workflow-name].zip`.

## Quick start
1) Start Claude Code from this folder (project root):
   - `cd Workflow-Creator`
   - `claude`

2) In Claude Code, run:
   - `/skills` to see available workflow-maker skills
   - `/agents` to see the Workflow Creator subagents

3) Common entrypoints:
   - `/workflow-menu` . Show what to do next
   - `/generate-workflow <workflow-name> <job-to-be-done>` . Create a new workflow skeleton
   - `/package-workflow <workflow-name>` . Build `claude-[workflow-name].zip`

## Output contract for generated workflows
A generated workflow MUST contain:
- `.claude/agents/` (or at minimum a single orchestration agent)
- `.claude/skills/` (skills as the user-facing commands)
- `.claude/settings.json` (optional hooks and safe defaults)
- `README.md` describing how to use the workflow
- A deterministic packaging step producing `claude-[workflow-name].zip`

## Safety + quality defaults
- Prefer skills over long system prompts. Keep main context lean.
- Default to TDD. Always add smoke tests or a verification step.
- Default to secure-by-default patterns (no secrets in repo, env vars, least privilege).
