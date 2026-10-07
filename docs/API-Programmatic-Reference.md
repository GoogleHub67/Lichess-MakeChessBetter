# 📖 API & Programmatic Reference

This documentation provides an exhaustive technical breakdown of the integration endpoints, network models, stream processing architectures, and data objects used by `Lichess-MakeChessBetter`.

---

## 📌 1. Lichess REST & Streaming Network Mappings

The application utilizes the official **Lichess Bot API** to orchestrate remote matches, stream games, and register algorithmic plays. All requests must contain the HTTP header authorization signature: 
`Authorization: Bearer <LICHESS_TOKEN>`.

### 🔄 A. Event Stream Ingestion Engine
* **Protocol & Route:** `GET https://lichess.org/api/stream/event`
* **Content-Type:** `application/x-ndjson` (Newline-Delimited JSON)
* **Execution Mechanics:** 
  Establishes an indefinite, long-lived HTTP chunked connection. The event processor handles streaming data line-by-line via asynchronous chunk reading loops.

#### System Event Ingestion Frames

##### Challenge Reception Payload (`challenge`)
```json
{
  "type": "challenge",
  "challenge": {
    "id": "u8Xp2Zqw",
    "status": "created",
    "challenger": {
      "id": "grandmaster_player",
      "rating": 2450
    },
    "variant": {
      "key": "standard",
      "name": "Standard"
    },
    "speed": "blitz"
  }
}
```

##### Match Lifecycle Initialization Payload (`gameStart`)
```json
{
  "type": "gameStart",
  "game": {
    "id": "51839201",
    "compat": {
      "bot": true,
      "board": true
    }
  }
}
```

---

### ♟️ B. Move Dispatch Gateway
* **Protocol & Route:** `POST https://lichess.org/{gameId}/move/{move}`
* **Parameters:**
  * `{gameId}` *(String)*: Unique cryptographic identifier of the active match grid.
  * `{move}` *(String)*: Action formatted string in standard **Universal Chess Interface (UCI)** notation (e.g., `e2e4`, `g1f3`, `e7e8q`).
* **Execution Mechanics:** 
  Dispatches the local Stockfish calculation string directly back to the active board matrix. 

#### REST Response Signature (Success 200 OK)
```json
{
  "ok": true
}
```

---

### 💬 C. Room Chat Streamer
* **Protocol & Route:** `POST https://lichess.org/{gameId}/chat`
* **Payload Structure:** `application/x-www-form-urlencoded`
  * `room` *(String)*: Target partition (Value: `"player"` or `"spectator"`).
  * `text` *(String)*: Message string payload.
* **Execution Mechanics:** 
  Ships automated status notifications (such as rolling CPL analysis, ELO difficulty locking alerts, or resignation handshakes) into the visible match feed.

#### System Outbound Data Mapping
```http
POST /api/bot/game/51839201/chat HTTP/1.1
Host: lichess.org
Content-Type: application/x-www-form-urlencoded

room=player&text=%5BMakeChessBetter%5D+Rolling+CPL%3A+14.+Locking+Engine+Strength+to+ELO+2200.
```

---

## 📌 2. Programmatic Lifecycle & Process Flows

The following system pipeline map visualizes how incoming asynchronous network frames directly pass arguments into our decoupled Python internal file modules:

```
                  +-----------------------------------------+

                  | Lichess Event Stream Network Connection |
                  +--------------------+--------------------+
                                       |
                         (Chunked NDJSON Stream Lines)
                                       v
                  +-----------------------------------------+

                  |            src/bot.py Engine            |
                  |   - aiohttp Event / Message Loop Core   |
                  +--------------------+--------------------+
                                       |
               +-----------------------+-----------------------+

               | (On Challenge Event)                          | (On Game State Event)
               v                                               v
+------------------------------+              +------------------------------+
│      Challenge Handler       │              │    Game State Dispatcher     │
│ - Inspects Variant Criteria  │              │ - Parses Board Array State   │
│ - Rejects / Accepts Invites  │              │ - Computes Rolling Avg CPL   │
+------------------------------+              +--------------+---------------+
                                                             |
                                                 (Evaluated CPL Output Data)
                                                             v
                                              +------------------------------+
                                              │     Adaptive ELO Matrix      │
                                              │ - Matches Live Skill Level   │
                                              │ - Configures Depth Limiters  │
                                              +--------------+---------------+
                                                             |
                                                (Configured Native UCI Commands)
                                                             v
                                              +------------------------------+
                                              │   Engine Process (UCI I/O)   │
                                              │ - Stockfish / Fairy-Stockfish│
                                              │ - Computes Target Move       │
                                              +--------------+---------------+
                                                             |
                                                    (Calculated Bestmove Str)
                                                             v
                                              +------------------------------+
                                              │  Outbound Dispatch Manager   │
                                              │ - Dispatches POST Move call  │
                                              +------------------------------+
```

---

## 📌 3. Core Module Manifest Reference

### `src/bot.py`
The orchestration component. Initializes network instances using `aiohttp.ClientSession`, instantiates persistent pipeline handlers, and runs the continuous tracking architecture.

### `dashboard.py` & `app.py`
Serves programmatic telemetry data endpoints. Hooks directly into the active Render execution environment, exposing vital parameters like system CPU footprint, engine task volume, active session keys, and web health markers.

### `error.py`
An exhaustive, multi-tier programmatic exception catcher mapped against structural runtime flaws:

```
| Internal Error Class | Intercepted Event Scenario | Recovery Routing Protocol |
| :--- | :--- | :--- |
| `LichessAuthError` | HTTP `401 Unauthorized` token missing `bot:play` scopes. | Terminate process immediately and log administrative warning flags. |
| `EngineTimeoutError` | Stockfish binary blocking pipe calculation beyond maximum allotment. | Kill frozen thread sub-process, spawn a secondary clean binary fallback engine, choose instant emergency move. |
| `StreamDisconnectError` | Long-lived TCP connection dropped or packet chunk tracking broken. | Trigger exponential backoff connection loop to re-authenticate stream without resetting ongoing game state data. |
```
