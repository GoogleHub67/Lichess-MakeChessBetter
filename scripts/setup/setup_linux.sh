#!/bin/bash

# Ensure this script has execution permissions for future runs
chmod +x "$0"

# Exit immediately if a command exits with a non-zero status
set -e

# 📍 Dynamic Path Correction: Force script to run relative to the project root folder
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
cd "$PROJECT_ROOT"

echo "=============================================="
echo "  Setting up Lichess Chess Bot Environment    "
echo "=============================================="
echo "📍 Project Root: $PROJECT_ROOT"
echo "=============================================="

# 1. Verify and Install Python Core VENV Package (Linux Specific Guardrail)
if [ ! -d "venv" ]; then
    echo "📦 Checking for Python 3 Virtual Environment package..."
    if ! dpkg -s python3-venv &> /dev/null && command -v apt-get &> /dev/null; then
        echo "🔧 Installing missing 'python3-venv' core component (requires sudo)..."
        sudo apt-get update
        sudo apt-get install -y python3-venv
    fi

    echo "📦 Creating Python Virtual Environment (venv)..."
    python3 -m venv venv
else
    echo "✅ Virtual environment already exists."
fi

# 2. Upgrade pip and install dependencies inside the venv sandbox
echo "🐍 Installing dependencies from requirements.txt..."
source venv/bin/activate
pip install --upgrade pip
if [ -f requirements.txt ]; then pip install -r requirements.txt; fi

# 3. Install Stockfish Engine globally via APT
echo "🐟 Installing Stockfish Engine via APT..."
if command -v apt-get &> /dev/null; then
    if ! command -v stockfish &> /dev/null; then
        echo "🔧 Fetching engine (requires sudo)..."
        sudo apt-get update
        sudo apt-get install -y stockfish
    else
        echo "✅ Stockfish engine is already installed on this machine."
    fi
    echo "💡 NOTE: Stockfish was installed globally via APT."
else
    echo "⚠️ 'apt-get' package manager not found (non-Debian/Ubuntu system)."
    echo "Please install Stockfish manually using your system's package manager."
fi

# 4. 🌟 NON-DEV FIX: Ensure the config directory structure exists cleanly
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
echo "2. Open the file '.env' with a Text Editor."
echo "3. Replace 'lip_YOUR_TOKEN_HERE' with your actual Lichess token."
echo "4. Save the file."
echo "5. Now run your launch_unix.sh script!"
echo "============================================================"
echo ""

# 🌟 CRITICAL FIX: Freeze the terminal screen so the non-dev can read the steps!
read -p "Press [ENTER] to close this setup installer safely..."
