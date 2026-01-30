---
name: generate-workflow
description: Generate a new workflow skeleton under workflows/<workflow-name>/ with .claude, skills, agents, README, and packaging script.
allowed-tools: Read, Glob, Grep, Bash, Write, Edit
---
Create a new workflow called: $1

Job-to-be-done:
$2

Requirements:
- Create folder: workflows/$1/
- Add: workflows/$1/README.md describing purpose, how to run, and examples
- Add: workflows/$1/.claude/skills/ with 3-6 skills
- Add: workflows/$1/.claude/agents/ only if it reduces context bloat or improves reliability
- Add: workflows/$1/.claude/settings.json with safe hooks (optional)
- Add: workflows/$1/scripts/package.sh that builds claude-$1.zip into workflows/$1/dist/

Hard rules:
- Subagents must have YAML frontmatter with lowercase hyphenated name.
- Skills must be directories: .claude/skills/<skill-name>/SKILL.md with YAML frontmatter.
- Keep it lean. No unnecessary scaffolding.
- Include at least one verification step (e.g., check required files exist).

Output:
- After generating, print the file tree and what the user should do next.
