# Changelog

## [2026-10-07] - AI Generated
- **Added**: General.yml configuration for site settings.


## [2026-10-07] - AI Generated
- **Date:** 2023-05-15
  - **Added**
    - **Ecosystem Structural Branch**: Created the main `Lichess-MakeChessBetter` ecosystem subfolder containing an internal `.ai/` operational hub along with baseline `AI.md` and `README.md` documentation templates.
    - **Environment Trackers**: Added a root-level `.gn` ecosystem configuration script within the `assets` directory tree.
    - **Media Ingestion**: Uploaded raw graphic screenshots (`Screenshot 2026-09-13 112757.png` and `Screenshot 2026-09-13 103540.png`) to the project repository.
  - **Changed**
    - **Asset Directory Refactoring**: Consolidated graphic asset paths by shifting raw camera images and renaming them down into clear, structured file targets:
      - `Screenshot 2026-09-13 103540.png` became `bot_stats.png` (migrated across `assets/images/` paths to a standardized root at `assets/bot-profile.png`).
      - `Screenshot 2026-09-13 112757.png` became `live-gameplay-analysis.png`.
      - `Screenshot 2026-09-13 112757.bmp` became `live-gameplay-analysis.bmp`.
    - **Changelog Automation Pipelines**: Upgraded the `update_changelog.py` script and `changelog.yml` workflow parameters to generate clean, human-scannable logs directly from git diff streams while protecting historical dates from accidental layout shifts.
    - **Environment Tracking Attributes**: Adjusted `.editorconfig` rules and updated `.gitattributes` parameters twice to enforce absolute project layout limits and streamline runtime file processing.
  - **Fixed**
    - **Path Resolution Errors**: Fixed broken file reference redirections caused by shifting files across the `assets/`, `images/`, and sub-folder tracks.


## [2026-10-04] - AI Generated
- **Added:** Automated process to backfill historical commit data from `git log` before September 14th, ensuring accurate historical changelogs.
- **Changed:** Improved error handling and logging for cleaner output.
- **Fixed:** Enhanced the `git log` command to use the strict clean filter strategy to prevent corruption of line-breaks in commit messages.
- **Fixed:** Updated the prompt format for the AI model to only include the commit message and summary of file changes.
- **Fixed:** Added a force push to the remote repository to ensure the workspace is perfectly synchronized before committing.


## [2026-10-04] - AI Generated
- **Fixed**: Cleaned up the separator structure in the Git log to prevent newlines from prefixing the SHA strings.
- **Added**: Added explicit `strip()` to every individual piece of data in the Git log to drop corruptive line-breaks.
- **Fixed**: Modified the command to fetch the commit message from `git show` and passed it to Ollama.


## [2026-10-04] - AI Generated
- **Changed**: Updated the Python version from "Python 3.10 (Lichess-MakeChessBetter)" to "Python (Lichess-MakeChessBetter)" in the `.idea/misc.xml` file.


## [2026-10-04] - AI Generated
- Updated `.vscode/settings.json` to include Python analysis paths, enabling `formatOnSave`, configuring Prettier, ESLint, and setting default formatters.


## [2026-10-03] - AI Generated
- Added Accessibility guidelines and other helpful resources for contributing.


## [2026-10-03] - AI Generated
- Added the accessibility statement for Lichess-MakeChessBetter.
- Changed the accessibility design by making the bot compatible with screen readers, keyboard-friendly gameplay, and developer-friendly terminal experiences.
- Extended the conformance status section to include guidelines for text-based diagnostics, chat integration, and known limitations.
- Updated the troubleshooting methods for developers running the script.
- Added links to feedback and support channels for users.


## [2026-10-03] - AI Generated
- Added `agents/` directory with several new agent-specific documentation files.
- Improved documentation for each agent within the `agents/` directory.


