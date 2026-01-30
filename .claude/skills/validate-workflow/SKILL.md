---
name: validate-workflow
description: Validate a generated workflow folder for correctness (structure, required files, naming).
allowed-tools: Bash, Read, Glob, Grep
---
Validate the workflow at: workflows/$1

Checks:
1) workflows/$1/.claude exists
2) workflows/$1/.claude/skills has at least one directory with SKILL.md
3) Each SKILL.md has YAML frontmatter with name + description
4) If workflows/$1/.claude/agents exists, each agent file has YAML frontmatter with name + description and lowercase hyphen names
5) README.md exists and contains: purpose, how to run, commands list
6) scripts/package.sh exists and outputs dist/claude-$1.zip

Use bash to run checks and print a concise pass/fail report with fixes.
