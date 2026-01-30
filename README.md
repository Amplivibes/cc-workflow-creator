# Workflow Creator

Workflow Creator is a meta-project that generates **Claude Code workflows** on demand. It turns a “job to be done” into a ready-to-run project folder with a `.claude/` setup, agents, skills, commands, hooks, and a packaged export.

It is built for speed, consistency, and context efficiency. The output is designed to work with standard Anthropic models (Sonnet, Opus, Haiku) and can optionally run against **local models via Ollama**.

---

## What it generates

For each workflow you create, Workflow Creator produces:

- A workflow folder named like: `claude-<workflow-name>/`
- A `.claude/` directory with:
  - agents and their responsibilities
  - skills (reusable primitives)
  - commands (repeatable actions)
  - hooks (startup and guardrails)
  - context rules and token efficiency defaults
- A `CLAUDE.md` to steer Claude Code per workflow
- A `README.md` inside the generated workflow explaining how to run it
- A packaged export: `claude-<workflow-name>.zip`

---

## Requirements

- macOS or Linux
- `git`
- `zip`
- Claude Code installed and on PATH (`claude`)
- Optional. Ollama installed and running for local inference

Recommended:
- `jq` for debugging JSON
- Node.js or Python if your workflows generate apps

---

## Repository layout

A simple, practical layout:

```
Workflow-Creator/
  templates/
    workflow/
      .claude/
        agents/
        skills/
        commands/
        hooks/
        rules/
      CLAUDE.md
      README.md
  scripts/
    wc                  # main CLI entrypoint
    package_workflow.sh # zip helper
  examples/
    top-3-outcomes/     # example JTBD input
  outputs/
    claude-*/           # generated workflows land here
```

If your repo differs, update paths in the scripts accordingly.

---

## Quick start

### 1. Clone and enter

```bash
git clone <your-repo-url> Workflow-Creator
cd Workflow-Creator
```

### 2. Make scripts executable

```bash
chmod +x scripts/wc scripts/package_workflow.sh
```

### 3. Create a workflow from a JTBD prompt

```bash
./scripts/wc new "Daily Top Outcomes" \
  --slug daily-top-outcomes \
  --prompt-file ./examples/top-3-outcomes/jtbd.md
```

Expected output:

- `./outputs/claude-daily-top-outcomes/`
- `./outputs/claude-daily-top-outcomes.zip`

---

## Usage

### Create a new workflow

```bash
./scripts/wc new "<workflow title>" --slug <slug> --prompt "<your JTBD>"
```

Or from a file:

```bash
./scripts/wc new "<workflow title>" --slug <slug> --prompt-file ./path/to/jtbd.md
```

### Package an existing workflow

```bash
./scripts/wc package ./outputs/claude-<slug>
```

### Validate structure

```bash
./scripts/wc validate ./outputs/claude-<slug>
```

---

## Configuration

### Per-workflow steering

Each generated workflow includes a `CLAUDE.md`. Use it to define:

- default model
- the “Definition of Done” for the workflow
- input and output formats
- token discipline rules (what to read, what to ignore)
- optional integrations (Notion, Google Calendar, etc.)

Example knobs you should include in `CLAUDE.md`:

- `TOP_N_OUTCOMES=3`
- `MAX_STEPS_PER_OUTCOME=3`
- `STOP_DOING_COUNT=5`
- `MODEL_DEFAULT=sonnet`
- `MODEL_LOCAL=...` (if using Ollama)

---

## Example workflow to test

### Daily “Top 3 outcomes” plan

**Input:** a short note of goals plus current projects (or a Notion backlog export)  
**Output:** top N outcomes for the day, 3 next concrete steps each, and a “stop doing” list

A good acceptance test:

- It produces exactly N outcomes.
- Each outcome has 3 next steps that are concrete and schedulable.
- It produces a stop-doing list that is specific, not motivational.
- It avoids planning theatre. It picks the smallest set that moves real needles.

---

## Running a generated workflow with Claude Code

From inside the generated workflow folder:

```bash
cd outputs/claude-<slug>
claude
```

If you have a startup hook, you should see a short menu of options on session start.

If agents or commands are not visible in a new session, check the troubleshooting section.

---

## Using Ollama (optional)

### 1. Start Ollama

```bash
ollama serve
```

### 2. Confirm a model is available

```bash
ollama list
```

### 3. Point Claude Code at a compatible base URL

Claude Code can be configured via environment variables if you are using a compatible gateway.

Example:

```bash
export ANTHROPIC_BASE_URL="http://localhost:11434"
export ANTHROPIC_AUTH_TOKEN="ollama"
```

Notes:
- Some setups use an OpenAI-compatible route like `/v1/chat/completions`. Others expose different endpoints.
- If `curl http://localhost:11434/v1/models` returns `{"data": null}`, you are likely hitting an endpoint that Ollama does not serve in your configuration. Validate your gateway or compatibility layer.

### Confirm Claude Code is using the intended model

One practical method:
- Run a short prompt that forces the model to reveal its identity or capabilities, then compare behavior.
- Turn on verbose logging if your wrapper supports it.
- If you use a wrapper script, print environment variables and the chosen model before executing `claude`.

---

## Troubleshooting

### Agents or commands do not appear

Common causes:

1. **Wrong folder**
   - You started Claude Code from the wrong directory.
   - Fix: `cd` into the workflow root that contains `.claude/`, then run `claude`.

2. **Missing `.claude/`**
   - The folder did not generate or was not copied.
   - Fix: ensure `.claude/` exists at the workflow root.

3. **Ignored by config**
   - You may have a `.claudeignore` that excludes the directory.
   - Fix: remove or adjust ignore rules.

4. **Session caching**
   - Some tools cache project state.
   - Fix: exit Claude Code, restart the session in the correct folder.

### Wrapper script errors like `ARGS[@]: unbound variable`

This usually means your script uses `set -u` (treat unset variables as errors) and references an array that is not defined.

Fix:
- Initialize arrays before use, or avoid referencing unset arrays.
- For bash scripts, use: `ARGS=("$@")` early.

### `claude -V` returns unknown option

That indicates `-V` is not a valid flag for your Claude Code version.

Fix:
- Use `claude --version` if supported, or run `claude` with no args to see help.

### Ollama endpoint confusion

If `curl -s http://localhost:11434/v1/models` returns null data:
- You might need a compatibility proxy, or a different endpoint.
- Validate with `ollama list` first, then confirm the endpoint your gateway actually serves.

---

## Design principles

- **Small context by default.** Load only what is needed.
- **Reusable primitives.** Skills are composable.
- **One command. One outcome.** Keep commands atomic.
- **Hard guardrails.** Definitions of Done and constraints live in `CLAUDE.md`.
- **Packaging is mandatory.** Every workflow ships as a zip you can drop into another machine.

---

## Contributing

If you extend Workflow Creator:

- Keep templates minimal and opinionated.
- Prefer deterministic generation over vague prompting.
- Add a validation rule before adding more content.
- Document every new command with input, output, and acceptance tests.

---

## License

Internal project. Add a license if you plan to open source it.