## [2026-10-03] - AI Generated
- **Added:** A new phase ` QUALITY ASSURANCE & PACKAGING TERMINUS` has been added to the project's roadmap.
- **Fixed:** A bug in the `QA-tester.agent.md` has been fixed to ensure proper testing pipelines are confirmed.
- **Changed:** The `mock-simulator.agent.md` now runs offline bot-vs-bot dummy streams to track system reactions under load.
- **Added:** The `fixture-manager.agent.md` has been updated to provision reusable test payloads, confirm lint rules, and build compiled distribution wheels.


## [2026-10-03] - AI Generated
### Changelog Entry

#### Added
- Updated the `.ai/AI.md` file to include detailed instructions on manual system prompt setup for AI tools.
- Added a new section on the project core profile and AI instructions, including a detailed architecture map for the 28-stage sequential execution pipeline.
- Introduced new agent blueprints in `.github/agents/` for each phase of the pipeline, with specific commands for each step.

#### Changed
- Modified the test runner execution command to include the `requirements.txt` file instead of the `Pipfile`.
- Updated the `.github/workflows/` directory to ensure all agent configurations are accessible only when explicitly invoked in localized prompts.
- Ensured that the build and runtime artifacts are skipped globally, except for the `.github/agents/` directory which must remain accessible for CI/CD pipeline tasks.

#### Fixed
- Fixed any issues related to redundant configs and active secrets, ensuring that sensitive information is handled securely.
- Improved error resilience by ensuring that API-facing components handle sudden disconnects safely without crashing the bot daemon.
- Enhanced code style and logic constraints by providing targeted code diffs or modular changes instead of rewriting entire files.


## [2026-10-03] - AI Generated
- Added: Cloud Logger Agent documentation for GitHub Actions.


## [2026-10-03] - AI Generated
- Added: `.github/agents/fixture-manager.agent.md` to manage mock match data models and reusable test fixtures for test runs.
- Added: Instructions provided to maintain precise JSON/dict payload collections that mimic standard Lichess API match updates.
- Added: Directive to respect `/.ai/ai.md`—never change the core centipawn calculations inside testing setups.


## [2026-10-03] - AI Generated
- **Fixed**: Updated `requirements.txt` to remove the unused `python-chess` dependency.


## [2026-10-03] - AI Generated
- Added a new `.github/agents/frontend-instructions.md` file to specify Python script layout controls and formatting requirements.


## [2026-10-03] - AI Generated
- Added a notice about the use of a custom, brand-neutral `.ai/` configuration to avoid crowded root directories and system-prompt platform bias.
- Required action: Users must manually open the `.ai/AI.md` file, copy its contents, and paste it as the initial system prompt into their AI chat interface before asking it to write or modify code for this repository.


## [2026-10-03] - AI Generated
- Updated `dependabot.yml` to version 2.0.1 to ensure compatibility and latest features.


## [2026-10-03] - AI Generated
- Added new issue template for bug reports.
- Updated label for bug issues.


## [2026-10-03] - AI Generated
- **Fix**: Added @GoogleHub67 as the automatic reviewer for every file in the repository.


## [2026-10-03] - AI Generated
- Updated CODEOWNERS file to include @torvalds as the reviewer for every file in the repository.


## [2026-10-03] - AI Generated
- **Added**: Added new files and directories to the repository, including `announcements.yml`, `general.yml`, `ideas.yml`, `q-a.yml`, `bot-ci.yml`, `build-binaries.yml`, `changelog.yml`, `codeql-analysis.yml`, `lint-and-test.yml`, `publish.yml`, `DISCUSSION_TEMPLATE.yml`, `dependabot.yml`, `GOVERNANCE.md`, `MAINTAINERS.md`, `pull_request_template.md`, `release-drafter.yml`, `SECURITY.md`, `SUPPORT.md`, `.idea/`, `config/`, `env/`, `bot_config.py`, `config.yml.default`, `README.md`, `requirements.txt`, ` ROADMAP.md`, `Dockerfile`, `LICENSE`, `Makefile`, `Pipfile`, `pyproject.toml`, `pytest.ini`, `README.md`, `requirements.txt`, ` ROADMAP.md`.
- **Changed**: Updated the `.idea/` directory by renaming `env/` directories to match the new directory names.
- **Fixed**: No issues were fixed in this change.


