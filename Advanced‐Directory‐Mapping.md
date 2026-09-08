# 🗂️ Advanced Directory Mapping & Project Blueprint

This blueprint breaks down the exact operational purpose of every module, configuration layer, and automation asset within the `Lichess-MakeChessBetter` ecosystem.

---

## 📂 Complete File System Tree

```text
Lichess-MakeChessBetter/
├── .github/                                  # Repository governance and automation engines
│   ├── ISSUE_TEMPLATE/                       # Structured user submission layouts
│   │   └── bug_report.md                     # Standardization layout for reporting codebase issues
│   └── workflows/                            # Automated cloud CI/CD action loops
│       ├── bot-ci.yml                        # Validates runtime health across multi-environment builds
│       ├── build-binaries.yml                # Packages Python scripts into cross-platform standalone executables
│       ├── lint-and-test.yml                 # Evaluates source code design patterns and logic safety checks
│       └── publish.yml                       # Automatically triggers and deploys asset updates to releases
│   └── pull_request_template.md              # Quality gate requirements for community code updates
├── .vscode/                                  # Local development space settings
│   └── settings.json                         # Enforces standardized interpreter and formatting preferences
├── config/                                   # Operational parameters and deployment variables
│   ├── bot_config.py                         # Secondary parser reading active variables into system memory
│   └── config.yml.default                    # Blank template schema detailing engine token definitions
├── docs/                                     # Sphynx codebase reference manuals
│   └── source/                               # Direct asset source formatting layers
│       ├── conf.py                           # Explicit compilation parameters for Sphinx documentation engines
│       └── index.rst                         # Main entry table mapping out document indexing layouts
├── src/                                      # Primary execution core engine scripts
│   ├── RateLimit429Stopper.py                # Intercepts outgoing API packets to handle server throttling blocks
│   ├── __init__.py                           # Declares local directory spaces as explicit import objects
│   ├── bot.py                                # Bootstraps runtime loops, loads files, and opens event handlers
│   ├── game_handler.py                       # Validates active rule applications and maps square steps live
│   ├── history_manager.py                    # Indexes active session results and maintains historic profile logs
│   ├── memory_manager.py                     # Tracks, manages, and cleanses RAM scopes to handle execution leaks
│   ├── openings.py                           # Parses static binary matrix tables to trigger rapid opening paths
│   ├── scout.py                              # Scrapes competitor profiles to pinpoint match blindspots
│   ├── skill_estimator.py                    # Maps calculated error rates onto live difficulty level properties
├── tests/                                    # Automated script assets measuring internal software sanity
│   └── config.xml.default                    # Schema mockup parameters handling software isolation testing
├── .dockerignore                             # Keeps temporary workspace folders outside image building trees
├── .env.example                              # Blank layout mapping environment key parameters securely
├── .gitattributes                            # Normalizes text file endings across diverse operating systems
├── .gitignore                                # Prevents local keys and temporary files from entering history
├── .readthedocs.yaml                         # Orchestration blueprint pointing ReadTheDocs to internal source files
├── CITATION.cff                              # Formal attribution layout for researchers referencing this tool
├── CODE_OF_CONDUCT.md                        # Establishes community interaction and behavior standards
├── CONTRIBUTING.md                           # Rules detailing branch submission frameworks for developers
├── Dockerfile                                # Multi-stage packaging schema constructing host images for Render
├── LICENSE                                   # Full legal MIT open-source user agreement framework
├── README.md                                 # Punchy, scannable root landing documentation layout
├── SECURITY.md                               # Dedicated channel protocols for surfacing system vulnerabilities
├── app.py                                    # Lightweight web gateway initializing Render cloud web tasks
├── build.sh                                  # Automation script running multi-platform packaging routines
├── cron-job.py                               # Wakes the server background layer up on scheduled patterns
├── dashboard.py                              # Renders live engine efficiency charts for frontend tracking
├── error.py                                  # Monitors application anomalies and writes logging records
├── launch_unix.sh                            # Immediate environment boot initializer for Linux runtimes
├── launch_windows.bat                        # Immediate system script setup mapping console variables on Windows
├── pyproject.toml                            # Unified blueprint organizing tool configuration rules
├── requirements.txt                          # Comprehensive track list tracking external script libraries
├── setup_linux.sh                            # Prepares distribution environments natively across Linux shells
├── setup_mac.sh                              # Handles local dependency paths for Apple Silicon engines
├── setup_windows.ps1                         # PowerShell executor configuring terminal path arrays for Windows
└── test_pipeline.py                          # Sweeps the entire application structure verifying patch updates
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
