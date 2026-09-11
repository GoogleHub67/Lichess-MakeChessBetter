# ⚙️ Configuration & Environment Settings

This directory manages the runtime configuration, local environment variables, and platform-specific assets for the Lichess Chess Bot.

## 📁 Directory Structure

```text
config/
├── env/
│   ├── windows.env.example    # Configuration template for Windows users
│   ├── macos.env.example      # Configuration template for macOS (Homebrew)
│   └── linux.env.example      # Configuration template for Linux / Docker runtimes
├── config.py                  # Core Python configuration class (environment-driven)
├── settings.yml               # Static bot behaviors and parameter tracking
└── README.md                  # This documentation file
```

---

## 🛠️ Local Environment Setup

The configuration class (`config.py`) relies entirely on system environment variables to load sensitive credentials and paths. For local development, these are read from a `.env` file placed at the **root of the project**.

Follow these steps to configure your local setup:

### 1. Copy Your OS Template
Navigate to your project root directory in your terminal and copy the matching environment template into a new `.env` file at the root:

* **Windows (Command Prompt / PowerShell):**
  ```cmd
  copy config\env\windows.env.example .env
  ```
* **macOS:**
  ```bash
  cp config/env/macos.env.example .env
  ```
* **Linux:**
  ```bash
  cp config/env/linux.env.example .env
  ```

### 2. Configure Your Variables
Open the newly created `.env` file in the **project root** and fill out the fields:

* `LICHESS_TOKEN`: Paste your personal access token generated via your Lichess account (requires `bot:play`, `challenge:read`, and `challenge:write` scopes).
* `STOCKFISH_PATH`: The template fills this with the standard operating system installation path. If you manually downloaded Stockfish to a custom location (like your Documents or Downloads folder), update this path to target your executable binary directly.

---

## ☁️ Cloud Production Deployment (Render)

**Do not upload your local `.env` file to production.** It is explicitly blocked in the root `.gitignore` file to safeguard your secret tokens.

When deploying to **Render**, manually inject these keys into your Web Service or Background Worker dashboard under the **Environment Variables** section:

| Key | Example Value | Description |
| :--- | :--- | :--- |
| `LICHESS_TOKEN` | `lip_xxxxxxxxxxxxxxxxxxxx` | Your live Lichess Bot account API token. |
| `STOCKFISH_PATH` | `/usr/games/stockfish` | The binary path configured inside your runtime Dockerfile. |
