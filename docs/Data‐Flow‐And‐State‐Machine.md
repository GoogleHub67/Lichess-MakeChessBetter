# 🔄 Data Flow Architecture & State Machine

Understanding the lifecycle of a single chess move is critical for debugging synchronization anomalies or memory timing issues across the engine threads.

## 🗺️ End-to-End Data Pipeline

When an opponent makes a move on Lichess, data travels through a multi-layered execution pipe before a counter-move is returned:

```text
 [ Opponent Move ] 
         │
         ▼ (HTTPS Stream Event)
 [ Lichess API Gateway ]
         │
         ▼ (Inbound JSON Chunk)
 [ src/bot.py ] ───────────► [ src/RateLimit429Stopper.py ] (Validates bandwidth limits)
         │
         ▼ (Parses SAN/UCI text)
 [ src/game_handler.py ]
         │
         ├──► [ src/openings.py ] ──► (Match Found? ➔ Instantly reply via API)
         │
         ▼ (Book Miss / Middle Game)
 [ src/skill_estimator.py ] ──► (Calculates rolling average Centipawn Loss)
         │
         ▼ (Restricts Max Depth / Hash limits based on target ELO)
 [ Local Stockfish Subprocess ]
         │
         ▼ (BestMove UCI String)
 [ src/game_handler.py ]
         │
         ▼ (Outbound POST Request)
 [ Lichess API Gateway ]
```

## ⚙️ The Game State Machine (`game_handler.py`)

An active game tracking node transitions through specific operational states to ensure thread-safe calculations:

```text
 ┌──────────────┐      Challenge Received      ┌──────────────┐
 │  STATE_IDLE  │ ───────────────────────────► │ STATE_SETUP  │
 └──────────────┘                              └──────────────┘
        ▲                                              │
        │ Game Concluded /                             │ Engine Initialized &
        │ Resignation Triggered                        │ Token Validated
        │                                              ▼
 ┌──────────────┐       Opponent Turn          ┌──────────────┐
 │ STATE_LOGGING│ ◄─────────────────────────── │ STATE_ACTIVE │
 └──────────────┘                              └──────────────┘
                                                       │
                                                       │ Bot Turn 
                                                       ▼
                                               ┌──────────────┐
                                               │STATE_THINKING│
                                               └──────────────┘
```

* **`STATE_SETUP`**: Allocates transient RAM structures through `memory_manager.py` and caches the opponent's historical profile metrics using `scout.py`.
* **`STATE_THINKING`**: Locks the evaluation thread pool, blocks duplicate move checks, and prevents outbound chat spam until Stockfish writes its calculation results back to the stdout pipe.