## [2026-10-03] - AI Generated
- Added new `.github/workflows/codeql-analysis.yml` workflow for advanced security analysis of Python-based MakeChessBetter.


## [2026-10-03] - AI Generated
- Added a dynamic path correction to force the execution environment to look at the project root.
- Changed the installation process to use PowerShell scripts for setting up the virtual environment.
- Fixed an issue where the configuration file was not being automatically generated if missing.
- Improved the configuration error message to provide clearer instructions for non-developers.


## [2026-10-03] - AI Generated
- Fixed broken environment in build process.


## [2026-10-03] - AI Generated
- **Added: `main()` function for handling the bot startup**.
- **Changed: Separated `lichess_bot.py` into `bot.py` and `lichess_bot.py`**.
- **Fixed: Moved `engine` initialization out of class scope**.


## [2026-10-03] - AI Generated
- Updated the announcement template to include a `title` field.
- Modified the `body` section to include the `title` field.


## [2026-10-03] - AI Generated
- **Added**: Added the `.github/DISCUSSION_TEMPLATE/show-and-tell.yml` file to the repository, which provides a template for creating discussion prompts in the format `[Showcase]: [Description]`.
- **Fixed**: Updated the `.github/DISCUSSION_TEMPLATE/show-and-tell.yml` file to ensure it is correctly formatted and includes the necessary fields for a discussion prompt.


## [2026-10-03] - AI Generated
- Removed `pytest.ini` file as it was causing issues with the project setup.


## [2026-10-03] - AI Generated
- Removed `Pipfile` due to version removal.


## [2026-10-03] - AI Generated
- **Added:** `python-chess` dependency to the project for chess-related functionality.


## [2026-10-03] - AI Generated
- **Added**: `pyyaml`, `requests`, `streamlit` to the `requirements.txt`.


## [2026-10-02] - AI Generated
- **Added**: Introduce support for multiple operating systems by adding an example `.env.example` file tailored to each system.
- **Changed**: Modify the `launch_unix.sh` script to use a custom `.env.example` file for the specified operating system, ensuring compatibility across different environments.


## [2026-10-02] - AI Generated
- Added: Added instructions on opening the `windows.env.example` file, replacing the token, saving the file, and then double-clicking the `launch-windows.bat` file to play the game.
- Updated: Corrected the sentence "Double-click your launch-windows.bat file to play!" to "Double-click your launch-windows.bat file to play!"


## [2026-10-02] - AI Generated
- **Added:**
  - Updated the title from "Lichess Adaptive Chess Partner" to "Lichess MakeChessBetter Launcher".
  - Added a new section to validate the presence of the Lichess API token in the `.env` file.
  - Provided instructions for non-developers on how to configure the token if missing.
- **Changed:**
  - Removed the `cd` command to directly navigate to the project root.
- **Fixed:**
  - Added conditional checks for the virtual environment activation and the execution of the bot scripts.
  - Improved error handling to provide more informative feedback to non-developers.


## [2026-10-02] - AI Generated
- Added: Initial setup script created.
- Added: Dynamic path correction included to set up the project root.
- Added: Python Virtual Environment creation and upgrade.
- Added: Stockfish Engine installation via Homebrew.
- Added: Creation of a template `.env` file for configuration.
- Added: Instructions for non-developers to configure and run the bot.


## [2026-10-02] - AI Generated
- **Added**: Added a new GitHub Actions workflow to build native binaries and assets for the project.
- **Changed**: Reorganized the workflow to remove `--add-data` flags, allowing the app to look natively in the root directory it is launched from.
- **Fixed**: Adjusted the `pyinstaller` command to ensure the executable and its system dependencies folder are included in the distribution.
- **Critical**: Moved the config folder directly to the root desktop layout, outside the internal sandboxing zone, to provide a user-friendly experience.


