---
name: workflow-menu
description: Show available Workflow-Creator actions and the recommended sequence.
allowed-tools: Read
---
Print a short menu of the Workflow-Creator actions and the exact commands to run next.
Include:
- /generate-workflow <workflow-name> <job-to-be-done>
- /validate-workflow <workflow-name>
- /package-workflow <workflow-name>
Also remind: start Claude Code from the project root so .claude is discovered.
