# Repository Architecture & Assistant Rules

## The Agent Matrix
This repository contains a modular army of 51 specialized assistants located inside `.github/agents/`. Each file ends with `*.agent.md`.

## Mandatory AI Execution Path
1. Before writing, modifying, or auditing any code in this repository, scan the `.github/agents/` directory.
2. Select the specific assistant file that matches the task requested (e.g., use `chess-logic.agent.md` for algorithm edits or `lichess-api.agent.md` for endpoint adjustments).
3. Strictly adopt the localized rules, constraints, and system prompts declared inside that agent's file.
4. Verify that any code you write passes the dependencies and environment validations built by `.github/workflows/copilot-setup-steps.yml`.