## [2026-10-02] - AI Generated
- **Fixed:** Optimized the build process by switching from PyInstaller's `--onefile` to `--onedir` for compiling standalone applications. This change aims to make the compiled files more accessible and predictable.
- **Fixed:** Fixed the stage of copying the PyInstaller executable to the output directory, ensuring that the executable and its associated configuration files are properly placed in the `output` directory. This resolves issues related to the execution of the compiled application.


## [2026-10-02] - AI Generated
- Fixed: Corrected PyInstaller configurations to match Python path calculations.
- Added: Staged the full configuration directory next to the executable for user convenience.


## [2026-10-02] - AI Generated
- Added `.github/release-drafter.yml` file with detailed category labels and version resolution instructions.


## [2026-10-02] - AI Generated
- **Added**: Added configuration files (`config/bot_config.py`, `config/config.yml.default`, `config/README.md`, `config/env/windows.env.example`, `config/env/macos.env.example`, `config/env/linux.env.example`) to ensure all required settings are included during the binary build process.


## [2026-10-02] - AI Generated
- Changed the PyInstaller command to unpack the "config/" folder structure as a complete "config/" directory rather than dumping its contents flatly.


## [2026-10-02] - AI Generated
- **Build Binaries**: Added a `.github/workflows/build-binaries.yml` file to build native libraries and standalone applications. This workflow now uses `python -c` to compile native modules directly from the project root and `pyinstaller` to build standalone applications with the entire config folder structure included.


## [2026-10-02] - AI Generated
- Fixed an issue where the OAuth2 token was not being correctly stored in the `config.yml.default` file.


## [2026-10-02] - AI Generated
- **Added**: Staging the full configuration directory recursively for out-of-box user convenience.
- **Changed**: Updated `--add-data` to specify "config" directly instead of wildcards, ensuring PyInstaller safely copies the entire folder structure, including hidden dotfiles.


## [2026-10-02] - AI Generated
- Added a `--add-data` argument to the `pyinstaller` command to include all files under `config/` recursively.
- Updated the workflow to create a copy of `config.yml.default` as a template for users.
- Added a step to copy the `config` directory to the output directory to ensure all necessary files are included.


## [2026-10-02] - AI Generated
- **Added**: Updated the `.github/workflows/build-binaries.yml` to include an additional `--add-data` argument to load `config.yml.default` instead of the default `config.yml`, enhancing user setup ease.
- **Changed**: Adjusted the path for `config.yml.default` in the `--add-data` command to correctly reference it.


## [2026-10-02] - AI Generated
- Added a new step to the workflow to compile and stage standalone applications for different operating systems using PyInstaller.
- Changed the artifact naming to include the operating system and version.
- Added a matrix variable `${{ matrix.sep }}` to ensure multi-platform compatibility.


## [2026-10-02] - AI Generated
- **Added**: Updated the workflow to use the project root as the destination directory for the generated artifacts.
- **Changed**: Adjusted the file extensions in the PyInstaller configuration to match the project structure and preserve the crucial python platform tags.


## [2026-10-02] - AI Generated
- **Fixed**: Removed unused `.github/workflows/update-dir.yml` file.


## [2026-10-02] - AI Generated
- Added new GitHub Actions workflows for updating the main-repo's directory tree and wiki.
- Corrected URL construction to avoid syntax-breaking backslashes.
- Added a step to stage and push modified files to the main branch.
- Added new steps for building and updating the wiki, ensuring it reflects the current directory structure.


## [2026-10-02] - AI Generated
- **Added**: Automated directory mapping refresh workflows added.
- **Changed**: Code refactored for better readability and efficiency.
- **Fixed**: Ensured correct handling of line endings and file content for updates.


## [2026-10-02] - AI Generated
- **Fixed**: Improved the script for generating the file system tree by removing unnecessary hidden configuration directories and ensuring a clear, ordered listing of directories and files. The tree is now sorted by folder and file names, with folders starting with a dot first and sorted alphabetically. This improves the readability and organization of the tree in the generated Markdown files.
- **Added**: Added a step to execute a Python script `update_tree.py` that generates the file system tree. This script handles string patching safely to ensure the tree is correctly formatted and included in the Markdown files. The script uses the `os` module to recursively traverse the directory structure, sorting folders and files based on the specified criteria.


