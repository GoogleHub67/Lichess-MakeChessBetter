#!/bin/bash
chmod +x "$0"
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
cd "$PROJECT_ROOT"

echo "=============================================="
echo "  Setting up Lichess Chess Bot Environment    "
echo "=============================================="
echo "📍 Project Root: $PROJECT_ROOT"
echo "=============================================="

if [ ! -d "venv" ]; then
    echo "📦 Creating Python Virtual Environment (venv)..."
    python3 -m venv venv
else
    echo "✅ Virtual environment already exists."
fi

echo "🐍 Installing dependencies from requirements.txt..."
source venv/bin/activate
pip install --upgrade pip
if [ -f requirements.txt ]; then pip install -r requirements.txt; fi

echo "🐟 Installing Stockfish Engine via Homebrew..."
if command -v brew &> /dev/null; then
    brew install stockfish
else
    echo "⚠️ Homebrew is not installed. Please install it from https://brew.sh later."
fi

# 🌟 NON-DEV FIX: Ensure the config directory structure exists cleanly
mkdir -p config/env

# Create the visible configuration template file if missing
if [ ! -f "config/env/windows.env.example" ]; then
    cat << EOF > config/env/windows.env.example
LICHESS_TOKEN=lip_YOUR_TOKEN_HERE
BOOK_PATH=path/to/opening/book.bin
EOF
fi

echo ""
echo "============================================================"
echo "🎉 SETUP SCRIPT COMPLETE: READY FOR CREDENTIALS"
echo "============================================================"
echo "👉 NEXT STEPS FOR NON-DEVELOPERS:"
echo "1. Open the folder: config/env/"
echo "2. Open 'windows.env.example' in TextEdit or Notepad."
echo "3. Replace 'lip_YOUR_TOKEN_HERE' with your actual Lichess token."
echo "4. Save the file."
echo "5. Now run your launch-unix.sh script!"
echo "============================================================"
echo ""
read -p "Press [ENTER] to close this setup installer safely..."
