## 🔧 Step-by-Step Engine Binary Setup

To make the bot run locally, you must provide it with an engine binary.

### 🪟 Windows Setup:
1. Go to the official [Stockfish Downloads](https://stockfishchess.org).
2. Download the **Windows x86-64-avx2** zip file.
3. Extract the `.exe` file directly into your project's root folder.
4. Rename it to `stockfish.exe` or update your `config.yml` path key to match the exact filename:
   ```yaml
   engine:
     path: "./stockfish.exe"
   ```

### 🐧 Linux / macOS Setup:
1. Install Stockfish via your package manager:
   ```bash
   sudo apt install stockfish  # Ubuntu/Debian
   brew install stockfish      # macOS
   ```
2. Find the absolute path where it was installed:
   ```bash
   which stockfish
   ```
3. Paste that path (usually `/usr/games/stockfish` or `/opt/homebrew/bin/stockfish`) directly into your `config.yml`.