## [2026-10-01] - AI Generated
- **Added:** Updated the `.github/workflows/update-dir.yml` file to automate the refreshing of the directory map for the `Advanced-Directory-Mapping.md` file.
- **Changed:** Modified the `Generate File System Tree` step to directly inject the generated tree into the `docs/Advanced-Directory-Mapping.md` file using Python, avoiding the need for a rebase step.


## [2026-10-01] - AI Generated
- **Updated Directory Map Refresh Workflow**:
  - Automates the refresh of the directory map every 6 hours.
  - Removes any existing uncommitted changes and untracked files globally.
  - Fetches the latest data from the remote repository and rebase your map update smoothly on top.

- **Automated Directory Map Refresh**:
  - Ensures the directory map is always up-to-date.
  - Removes any lingering uncommitted changes and untracked files.
  - Fetches the latest data and rebase your map update.


## [2026-10-01] - AI Generated
- Fixed CRLF line endings globally inside the runner
- Stashed any remaining configuration modifications to leave the branch perfectly clean
- Fetch latest data and rebase your map update smoothly on top


## [2026-10-01] - AI Generated
- **Fixed**: Updated `.github/workflows/update-dir.yml` to include a step to fetch the latest changes from the `main` branch and rebase the automated commit on top before pushing. This ensures that your changes are the latest ones before merging into the main branch.


## [2026-10-01] - AI Generated
- Corrected URL construction without syntax-breaking backslashes


## [2026-10-01] - AI Generated
- **Fixed:** Corrected URL construction in `.github/workflows/update-dir.yml` to avoid syntax-breaking backslashes.
- **Changed:** Added a check to ensure the `wiki-repo` directory exists before attempting to clone it and perform further operations.


## [2026-10-01] - AI Generated
- Fixed the generation of the file system tree. Now the generated output is correctly formatted.


## [2026-09-21] - AI Generated
- Updated `flask` dependency to `3.1.3` for compatibility with Pipfile's requirement.


## [2026-09-21] - AI Generated
- **Fixed**: Corrected the date in the `CITATION.cff` file from `2022-03-22` to `2026-03-22`.


## [2026-09-20] - AI Generated
- Added a new field `placeholder` to the `body` section of the issue template for `lichess game URL` to provide a default value if one is not specified.


## [2026-09-20] - AI Generated
- Added `.github/dependabot.yml` file with weekly package updates.


## [2026-09-20] - AI Generated
- **Added:** The `Raspberry-Pi.md` file now includes detailed instructions on setting up the Raspberry Pi operating system.


## [2026-09-20] - AI Generated
### Added

- **Safety Glasses / Goggles**: Added clear ANSI Z87.1 rated polycarbonate safety glasses to prevent flying solder splatters, trimmed wire ends, or snapping component leads from injuring your eyes during assembly.

### Changed

- **Isopropyl Alcohol (IPA) & Brush**: Updated the instructions for cleaning the PCB and pads, specifying the percentage of Isopropyl Alcohol and the type of brush or cotton swabs to use.

- **Cable Zip Ties & Sticky Clips**: Revised the cable management instructions, detailing the small 4-inch nylon cable ties and self-adhesive wire routing clips.

### Fixed

- **Logic Level Shifter (74AHCT125)**: Added a note about the need for 32 6mm x 2mm N35 or N42 Neodymium Disc Magnets for piece detection.


## [2026-09-20] - AI Generated
- Added: Updated the operating system setup section in the documentation for Raspberry Pi.


## [2026-09-20] - AI Generated
### Added

