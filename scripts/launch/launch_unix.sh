\#!/bin/bash
set -e

echo "Firing up Lichess Adaptive Bot Core..."

# Activate the virtual environment so python3 uses the installed dependencies
source venv/bin/activate

# Grant execution rights to the bot file if needed
chmod +x src/bot.py

# Run the bot file
python3 src/bot.py
