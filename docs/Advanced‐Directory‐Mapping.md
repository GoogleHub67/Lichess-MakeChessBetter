# 🗂️ Advanced Directory Mapping & Project Blueprint

This blueprint breaks down the exact operational purpose of every module, configuration layer, and automation asset within the `Lichess-MakeChessBetter` ecosystem.

---

## 📂 Complete File System Tree

```text
Lichess-MakeChessBetter/
├── .ai/                                  
│   ├── AI.md                             
│   ├── README.md                         
│   └── settings.json                      
├── .github/                              
│   ├── DISCUSSION_TEMPLATE/
│   │   ├── general.yml                   
│   │   ├── ideas.yml                     
│   │   ├── q-a.yml
│   │   └── show-and-tell.yml             
│   ├── ISSUE_TEMPLATE/                   
│   │   ├── bug_report.yml                
│   │   └── feature_request.yml           
│   ├── workflows/                        
│   │   ├── bot-ci.yml                    
│   │   ├── build-binaries.yml            
│   │   ├── changelog.yml                 
│   │   ├── lint-and-test.yml             
│   │   └── publish.yml
│   ├── CODE_OF_CONDUCT.md
│   ├── CONTRIBUTING.md
│   ├── CREDITS.md
│   ├── GOVERNANCE.md
│   ├── MAINTENANCE.md
│   ├── pull_request_template.md
│   ├── SECURITY.md
│   └── SUPPORT.md
├── .idea/
│   ├── .gitignore
│   ├── Lichess-MakeChessBetter.iml
│   ├── misc.xml
│   ├── modules.xml
│   └── vcs.xml
├── .vscode/
│   └── settings.json
├── config/
│   ├── bot_config.py
│   └── config.yml.default
├── docs/
│   ├── source/
│   │   ├── conf.py
│   │   └── index.rst
│   ├── _Footer.md
│   ├── _Sidebar.md
│   ├── API-Programmatic-Reference.md
│   ├── Advanced‐CI‐CD‐Automation.md
│   ├── Advanced‐Directory‐Mapping.md
│   ├── Advanced‐Framework.md
│   ├── Data‐Flow‐And‐State‐Machine.md
│   ├── FAQs.md
│   ├── Home.md
│   ├── Lichess‐API‐Integration.md
│   ├── Opening‐Book‐Configurations.md
│   ├── Performance-Fine-Tuning.md
│   ├── Render‐Deployment‐Guide.md
│   └── Security‐And‐Fair‐Play.md
├── scripts/
│   ├── launch/
│   │   ├── launch_unix.sh
│   │   └── launch_windows.bat
│   ├── setup/
│   │   ├── setup_linux.sh
│   │   ├── setup_mac.sh
│   │   └── setup_windows.ps1
│   └── README.md
├── src/
│   ├── RateLimit429Stopper.py
│   ├── __init__.py
│   ├── bot.py
│   ├── game_handler.py
│   ├── history_manager.py
│   ├── memory_manager.py
│   ├── openings.py
│   ├── scout.py
│   └── skill_estimator.py
├── .dockerignore
├── .editorconfig
├── .env.example
├── .gitattributes
├── .gitignore
├── .readthedocs.yaml
├── app.py
├── build.sh
├── CHANGELOG.md
├── CITATION.cff
├── CODEOWNERS
├── cron-job.py
├── dashboard.py
├── docker-compose.yml
├── Dockerfile
├── error.py
├── LICENSE
├── Makefile
├── Pipfile
├── pyproject.toml
├── pytest.ini
├── README.md
├── requirements.txt
├── ROADMAP.md
└── test_pipeline.py
```

---

## 🏗️ Deep Architectural Segmentation

### 🚀 Core Runtime Engine (`/src`)
This is the mission control of your bot. `bot.py` initializes asynchronous connections, passing operational states directly into `game_handler.py`. Memory allocation arrays are tracked explicitly by `memory_manager.py` to prevent background exhaustion during lengthy tournament streams.

### 🤖 CI/CD Orchestration Layer (`/.github/workflows`)
Your deployment steps utilize native cloud runners to run automated validations:
1. **Linting Loop:** Inspects structural consistency and evaluates script files for syntax regressions.
2. **Binary Pipeline:** Runs building engines across Windows and Linux matrices simultaneously to export clean, release-ready executable targets.