- **Physical Chess Board & Enclosure**: Contains the Raspberry Pi 5, Arduino, power supply, and LED grid underneath the board.
- **Light Diffusers**: Spreads out raw LED point lights into evenly lit square highlights for clearer move visibility.
- **Brass Standoffs & Screws**: Elevates the Pi 5 and Arduino off board surfaces to prevent circuit shorts and ensure airflow.
- **Soldering Iron & Solder**: Secures permanent power and data wires onto raw LED strip copper pads after breadboard testing.
- **Heat-Shrink Tubing**: Covers bare solder joints on power and data lines to prevent short circuits inside the frame.
- **Hot Glue Gun / Mounting Tape**: Secures cut LED strips in straight rows directly beneath the chess board squares.

### Changed

None.

### Fixed

None.


## [2026-09-20] - AI Generated
- **Added:** Documenting the hardware components, electrical protections, and system setup for the Raspberry Pi.
- **Changed:** Updated the circuit protection kit to include a 470Ω resistor and a 1000µF electrolytic capacitor.
- **Added:** Adding 64GB microSD card or USB 3.0 flash drive for primary boot media and storage.
- **Added:** Installing Adafruit NeoPixel Library for Arduino firmware engine.


## [2026-09-18] - AI Generated
- **Added**: Corrected the script path to ensure it points to the main project directory.
- **Changed**: Updated the `source venv/bin/activate` command to activate the virtual environment in the correct path.


## [2026-09-18] - AI Generated
### Added

- 📍 Dynamic Path Correction: Changed script to run relative to the project root folder.
- 🐟 Install Stockfish Engine globally via APT for non-Debian/Ubuntu systems.

### Changed

- 🐇 Updated Python Virtual Environment creation to use a `venv` directory.
- 🐞 Updated `requirements.txt` installation within the virtual environment.
- 🌟 Added instructions for manual installation of Stockfish Engine on non-Debian/Ubuntu systems.

### Fixed

- 🔍 Ensured `stockfish` is installed globally via APT for non-Debian/Ubuntu systems.
- 📝 Added note about the `BOOK_PATH` configuration file in `config.py` or `.env`.


## [2026-09-18] - AI Generated
- **Added Dependencies:** Added `pandas` and `streamlit` to the `dependencies` list in `pyproject.toml`.
- **Fixed Dependency Order:** Reordered the `dependencies` to ensure `pandas` comes before `streamlit`, which is the order in which they are defined in the project scripts.


## [2026-09-14]
### Added
- **Hardware & Prototyping Blueprints**: Added documentation, configuration details, and setup guides for the Raspberry Pi 5, Arduino Nano V3.0/Uno R3, WS2812B LED Strip, 5V 5A Power Adapter, solderless breadboards, circuit protection kits, 20 AWG hook-up wires, and the Adafruit NeoPixel Library (`docs/Raspberry-Pi.md`).
- **Configuration Architecture**: Created `bot_config.py` along with `config.yml.default` to handle core environment-driven class settings, tracking parameters, and bot behaviors.
- **Cross-Platform OS Environments**: Added dedicated, platform-specific environment directory templates for Windows (`.windows.env.example`), macOS/Homebrew (`.macos.env.example`), and Linux/Docker runtimes (`.linux.env.example`).
- **Dependencies & Testing Framework**: Migrated package management from `Pipfile` to `tool.uv` in `pyproject.toml`, pinned `requires-python` to `>=3.10`, added `pip install python-chess`, and integrated `pytest`, `pytest-mock`, and `ruff` for robust unit testing and code quality checks.
- **Automated Book Downloads**: Implemented the `ensure_opening_book_exists` handler method to automatically pull down the heavy binary book file from remote V2.1.0 release storage if it is missing locally.

### Changed
- **Operating System Base**: Switched the default OS deployment configuration from Raspberry Pi OS Lite to Raspberry Pi OS (64-bit, Bookworm) to support a dedicated standalone chess server device.
- **Repository Documentation Standards**: Updated `README.md` to add explicit workflow styling rules against adding redundant title headers like "Changelog Entry", "Date:", or "Generated Changelog".
- **Project Version Metadata**: Patched `CITATION.cff` to inject version `2.1.0`, adjusted the historic release timeline coordinates to match your repository launch context, and updated the home URL target to point accurately to the GitHub repository.
- **Test Infrastructure Paths**: Moved active test configurations out of standalone `pytest.ini` targets and consolidated them into the `tool.pytest.ini_options` schema inside `pyproject.toml`.
- **AI Documentation Overhaul**: Restructured `AI.md` to include comprehensive sections regarding AI applications, ethical considerations, future trends, and general readability improvements.

