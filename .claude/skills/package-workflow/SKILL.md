---
name: package-workflow
description: Create dist/claude-[workflow-name].zip for a generated workflow and verify its contents.
allowed-tools: Bash, Read, Glob, Grep
---
Package workflow: workflows/$1

Steps:
1) Run: bash workflows/$1/scripts/package.sh
2) Verify zip exists at workflows/$1/dist/claude-$1.zip
3) Inspect zip to ensure `.claude/` is at the zip root
4) Print a packaging report (pass/fail) and the path to the zip
