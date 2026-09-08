# 🗂️ Advanced Directory Mapping & Project Blueprint

This blueprint breaks down the exact operational purpose of every module, configuration layer, and automation asset within the `Lichess-MakeChessBetter` ecosystem.

---

## 📂 Complete File System Tree

```text
Lichess-MakeChessBetter/
├── .ai/                                  # Project AI prompt guidance and settings.
│   ├── AI.md                             # Documentation for AI system configuration prompts.
│   ├── README.md                         # Introduction to AI directory setup details.
│   └── settings.json                     # Configuration parameters for the AI engine.
├── .github/                              # GitHub specific community and automation files.
│   ├── ISSUE_TEMPLATE/                   # Predefined formats for reporting project issues.
│   │   └── bug_report.md                 # Standard template for submitting bug reports.
│   ├── workflows/                        # Automated CI/CD pipeline automation workflows.
│   │   ├── bot-ci.yml                    # Automated integration testing for chess bot.
│   │   ├── build-binaries.yml            # Compiles project files into executable binaries.
│   │   ├── lint-and-test.yml             # Runs code style checks and testing.
│   │   └── publish.yml                   # Automatically publishes releases to deployment targets.
│   ├── CODE_OF_CONDUCT.md                # Community guidelines for participant behavior standards.
│   ├── CONTRIBUTING.md                   # Instructions for contributing to the repository.
│   ├── pull_request_template.md          # Layout template for submitting code changes.
│   ├── SECURITY.md                       # Protocols for reporting system vulnerabilities safely.
│   └── SUPPORT.md                        # Information on getting help with project.
├── .vscode/                              # Editor settings for Visual Studio Code.
│   └── settings.json                     # Specific workspace configuration settings for VSCode.
├── config/                               # Folder containing application configuration templates.
│   ├── bot_config.py                     # Python logic for loading bot settings.
│   └── config.yml.default                # Default base settings configuration file template.
├── docs/                                 # Comprehensive documentation site text files.
│   ├── source/                           # Source files for building structured documentation.
│   │   ├── conf.py                       # Configuration file for Sphinx documentation builder.
│   │   └── index.rst                     # Main landing page for Sphinx documentation.
│   ├── _Footer.md                        # Common bottom layout text for documentation.
│   ├── _Sidebar.md                       # Navigation menu layout for documentation pages.
│   ├── Advanced‐CI‐CD‐Automation.md      # Detailed guide for deployment pipeline setup.
│   ├── Advanced‐Directory‐Mapping.md     # Reference manual explaining repository path layouts.
│   ├── Advanced‐Framework.md             # Breakdown of core architectural design framework.
│   ├── Changelog‐And‐Version‐History.md  # Detailed log recording historical version changes.
│   ├── Data‐Flow‐And‐State‐Machine.md    # Diagrams tracing application data movement routes.
│   ├── FAQs.md                           # Answers to frequently asked user questions.
│   ├── Home.md                           # Documentation wiki home page introduction text.
│   ├── Lichess‐API‐Integration.md        # Reference guide for connecting Lichess endpoints.
│   ├── Opening‐Book‐Configurations.md    # Instructions customizing chess opening book databases.
│   ├── Render‐Deployment‐Guide.md        # Instructions hosting application on Render cloud.
│   └── Security‐And‐Fair‐Play.md         # Policies ensuring cheat-free and secure operations.
├── scripts/                              # Shell and batch setup utility files.
│   ├── launch/                           # Utility scripts starting application engine seamlessly.
│   │   ├── launch_unix.sh                # Bash script starting application on Linux.
│   │   └── launch_windows.bat            # Batch file starting application on Windows.
│   ├── setup/                            # Environment preparation and installation dependency scripts.
│   │   ├── setup_linux.sh                # Prepares Linux system for running project.
│   │   ├── setup_mac.sh                  # Prepares macOS environment for project execution.
│   │   └── setup_windows.ps1             # PowerShell script installing Windows environment dependencies.
│   └── README.md                         # Instructions explaining how scripts operate.
├── src/                                  # Main application source code folder.
│   ├── RateLimit429Stopper.py            # Prevents exceeding Lichess API rate limits.
│   ├── __init__.py                       # Marks directory as a python package.
│   ├── bot.py                            # Contains main chess bot behavioral logic.
│   ├── game_handler.py                   # Manages live chess game states effectively.
│   ├── history_manager.py                # Tracks and saves past game results.
│   ├── memory_manager.py                 # Optimizes system memory and data retention.
│   ├── openings.py                       # Handles chess opening book move selections.
│   ├── scout.py                          # Analyzes upcoming opponents for strategic advantages.
│   └── skill_estimator.py                # Calculates opponent strength for matchmaking adjustments.
├── tests/                                # Automated test cases for validating code.
│   └── config.xml.default                # Default settings template for test environment.
├── .dockerignore                         # Excludes specific files from Docker builds.
├── .editorconfig                         # Maintains consistent coding styles across different editors.
├── .env.example                          # Template for required environment variable settings.
├── .eslintignore                         # Prevents specific files from being linted by ESLint.
├── .eslintrc.json                        # Rules and configurations for the JavaScript ESLint tool.
├── .gitattributes                        # Sets attributes for Git repository files.
├── .gitignore                            # Specifies files Git should not track.
├── .prettierignore                       # Lists code files that Prettier formatting should skip.
├── .prettierrc                           # Layout preferences and formatting rules for Prettier.
├── .readthedocs.yaml                     # Settings for hosting documentation online.
├── app.py                                # Main entry point running the application.
├── build.sh                              # Shell script compiling or packaging application.
├── CITATION.cff                          # Provides citation format for academic referencing.
├── CODEOWNERS                            # Defines users responsible for reviewing code.
├── cron-job.py                           # Script running scheduled background automation tasks.
├── dashboard.py                          # Script launching the visual user interface.
├── Dockerfile                            # Instructions to build isolated container app.
├── error.py                              # Module handling application errors and exceptions.
├── GOVERNANCE.md                         # Details project leadership and decision-making structures.
├── LICENSE                               # Legal rights and usage terms text.
├── Makefile                              # Build automation tool script containing shortcut commands.
├── Pipfile                               # Manages Python virtual environments and dependency groups.
├── pyproject.toml                        # Modern Python project packaging configuration file.
├── pytest.ini                            # Setup choices and configurations for the Pytest suite.
├── README.md                             # Main introductory project overview and guide.
├── requirements.txt                      # Lists external library dependencies for installation.
├── ROADMAP.md                            # Outlines future features and development goals.
└── test_pipeline.py                      # Automation script to run the test suite.
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
