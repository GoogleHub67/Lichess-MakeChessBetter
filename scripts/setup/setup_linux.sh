#!/bin/bash

# Ensure this script has execution permissions for future runs
chmod +x "$0"

# Exit immediately if a command exits with a non-zero status
set -e

echo "=============================================="
echo "  Setting up Lichess Chess Bot Environment    "
echo "=============================================="

# 1. Create a Python Virtual Environment
if [ ! -d "venv" ]; then
    echo "📦 Creating Python Virtual Environment (venv)..."
    python3 -m venv venv
else
    echo "✅ Virtual environment already exists."
fi

# 2. Upgrade pip and install from requirements.txt
echo "🐍 Installing dependencies from requirements.txt..."
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt

# 3. Install Stockfish Engine via APT
echo "🐟 Installing Stockfish Engine via APT..."
if command -v apt-get &> /dev/null; then
    sudo apt-get update
    sudo apt-get install -y stockfish
else
    echo "⚠️ 'apt-get' package manager not found (non-Debian/Ubuntu system)."
    echo "Please install Stockfish manually using your system's package manager."
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
echo "3. Start your bot by running:"
echo "   source venv/bin/activate && python bot.py"
