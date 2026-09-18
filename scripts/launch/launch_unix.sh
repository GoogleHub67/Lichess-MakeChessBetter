#!/bin/bash
set -e

# 📍 Dynamic Path Correction: Walk out to the main project directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
cd "$PROJECT_ROOT"

echo "Firing up Lichess Adaptive Bot Core..."
echo "📍 Project Root: $PROJECT_ROOT"

# Activate the virtual environment so python3 uses the installed dependencies
source venv/bin/activate

# Grant execution rights to the bot file if needed
chmod +x src/bot.py

# Run the bot file
python3 src/bot.py
