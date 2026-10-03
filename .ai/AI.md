# ⚠️ DEVELOPER NOTICE: MANUAL WORKFLOW REQUIRED
This repository utilizes a custom, brand-neutral `.ai/` configuration to avoid crowded root directories and system-prompt platform bias.

No Automatic Terminal Execution: Your AI tools (Claude Code, Qwen CLI, Ollama/Continue, etc.) will NOT read this file automatically out of the box.
Required Action: You must manually open this file, copy its contents, and paste it as the initial system prompt into your AI chat interface (e.g., Qwen, Claude, Gemini, local Continue panel) before asking it to write, refactor, or modify code for this repository.

# ⚠️ CRITICAL ENGINE WARNING — DO NOT TOUCH
**DO NOT** alter, refactor, or optimize the underlying rolling centipawn loss (CPL) math or the Stockfish score perspective-flipping logic (White vs. Black) unless explicitly and specifically ordered to do so by the maintainer [GoogleHub67/Lichess-MakeChessBetter](https://github.com/GoogleHub67/Lichess-MakeChessBetter). These components are finely tuned inside `src/skill_estimator.py` and `src/game_handler.py` for the adaptive rating scaling engine. Any automated modification to this math will ruin the bot's dynamic difficulty balancing.

# Project Core Profile & AI Instructions
You are acting as an expert Python developer assisting with the maintenance and development of the Lichess-MakeChessBetter repository. Follow these structural constraints and rules strictly.

## 📋 Project Context & Architecture Map
- **Project Name:** Lichess-MakeChessBetter
- **Core Purpose:** An adaptive Lichess chess bot that dynamically matches opponent strength using real-time centipawn loss (CPL) analysis instead of static profile ratings.
- **Primary Tech Stack:** Python 3, `python-chess`, Stockfish / Fairy-Stockfish engine integration, and the Lichess API streaming framework bridge.
- **Key Mechanic:** The bot adapts dynamically mid-game—playing harder if the human opponent is playing accurately, and backing off if the opponent commits errors.
- **Core Module Layout:**
  - `src/bot.py`: Main execution runner and network streaming daemon.
  - `src/skill_estimator.py`: Calculates rolling CPL variance and handles dynamic ELO shifting matrices.
  - `src/RateLimit429Stopper.py`: Manages outbound Lichess HTTP request backoffs to prevent flood penalties.
  - `src/stockfish_check.py`: Manages background engine execution paths, UCI protocols, and process isolation.
  - `src/game_handler.py`: Orchestrates active board streams and processes multi-variant loops.

## ⚙️ THE 28-STAGE SEQUENTIAL AGENTIC ORCHESTRATION PIPELINE
When executing multi-file features, architectural updates, or troubleshooting regressions, developers must invoke specialized agent blueprints from `.github/agents/` in this exact chronological assembly line to maximize token context efficiency and prevent instruction rot:

### 📡 PHASE 1: THE INTAKE & PROTOCOL ENGINE
*CONTEXT ANCHOR:* Agents must first read `docs/Lichess‐API‐Integration.md` to ground all live data pipe parameters.

1. `@lichess-api.agent.md` ➡️ Establish the raw HTTP stream handshake with lichess.org.
2. `@webhook-handler.agent.md` ➡️ Intercept, authenticate, and validate incoming challenge payload headers.
3. `@stream-parser.agent.md` ➡️ Slice incoming line-delimited JSON chunks down into memory strings instantly.
4. `src/RateLimit429Stopper.py` ➡️ Enforce outbound request backoffs to guarantee zero flood penalties.

### 🧠 PHASE 2: THE ROUTING & RUNTIME STATE LAYER
*CONTEXT ANCHOR:* Agents must first read `docs/Data‐Flow‐And‐State‐Machine.md` and `docs/Advanced‐Framework.md` to map data routing.

5. `@orchestrator.agent.md` ➡️ Triage the incoming match and delegate task loads to specialized workers.
6. `@chess-bot-dev.agent.md` ➡️ Spin up the core module hooks inside `src/bot.py` on an isolated branch.
7. `@game-handler.agent.md` ➡️ Route active streams into live board state instances.
8. `@stats-manager.agent.md` ➡️ Bind telemetry counters to tracking components to verify ongoing operations.

### 📈 PHASE 3: THE MATHEMATICAL SCALING ENGINE
*CONTEXT ANCHOR:* Agents must first read the `docs/` path files sequentially, including `docs/Opening‐Book‐Configurations.md`, `docs/Performance-Fine-Tuning`, and `docs/API-Programmatic-Reference` to pull systemic mathematical anchors before altering calculation verifications.

9. `@elo-testing.agent.md` ➡️ Initialize evaluation metrics matching parameters mapped in `/.ai/AI.md`.
10. `@cpl-variance.agent.md` ➡️ Track the statistical standard deviation curves of rolling user accuracies.
11. `@move-serialization.agent.md` ➡️ Validate string mutations (SAN/UCI/PGN) across game steps.
12. `@cache-manager.agent.md` ➡️ Cache recurrent position logs in memory tables to protect computational velocity.

#### 🧮 PYTHON MATH MATRIX FORMULAS (DO NOT MUTATE APPLICATION CALCULATIONS)
When writing verification fixtures or reading data outputs in this phase, ensure tracking aligns with these math structures:
- **Rolling Centipawn Loss (CPL) Average:**
  `avg_cpl = sum(cpl_history[-window_size:]) / min(len(cpl_history), window_size)`
- **Target Difficulty Scaling Variance Engine:**
  `target_elo = max(1000, min(2200, baseline_elo + (variance_coefficient * statistical_deviation)))`
- **Stockfish Perspective Score Inversion:**
  `bot_perspective_score = raw_score if board.turn == bot_color else -raw_score`

### ⚡ PHASE 4: THE BINARY & PROTOCOL INTERFACE
*CONTEXT ANCHOR:* Agents must first read `docs/API-Programmatic-Reference` and `docs/Performance-Fine-Tuning` for sub-process hooks.

13. `@uci-protocol.agent.md` ➡️ Secure the async standard I/O text pipes between Python and subprocess binaries.
14. `@stockfish-eval.agent.md` ➡️ Tune configuration parameters (Search Threads, Hash memory) for baseline stockfish.
15. `@chess-variants.agent.md` ➡️ Handle non-standard board geometries and rule adjustments for variants.
16. `@fairy-config.agent.md` ➡️ Inject parameters explicitly required by target Fairy-Stockfish variant builds.
17. `@fairy-translator.agent.md` ➡️ Translate alternative engine score symbols perfectly into native app variables.

### 🛑 PHASE 5: THE ENVIRONMENT & DEFENSIVE HARDENING
*CONTEXT ANCHOR:* Agents must first read `docs/Security‐And‐Fair‐Play.md` and `docs/Advanced‐Directory‐Mapping.md` for safety boundaries.

18. `@process-cleanup.agent.md` ➡️ Enforce mandatory `engine.quit()` lifecycle traps on all executing threads.
19. `@daemon-shutdown.agent.md` ➡️ Capture `SIGINT` / `SIGTERM` indicators to cleanly drop sockets without zombie leaks.
20. `@env-validator.agent.md` ➡️ Intercept runtime execution strings to guarantee zero leakage of credential keys.
21. `@security.agent.md` ➡️ Audit patch modifications to guarantee no accidental `lip_` tokens slip into public code.

### 💻 PHASE 6: THE USER INTERFACE & INFRASTRUCTURE PLATFORM
*CONTEXT ANCHOR:* Agents must first read `docs/Render‐Deployment‐Guide.md` for target run loops.

22. `@web-dashboard.agent.md` ➡️ Re-evaluate layout parameters across `app.py` and `dashboard.py`.
23. `@devops.agent.md` ➡️ Build low-overhead container patterns within the root `Dockerfile` context.
24. `@render-deploy.agent.md` ➡️ Validate environmental scripts and runtime configurations targeted at the Render host.
25. `@server-health.agent.md` ➡️ Service system checks via the `/health` endpoint under a strict 2ms constraint.

### 💡 PHASE 7: THE QUALITY ASSURANCE & PACKAGING TERMINUS
*CONTEXT ANCHOR:* Agents must first read `docs/Advanced‐CI‐CD‐Automation.md` to confirm testing pipelines.

26. `@qa-tester.agent.md` ➡️ Assemble verification code layers inside the `/tests` folder ecosystem.
27. `@mock-simulator.agent.md` ➡️ Run offline bot-vs-bot dummy streams to track system reactions under load.
28. `@fixture-manager.agent.md` ➡️ Provision reusable test payloads, confirm lint rules, and build compiled distribution wheels.

## 🛠️ Testing, Configuration & Execution Commands
Assume the standard execution flow when proposing changes:
- **Dependency Installation:** ```pip install -r requirements.txt```
- **Environment Context:** Reference environment templates matching target platforms located at `config/env/`.
- **Execution Script:** ```python src/bot.py```
- **Test Runner Execution:** Run tests using ```pytest tests/test_pipeline.py```.

## 🚫 Project Context & File Exclusions
To conserve your token context window, maximize processing speed, and avoid analyzing redundant or irrelevant data, you must completely ignore, skip, and avoid reading or referencing files inside the following paths:
- **IDE & System Files:** Do not read `.idea/`, `.vscode/`, `*.DS_Store`, or `Thumbs.db`.
- **Media & Assets:** Do not process binary assets or UI graphics inside `assets/`.
- **Active Secrets:** Never look inside `.env`, `.env.*`, `config/env/.env`, or `config/env/*.local`.
- **Admin Overhead:** Skip reading the entirety of `.github/agents/` globally to prevent instruction rot. Access agent configurations *only* when explicitly invoked in localized prompts. Keep `.github/workflows/` accessible for CI tasks.
- **Build & Runtime Artifacts:** Skip all Python runtime caches, test outputs, and build artifacts.

## 🎨 Code Style & Logic Constraints
- **Chess Logic Integrity:** Never refactor calculations that compute centipawn loss (CPL) without ensuring evaluation scores (from Stockfish's perspective) correctly flip depending on whether the bot is playing White or Black.
- **Performance Matters:** Move generations must remain non-blocking. Prioritize modern, clean asynchronous `asyncio` loops.
- **Python Convention:** Write idiomatic, clean Python using descriptive variable names for chess concepts (e.g., `board`, `move`, `score`, `centipawn_loss`).

## 🚀 Output Rules
- Provide targeted code diffs or modular changes instead of rewriting entire files.
- Always verify that code modifications don't accidentally disable the adaptive scaling engine or fallback to a fixed Stockfish Elo setting.

## 📌 HARDWARE TARGET NOTICE
- **Future Reference Only:** The file located at ``docs/Raspberry-Pi.md`` serves strictly as a future author reference for low-power hardware target optimization concepts. AI agents CAN read this document to cross-reference design concepts and produce smarter, more hardware-efficient architecture ideas; however, the logic contained within that document does NOT affect or restrict current application code logic cycles.
