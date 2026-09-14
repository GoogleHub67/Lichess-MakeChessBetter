# Changelog

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

