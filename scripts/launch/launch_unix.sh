#!/bin/bash
chmod +x "$0"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

CONFIG_DIR="config/env"
ENV_FILE="$CONFIG_DIR/.env"
EXAMPLE_FILE="$CONFIG_DIR/windows.env.example"

# Auto-generate .env from the template file if it is missing
if [ ! -f "$ENV_FILE" ] && [ -f "$EXAMPLE_FILE" ]; then
    cp "$EXAMPLE_FILE" "$ENV_FILE"
fi

# Check if the token inside the file is still the default placeholder text
if [ -f "$ENV_FILE" ] && grep -q "lip_YOUR_TOKEN_HERE" "$ENV_FILE"; then
    echo "============================================================"
    echo " ⚠️ CONFIGURATION ERROR: MISSING LICHESS API TOKEN"
    echo "============================================================"
    echo "Your chess bot cannot connect to Lichess without credentials."
    echo ""
    echo "👉 FIX STEPS FOR NON-DEVELOPERS:"
    echo "1. Go into the folder: config/env/"
    echo "2. Open the file '.env' with TextEdit or Notepad."
    echo "3. Delete 'lip_YOUR_TOKEN_HERE' and paste your real token."
    echo "4. Save the file and run this launcher script again!"
    echo "============================================================"
    echo ""
    read -p "Press [ENTER] to close this window..."
    exit 0
fi

# If everything looks valid, launch the core chess engine application loop
if [ -d "venv" ]; then
    source venv/bin/activate
    python3 src/bot.py || python3 app.py
else
    echo "❌ Error: Virtual environment (venv) not found. Run setup first!"
    read -p "Press [ENTER] to exit..."
fi
