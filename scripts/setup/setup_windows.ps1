# Prevent script execution policy blocks if run directly
$ErrorActionPreference = "Stop"

Write-Host "==============================================" -ForegroundColor Cyan
Write-Host "  Setting up Lichess Chess Bot Environment    " -ForegroundColor Cyan
Write-Host "==============================================" -ForegroundColor Cyan

# 1. Create a Python Virtual Environment
if (-not (Test-Path ".\venv")) {
    Write-Host "📦 Creating Python Virtual Environment (venv)..." -ForegroundColor Green
    python -m venv venv
} else {
    Write-Host "✅ Virtual environment already exists." -ForegroundColor Yellow
}

# 2. Upgrade pip and install from requirements.txt
Write-Host "🐍 Installing dependencies from requirements.txt..." -ForegroundColor Green
.\venv\Scripts\pip install --upgrade pip
.\venv\Scripts\pip install -r requirements.txt

# 3. Install Stockfish Engine via winget
Write-Host "🐟 Installing Stockfish Engine via winget..." -ForegroundColor Green
try {
    winget install --id=Stockfish.Stockfish -e --accept-package-agreements --accept-source-agreements
} catch {
    Write-Host "⚠️ winget install failed. Please ensure winget is updated or install Stockfish manually." -ForegroundColor Red
}

# 4. Create a template .env file if it doesn't exist
if (-not (Test-Path ".\.env")) {
    Write-Host "📄 Creating template .env file..." -ForegroundColor Green
    "LICHESS_TOKEN=your_token_here`nBOOK_PATH=path/to/opening/book.bin" | Out-File -FilePath ".\.env" -Encoding utf8
}

Write-Host "`n==============================================" -ForegroundColor Green
Write-Host "🎉 Setup complete!" -ForegroundColor Green
Write-Host "==============================================" -ForegroundColor Green
Write-Host "Next Steps:" -ForegroundColor Cyan
Write-Host "1. Open '.env' and replace 'your_token_here' with your real Lichess API token."
Write-Host "2. Download your opening book .bin file and update BOOK_PATH in config.py or .env."
Write-Host "3. Start your bot using the venv Python executor by running:"
Write-Host "   .\venv\Scripts\python bot.py" -ForegroundColor Yellow
