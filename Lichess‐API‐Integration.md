# 📡 Lichess API & Event Streaming Pipeline

This engine handles live matches by establishing persistent HTTP/TCP socket streams with Lichess endpoints. It interprets real-time game events asynchronously rather than utilizing repetitive polling loops.

## 🏗️ Core Endpoints Ingested

### 1. The Main Event Stream
* **Endpoint:** `GET /api/stream/event`
* **Purpose:** Monitors incoming challenges and game starts.
* **Expected JSON Payload Shape:**
```json
{
  "type": "challenge",
  "challenge": {
    "id": "v9XzK4pQ",
    "variant": { "key": "standard", "name": "Standard" },
    "challenger": { "id": "chess_master_99", "rating": 1950 },
    "rated": true
  }
}
```

### 2. Live Game State Monitoring
* **Endpoint:** `GET /api/bot/game/stream/{gameId}`
* **Purpose:** Streams move updates, chat triggers, draw offers, and resignation flags directly inside an active game loop.

## 🛡️ Anti-Throttling Operations (`RateLimit429Stopper.py`)
To prevent Lichess from dropping connections during concurrent matches, the bot enforces a token bucket algorithm:
* **Max Burst Capacity:** 5 outbound HTTP calls.
* **Refill Velocity Rate:** 1 token every 1.5 seconds.
* **Drop Mitigation:** If an HTTP status response returns a `429 Too Many Requests` code, the engine instantly halts all non-move packets (like chat notifications) for 30 seconds to preserve move validation.
