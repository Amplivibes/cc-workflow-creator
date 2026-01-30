#!/usr/bin/env bash
# Adds lightweight, deterministic reminders to Claude's context when you type a prompt.
set -euo pipefail

# Claude Code passes JSON on stdin.
payload="$(cat || true)"

echo "Meta-rules (Workflow-Creator):"
echo "- Keep generated workflows minimal but complete."
echo "- Prefer Skills (/.claude/skills) as the UX surface."
echo "- Subagents must use YAML frontmatter: name + description + optional tools/model."
echo "- Skills must live in .claude/skills/<skill-name>/SKILL.md with YAML frontmatter."
echo "- Packaging output must be claude-[workflow-name].zip."

# Don't leak payload back into Claude unless you intentionally want to.
# This hook output is just extra context, not a validator.
