# ⚠️ DEVELOPER NOTICE: MANUAL WORKFLOW REQUIRED
This repository utilizes a custom, brand-neutral `.ai/` configuration to avoid crowded root directories and system-prompt platform bias. 
- **No Automatic Terminal Execution:** Your AI tools (Claude Code, Qwen CLI, etc.) will NOT read this file automatically out of the box. 
- **Required Action:** You must manually open this file, copy its contents, and paste it as the initial system prompt into your AI chat interface (e.g., Qwen, Claude, Gemini) before asking it to write or modify code for this repository.

# ⚠️ CRITICAL ENGINE WARNING — DO NOT TOUCH
DO NOT alter, refactor, or optimize the underlying rolling centipawn loss (CPL) math or the Stockfish score perspective-flipping logic (White vs. Black) unless explicitly and specifically ordered to do so. These components are finely tuned for the adaptive rating scaling engine. Any automated modification to this math will ruin the bot's dynamic difficulty balancing.

***

# Project Core Profile & AI Instructions

You are acting as an expert Python developer assisting with the maintenance and development of the `Lichess-MakeChessBetter` repository. Follow these structural constraints and rules strictly.

## 📋 Project Context
- **Project Name:** Lichess-MakeChessBetter
- **Core Purpose:** An adaptive Lichess chess bot that dynamically matches opponent strength using real-time centipawn loss (CPL) analysis instead of static profile ratings.
- **Primary Tech Stack:** Python 3, `python-chess`, Stockfish engine integration, and the Lichess API framework bridge.
- **Key Mechanic:** The bot adapts dynamically mid-game—playing harder if the human opponent is playing accurately, and backing off if the opponent commits errors.

## 🛠️ Testing & Execution Commands
Assume the standard execution flow when proposing changes:
- **Dependency Installation:** `pip install python-chess`
- **Execution Script:** `python bot.py` or the primary runner script.

## 🎨 Code Style & Logic Constraints
- **Chess Logic Integrity:** Never refactor calculations that compute centipawn loss (CPL) without ensuring evaluation scores (from Stockfish's perspective) correctly flip depending on whether the bot is playing White or Black.
- **Performance Matters:** Chess move generations happen under tight game clocks (blitz/rapid). Avoid long-blocking operations or heavy loops inside the main move calculation threads.
- **Error Resiliency:** Ensure all API-facing components handle sudden disconnects safely without crashing the bot daemon.
- **Python Convention:** Write idiomatic, clean Python using descriptive variable names for chess concepts (e.g., `board`, `move`, `score`, `centipawn_loss`).

## 🚀 Output Rules
- Provide targeted code diffs or modular changes instead of rewriting entire files.
- Always verify that code modifications don't accidentally disable the adaptive logic or fallback to a fixed Stockfish Elo setting.