### 🌐 Cloud Platform Wrapper (`app.py` & `Dockerfile`)
Because cloud networks expect a reachable endpoint to track uptime health, `app.py` establishes a lightweight server listener. When hosted on Render, the engine works seamlessly alongside `cron-job.py` to keep your adaptive bot running consistently 24/7 without timing out.

---

## 🧩 Advanced Module Breakdown & Process Architecture

The Python scripts within the `/src` directory operate together as a tightly coupled, asynchronous event ecosystem. Below is the technical breakdown of how each core file executes its task:

```text
               [ Lichess Platform Stream ]
                           │
                           ▼ (Persistent TCP Event Pipe)
                     [ 1. bot.py ]
                           │
           ┌───────────────┴───────────────┐
           ▼ (Intercepts 429 Errors)       ▼ (Passes Live Match State)
  [ RateLimit429Stopper.py ]       [ 2. game_handler.py ]
                                           │
         ┌───────────────────┬─────────────┴─────────────┬───────────────────┐
         ▼                   ▼                           ▼                   ▼
  [ openings.py ]      [ scout.py ]           [ skill_estimator.py ]  [ memory_manager.py ]
  (Reads Polyglot     (Scrapes Enemy          (Calculates Rolling     (Cleans RAM Leaks &
   Book Moves)         Blindspots)             Centipawn Loss)         Tracks Allocation)
         │                   │                           │                   │
         └───────────────────┼───────────────────────────┘                   │
                             ▼                                               ▼
                     [ Stockfish Core ] ─────────────────────────────► [ system_logs ]
                 (Calculates Absolute Best)                             (via history_manager.py)
```

### 1. `bot.py` (The Entry Runtime Orchestrator)
* **Responsibility:** Bootstraps the foundational framework runtime, spins up asynchronous worker thread pools, and listens directly to incoming Lichess event pipes.
* **Process Interlocking:** Spawns authentication layers, handles network drop-outs, and instantly shifts active match packets down to `game_handler.py`.

### 2. `game_handler.py` (The Live Board State Manager)
* **Responsibility:** Implements match state verification rules, processes incoming player choices, and translates text coordinates into move strings.
* **Process Interlocking:** Loops directly through `openings.py` for immediate play, and switches control over to the Stockfish engine processing thread during complex middle-game arrays.

### 3. `skill_estimator.py` (The Adaptive Evaluation Core)
* **Responsibility:** Monitors live analytical evaluation metrics on a move-by-move basis to calculate rolling average Centipawn Loss (CPL).
* **Process Interlocking:** Maps the opponent's current precision matrix straight onto localized difficulty configurations, modifying engine calculations in real time to increase or decrease bot performance.

### 4. `RateLimit429Stopper.py` (The Traffic Sentinel)
* **Responsibility:** Intercepts outgoing API packets, tracks request velocity, and enforces a strict token-bucket model to protect endpoints.
* **Process Interlocking:** Acts as a gatekeeper before outbound Lichess chat notifications, stream confirmations, or status evaluations can leave your server environment.

### 5. `scout.py` (The Opponent Profiling Vector)
* **Responsibility:** Scrapes available platform data profiles prior to game starts to look for targeted playstyle weaknesses and tactic patterns.
* **Process Interlocking:** Injects statistical profile hints into the initial engine setup array, modifying opening strategies based on historical data.

### 6. `openings.py` (The Static Move Matrix Parser)
* **Responsibility:** Automatically parses compiled `.bin` tables to execute theoretical opening lines in milliseconds without waking up Stockfish.
* **Process Interlocking:** Hands immediate board positions back to `game_handler.py` until the bot encounters a position outside its grandmaster book parameters.

### 7. `memory_manager.py` (The Resource Boundary Monitor)
* **Responsibility:** Evaluates heap size, enforces localized trash cleanups, and monitors background Stockfish subprocess RAM allocations.
* **Process Interlocking:** Prevents application crashes and environment memory exhausting errors on low-tier hosting environments (like free Render nodes) during concurrent match sessions.

### 8. `history_manager.py` (The Chronological Log Ledger)
* **Responsibility:** Records absolute match data arrays, formats step timelines, and dumps chronological coordinate files onto standard storage arrays.
* **Process Interlocking:** Feeds analytical logs into your active `dashboard.py` layout to make sure frontend metrics remain perfectly accurate.
