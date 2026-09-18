#!/bin/bash

# Ensure this script has execution permissions for future runs
chmod +x "$0"

# Exit immediately if a command exits with a non-zero status
set -e

# 📍 Dynamic Path Correction: Force script to run relative to the project root folder
# Since this script lives in ./scripts/setup/, walking up two directories gets us to the repository root.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
cd "$PROJECT_ROOT"

echo "=============================================="
echo "  Setting up Lichess Chess Bot Environment    "
echo "=============================================="
echo "📍 Project Root: $PROJECT_ROOT"
echo "=============================================="

# 1. Create a Python Virtual Environment inside the project root
if [ ! -d "venv" ]; then
    echo "📦 Creating Python Virtual Environment (venv)..."
    python3 -m venv venv
else
    echo "✅ Virtual environment already exists."
fi

# 2. Upgrade pip and install from requirements.txt inside the venv sandbox
echo "🐍 Installing dependencies from requirements.txt..."
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt

# 3. Install Stockfish Engine globally via Homebrew
echo "🐟 Installing Stockfish Engine via Homebrew..."
if command -v brew &> /dev/null; then
    brew install stockfish
    echo "💡 NOTE: Stockfish was installed globally via Homebrew."
    echo "   Ensure your engine configuration path points to 'stockfish' natively!"
else
    echo "⚠️ Homebrew is not installed. Skipping Stockfish installation."
    echo "Please install Homebrew (https://brew.sh) or install Stockfish manually."
fi

# 4. Create a template .env file if it doesn't exist
if [ ! -f ".env" ]; then
    echo "📄 Creating template .env file..."
    cat << EOF > .env
LICHESS_TOKEN=your_token_here
BOOK_PATH=path/to/opening/book.bin
EOF
fi

echo ""
echo "=============================================="
echo "🎉 Setup complete!"
echo "=============================================="
echo "Next Steps:"
echo "1. Open '.env' and replace 'your_token_here' with your real Lichess API token."
echo "2. Download your opening book .bin file and update BOOK_PATH in config.py or .env."
echo "3. Start your bot execution loop by running:"
echo "   source venv/bin/activate && python bot.py"
echo "4. Or, launch your Streamlit analytics dashboard using:"
echo "   source venv/bin/activate && streamlit run dashboard.py"
