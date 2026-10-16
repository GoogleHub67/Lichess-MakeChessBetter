# Troubleshooting and Diagnostics Guide

This document provides a systematic approach to identifying, diagnosing, and resolving issues specific to this Python-based Lichess bot powered by **Stockfish**, utilizing a **SQLite database**, **Polyglot opening books**, and **automated chat handlers**.

---

## Quick Diagnostic Checklist

When the bot behaves unexpectedly, verify these baseline components first:
- [ ] The Lichess account is officially upgraded to a **BOT** account (the `BOT` tag appears next to the username).
- [ ] Your Personal API Token is valid, active, and has the **"Play games with the bot API"** scope enabled.
- [ ] The Stockfish binary path is absolute and has executable permissions (`chmod +x`).
- [ ] The SQLite database file exists, is writeable, and isn't locked by an external database viewer.
- [ ] The opening book file is in a valid `.bin` (Polyglot) format and is readable.

---

## Component-Specific Error Matrix

### 1. Stockfish Engine Failures

#### `EngineProcessTerminated` or `python-chess.engine.EngineTerminatedError`
*   **Cause:** Stockfish crashed, was killed by the OS due to memory limits, or was configured with unsupported parameters.
*   **Fix:** 
    1. Check your CPU usage. If Stockfish spikes to 100% and crashes, reduce the `Threads` setting in your engine configuration.
    2. Check the `Hash` setting. If your host machine has 1GB RAM, setting a 2048MB Hash will force an OS out-of-memory (OOM) kill.
    3. Match the binary architecture to your OS (e.g., don't run an x86_64 Stockfish binary on an ARM64 Raspberry Pi).

#### The Bot Loses on Time / Overhead Throttling
*   **Cause:** Network latency is high, or Python's asyncio event loop is blocking Stockfish's output processing.
*   **Fix:** Increase the move overhead buffer in your configuration so the bot submits moves earlier to account for ping:
    ```yaml
    engine:
      move_overhead: 2000 # Time buffer in milliseconds (2 seconds)
      options:
        Threads: 2
        Hash: 256
    ```

---

### 2. Database (SQLite) & State Issues

#### `sqlite3.OperationalError: database is locked`
*   **Cause:** Python is attempting to write to the database using multiple concurrent threads, or an external GUI tool (like DB Browser for SQLite) has an open uncommitted transaction.
*   **Fix:** 
    1. Close all external database managers.
    2. Ensure your bot handles database connections via an async-safe wrapper (like `aiofiles` or `aiosqlite`), or restrict database writes to a single worker thread.
    3. Increase the timeout limit in your connection string:
       ```python
       conn = sqlite3.connect('bot_data.db', timeout=30.0)
       ```

#### `sqlite3.IntegrityError: UNIQUE constraint failed`
*   **Cause:** The bot is trying to insert a game record or user statistic that already exists under a primary key (e.g., identical Lichess Game ID).
*   **Fix:** Update your code to use `INSERT OR IGNORE` or `INSERT OR REPLACE` instead of a raw `INSERT INTO` statement when caching game metadata.

---

### 3. Opening Book (`.bin`) Glitches

#### `ValueError: Not a Polyglot opening book`
*   **Cause:** The opening book path points to a `.pgn` or `.txt` file instead of a compiled Polyglot binary `.bin` file.
*   **Fix:** 
    *   Compile your PGN into a bin file using a tool like `pgn-extract` or `polyglot make-book`.
    *   Verify the library reading it (e.g., `chess.polyglot.open_reader("book.bin")`) points to a valid file.

#### Bot Plays Random Illegal Moves Out of the Opening
*   **Cause:** The book uses a different board orientation or custom text mappings that aren't aligning with the Lichess board state.
*   **Fix:** Print the moves extracted from the book reader to the log before executing them to ensure they map cleanly to `chess.Move.from_uci()`. If the book returns no entries, ensure your fallback logic defaults directly to Stockfish evaluation instantly.

---

### 4. Chat & Event Loop Blockages

#### `HTTPError: 400 Bad Request` on Chat Responses
*   **Cause:** The bot is trying to send a chat message after the game has terminated, sending empty strings, or exceeding Lichess's chat length constraints.
*   **Fix:** 
    1. Wrap your chat functions in a check that validates the game state is still active.
    2. Sanitize user inputs to prevent injection attempts or system command triggers via game chat.

#### Chat Responses Delay Move Computations
*   **Cause:** The chat handler is synchronous (`time.sleep()`), freezing the entire single-threaded Python process and stopping Stockfish from calculating.
*   **Fix:** Ensure all chat processing, database lookups, and API requests utilize asynchronous keywords (`async def`, `await asyncio.sleep()`).

---

## Debugging Environment Scripts

To run tests in a sanitized environment without affecting your live Lichess rating, use this terminal standard to capture precise runtime execution traces:

```bash
# Set logging to capture Stockfish UCI traffic and Database queries
export LOG_LEVEL=DEBUG

# Run bot and output stdout and stderr to isolated files
python3 main.py > stdout.log 2> stderr.log
```

Review `stderr.log` specifically for Python Tracebacks pointing to file line numbers.
