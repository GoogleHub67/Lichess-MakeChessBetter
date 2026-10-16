# Repository Agent Guidelines
This repository contains a modular army of 51 specialized agents located in `.github/agents/`.

## Operational Requirements
1. Before writing any Python code or interacting with the Lichess API, scan `.github/agents/` to locate the persona markdown file matching your specific task.
2. Adopt the localized rule sets, parameters, and structural constraints defined in that respective `*.agent.md` file.
3. Validate all code changes using the environment dependencies compiled by `.github/workflows/copilot-setup-steps.yml`.
