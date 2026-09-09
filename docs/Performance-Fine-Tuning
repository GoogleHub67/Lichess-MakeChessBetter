# ⚡ Performance Fine-Tuning Guide

This guide details how to optimize `Lichess-MakeChessBetter` for ultra-low latency move calculation, high-concurrency match handling, and efficient system resource allocation.

---

## 📌 1. Engine Resource Allocation

By default, chess engine binaries (Stockfish and Fairy-Stockfish) run using minimum conservative baselines. To maintain deep analytical accuracy under rapid time constraints, you must tweak your configuration keys to match your hosting hardware or local system profile.

### CPU Core Mapping (`Threads`)
Chess engines utilize parallel search algorithms. Setting the thread configuration accurately prevents calculation bottlenecks:
* **The Rule of Thumb:** Set this value to **Total Physical CPU Cores minus 1** (leaving 1 core entirely free for the asynchronous Python event processing stream loop).
* **Consequence of Misconfiguration:** Oversubscribing threads causes high context-switching latency, resulting in the bot dropping connections or flagging on time.

### Transposition Table Allocation (`Hash`)
The `Hash` parameter dictates how much system RAM (in Megabytes) the engine allocates to cache previously calculated position states (transposition tables).
* **Recommended Allocations:**
  * *Low-spec Virtual Servers (e.g., Render Free Tier):* **64MB to 256MB**
  * *Dedicated Deployment / Home Server:* **1024MB to 4096MB**
* **Impact:** A higher hash value speeds up calculations drastically during mid-to-late game scenarios because the engine instantly identifies repeating structural tactical paths instead of calculating them from scratch.

---

## 📌 2. Engine Subprocess Optimization

Because `Lichess-MakeChessBetter` wraps engine binary pathways natively through asynchronous protocols, sub-process communication configuration determines stability:

```
┌───────────────────────────┐
│  Python Async Event Loop  │
└─────────────┬─────────────┘
              │
              │  (Standard Input Stream / stdin)
              │  Writes: "position startpos moves..."
              ▼
┌───────────────────────────┐
│  Engine Binary Execution  │
└─────────────┬─────────────┘
              │
              │  (Standard Output Stream / stdout)
              │  Reads:  "bestmove e2e4"
              ▼
┌───────────────────────────┐
│     Board State Update    │
└───────────────────────────┘
```

### Protocol Stream Buffering
* Ensure that your `python-chess` integration engine wrapper launches binaries using unbuffered pipe streams. 
* Standard system I/O buffering can introduce a **50ms to 200ms parsing delay** per move, which severely hamstrings performance during fast Blitz or Bullet match formats.

### Automated Process Recycler
* While keeping an engine process active continuously saves CPU overhead on game initialization, long-running engine sub-processes can accumulate minor memory leaks or uncollected hash tables.
* The internal pipeline safely terminates engine processes immediately upon game completion (`gameFinish` event payload) to completely reclaim operating system resources.

---

## 📌 3. Managing Asynchronous Match Concurrency

If your bot gains popularity on Lichess, it may process dozens of concurrent challenge invites. Use these parameters to safely choke incoming data pressure:

### Rate Limiting Network Ingestion
* Avoid running unthrottled loop pools. Use an explicit task-bounded worker queue (e.g., via `asyncio.Semaphore`) to cap maximum concurrent game handlers.
* **Suggested Threshold:** Maximum **3 to 5 simultaneous active games** on low-tier cloud providers to avoid hitting CPU starvation thresholds.

### Dynamic Adaptive Search Depth Capping
When the ELO Controller calculations lower the bot's temporary strength targets (e.g., adapting down to a Beginner ELO 1200 profile due to high player CPL), the engine should **not** calculate to maximum depth. 
* Pass restrictive time limits or strict analytical node caps (e.g., `nodes=1000` or `depth=5`) directly down to the binary.
* **Benefit:** Saves massive CPU cycles by forcing the engine to instantly return a lower-tier move rather than running complex, deep multi-threaded evaluations just to throw away the best moves.

---

## 📌 4. Cloud Deployment Considerations (Render Setup)

If you deploy using the live server framework pointing to your Render environment:

* **Inactivity Spin-Down:** If utilizing Render's Web Service tier, the app may spin down after intervals of zero traffic. Ensure your `cron-job.py` or an external ping process triggers the server tracking route routinely to ensure the Lichess long-lived TCP stream stays hot.
* **Ephemeral Disk Engine Paths:** Do not place your compiled Stockfish execution binaries inside folders managed by dynamic temporary runtimes. Always define structural execution components explicitly via root repository folder links (`./src` or dedicated `./config` maps).
