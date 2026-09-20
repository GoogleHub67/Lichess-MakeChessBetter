# Changelog

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


## [2026-09-14] - AI Generated
**Added:**
- **Hardware Components:** Added the Raspberry Pi 5, Arduino Nano V3.0/Uno R3, WS2812B LED Strip, 5V 5A Power Adapter, Solderless Breadboard, Jumper Wires Set, Circuit Protection Kit, 20 AWG Hook-Up Wire, Adafruit NeoPixel Library.

**Changed:**
- **Core Operating System Setup:** Changed the default operating system from Raspberry Pi OS Lite to Raspberry Pi OS (64-bit, Bookworm) for a dedicated chess server device.

**Fixed:**
- **Prototyping Basics:** Modified the wiring diagram for breadboards and jumper wires to ensure proper mechanical routing and electrical connections.


## [2026-09-14] - AI Generated
- **✅ Added Dependency Install Command:** Add `pip install python-chess` to the instructions.
- **✅ Added Execution Script Commands:** Add `python bot.py` and `python primary_runner_script` to the instructions.


## [2026-09-14] - AI Generated
- **Added**: `bot_config.py` file, which contains the core Python configuration class for environment-driven settings.
- **Added**: `config.yml.default`, a default configuration file that includes bot behaviors and parameter tracking.


## [2026-09-14] - AI Generated
- **Changed**: Added a new directory `.windows.env.example` for Windows users.
- **Changed**: Added a new directory `.macos.env.example` for macOS (Homebrew).
- **Changed**: Added a new directory `.linux.env.example` for Linux / Docker runtimes.
- **Changed**: Updated the configuration class `bot_config.py` to read credentials from `.env` files at the root of the project.


## [2026-09-14] - AI Generated
- Fixed the issue where the `STOCKFISH_PATH` environment variable was not being correctly set. It now uses the absolute path to the root directory, ensuring consistency across different environments. 

- Improved the `LICHESS_TOKEN` loading mechanism by explicitly loading the environmental variables from the root `.env` file. This prevents any potential issues with missing or incorrectly set tokens.

- Enhanced the platform-agnostic `BOOK_PATH` resolution. It now correctly locates the book file within the `assets` folder at the root level of the repository.

- Updated the `CPL_ELO_MAP` to provide a more detailed mapping of average centipawn loss and approximate Elo ratings based on a predefined set of thresholds.

- Implemented the `ensure_opening_book_exists` method to automatically download the heavy binary book file from the permanent V2.1.0 release sandbox storage if it doesn't exist locally, using a direct URL to avoid dependency issues.


## [2026-09-14] - AI Generated
- Added version `2.1.0` to the `CITATION.cff` file.
- Changed the release date to `2022-03-22`.
- Updated the URL to point to the GitHub repository.


## [2026-09-14] - AI Generated
- **Added**: Test and run the bot in a Raspberry Pi (details are given [here](./docs/Raspberry-Pi.md)).
- **Fixed**: Optimize real-time centipawn loss calculations to reduce engine latency.


## [2026-09-14] - AI Generated
- **Fixed**: Updated `requires-python` to `>=3.10` in `pyproject.toml` to match your Pipfile's requirement.
- **Added**: Moved `uv` dependencies from `Pipfile` to `tool.uv` in `pyproject.toml`.
- **Updated**: Added `pytest` and `pytest-mock` for unit testing, `ruff` for code quality checks, and moved test configurations from `pytest.ini` to `tool.pytest.ini_options`.


## [2026-09-13] - AI Generated
- **Added:**
  - Added a new directory named `Lichess-MakeChessBetter`.
  - Created an `.ai/` directory within the `Lichess-MakeChessBetter` directory.
  - Added an `AI.md` and `README.md` file within the `.ai/` directory.


## [2026-09-13] - AI Generated
- Removed `assets/live-gameplay-analysis.bmp` file.


## [2026-09-13] - AI Generated
- **Bot Profile Image Update**: Renamed `assets/images/bot_stats.png` to `assets/bot-profile.png` to better match the new image naming convention.


## [2026-09-13] - AI Generated
- Added: A new screenshot file was added to the `assets` directory.


## [2026-09-13] - AI Generated
- Removed `.gn` file from `assets/` directory.


## [2026-09-13] - AI Generated
- Fixed a rename issue with `bot_stats.png` to `images/bot_stats.png`.


## [2026-09-13] - AI Generated
- Fixed: Rename `Screenshot 2026-09-13 103540.png` to `bot_stats.png`


## [2026-09-13] - AI Generated
- Added `.gn` file in `assets/` directory


## [2026-09-13] - AI Generated
- **Refined Prompt**: The prompt is now clear, concise, and specific to the task of generating a human-friendly changelog entry from the given git diff.
- **Improved Changelog Update**: The script now updates the `CHANGELOG.md` file to reflect the new entry without modifying existing historical dates, maintaining the neat structure of the file.



## [2026-09-13] - AI Generated
### Changelog Entry

**Date:** 2023-05-15

#### Added
- Updated the `.github/workflows/changelog.yml` workflow to fetch and analyze code changes more efficiently.
- Added a step to install Python and set up the environment for running Qwen.
- Modified the `pull Qwen Coder Model` step to fetch the latest commit and use it to generate a concise changelog.

#### Changed
- Improved the `Git Diff` section to include the actual code diff without unnecessary steps.
- Modified the `Call Ollama API running inside the GitHub worker` step to use Python's native utilities for making HTTP requests.
- Changed the `Prepare Prompt` section to format the prompt correctly for Qwen.
- Added a step to commit and push the updated changelog.

#### Fixed
- Fixed a typo in the `Git Diff` section.

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