### Fixed
- **Hardware Layout Connections**: Modified breadboard wiring graphics and jumper wire setup sheets to correct manual routing flaws and secure stable physical connections.
- **Engine Path Resolution**: Fixed absolute path tracking mechanics for the `STOCKFISH_PATH` environment variable to ensure seamless root folder detection across different OS platforms.
- **Token Ingestion Security**: Robustified the `LICHESS_TOKEN` loading routine by forcing an explicit environment variable load sequence from the root level `.env` file to prevent missing token faults.
- **Book Path Tracking**: Fixed the platform-agnostic `BOOK_PATH` locator routine to dynamically track down library payloads within the root asset folder tree.
- **Elo Performance Mapping**: Overhauled the `CPL_ELO_MAP` lookup matrices to surface precision Elo metrics matching designated centipawn loss damage caps, drastically minimizing engine search delays.

---

## [2026-09-13]
### Added
- **Ecosystem Structural Branch**: Created the main `Lichess-MakeChessBetter` ecosystem subfolder containing an internal `.ai/` operational hub along with baseline `AI.md` and `README.md` documentation templates.
- **Environment Trackers**: Added a root-level `.gn` ecosystem configuration script within the `assets` directory tree.
- **Media Ingestion**: Uploaded raw graphic screenshots (`Screenshot 2026-09-13 112757.png` and `Screenshot 2026-09-13 103540.png`) to the project repository.

### Changed
- **Asset Directory Refactoring**: Consolidated graphic asset paths by shifting raw camera images and renaming them down into clear, structured file targets:
  - `Screenshot 2026-09-13 103540.png` became `bot_stats.png` (migrated across `assets/images/` paths to a standardized root at `assets/bot-profile.png`).
  - `Screenshot 2026-09-13 112757.png` became `live-gameplay-analysis.png`.
  - `Screenshot 2026-09-13 112757.bmp` became `live-gameplay-analysis.bmp`.
- **Changelog Automation Pipelines**: Upgraded the `update_changelog.py` script and `changelog.yml` workflow parameters to generate clean, human-scannable logs directly from git diff streams while protecting historical dates from accidental layout shifts.
- **Environment Tracking Attributes**: Adjusted `.editorconfig` rules and updated `.gitattributes` parameters twice to enforce absolute project layout limits and streamline runtime file processing.

### Fixed
- **Path Resolution Errors**: Fixed broken file reference redirections caused by shifting files across the `assets/`, `images/`, and sub-folder tracks.

### Removed
- **Legacy Components**: Purged deprecated security variable templates by deleting `.env.example`.
- **Deprecated Graphics**: Eliminated the legacy asset file path `assets/live-gameplay-analysis.bmp`.
- **Hidden Dotfiles**: Deleted the redundant, hidden tracking files `.gn` and `.assets/.gn` from the asset subfolder structures.

---
### Generated Changelog
```markdown
## [2023-05-15] - AI Generated

- Updated the `.github/workflows/changelog.yml` workflow to fetch and analyze code changes more efficiently.
- Added a step to install Python and set up the environment for running Qwen.
- Modified the `pull Qwen Coder Model` step to fetch the latest commit and use it to generate a concise changelog.
- Improved the `Git Diff` section to include the actual code diff without unnecessary steps.
- Modified the `Call Ollama API running inside the GitHub worker` step to use Python's native utilities for making HTTP requests.
- Changed the `Prepare Prompt` section to format the prompt correctly for Qwen.
- Added a step to commit and push the updated changelog.
```


## [2026-09-13] - AI Generated
null

