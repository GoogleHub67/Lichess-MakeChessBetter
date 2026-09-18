# Prevent script execution policy blocks if run directly
\$ErrorActionPreference = "Stop"

# 📍 Dynamic Path Correction: Force script to run relative to the project root folder
# Since this script lives in ./scripts/setup/, walking up two parents gets us to the repository root.
ScriptDirectory = Split-Path -Parent MyInvocation.MyCommand.Path
RepositoryRoot = Get-Item (Join-Path ScriptDirectory "..\..")
Set-Location \$RepositoryRoot.FullName

Write-Host "==============================================" -ForegroundColor Cyan
Write-Host "  Setting up Lichess Chess Bot Environment    " -ForegroundColor Cyan
Write-Host "==============================================" -ForegroundColor Cyan
Write-Host "📍 Project Root: (RepositoryRoot.FullName)" -ForegroundColor Yellow
Write-Host "==============================================" -ForegroundColor Cyan

# 1. Create a Python Virtual Environment inside the project root
if (-not (Test-Path ".\venv")) {
    Write-Host "📦 Creating isolated Python Virtual Environment (venv)..." -ForegroundColor Green
    python -m venv venv
} else {
    Write-Host "✅ Virtual environment already exists." -ForegroundColor Yellow
}

# 2. Upgrade pip and install from requirements.txt inside the venv sandbox
Write-Host "🐍 Installing dependencies from requirements.txt..." -ForegroundColor Green
.\venv\Scripts\pip install --upgrade pip
.\venv\Scripts\pip install -r requirements.txt

# 3. Install Stockfish Engine globally via winget
Write-Host "🐟 Installing Stockfish Engine via winget..." -ForegroundColor Green
try {
    winget install --id=Stockfish.Stockfish -e --accept-package-agreements --accept-source-agreements
    Write-Host "💡 NOTE: Stockfish was installed globally via winget. If your Python code throws a FileNotFoundError," -ForegroundColor Yellow
    Write-Host "   make sure your engine initialization path points to 'stockfish' natively!" -ForegroundColor Yellow
} catch {
    Write-Host "⚠️ winget install failed. Please ensure winget is updated or install Stockfish manually." -ForegroundColor Red
}

# 4. Create a template .env configuration file if it doesn't exist
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
Write-Host "3. Start your bot execution loop by running:"
Write-Host "   .\venv\Scripts\python bot.py" -ForegroundColor Yellow
Write-Host "4. Or, launch your Streamlit analytics dashboard using:" -ForegroundColor Cyan
Write-Host "   .\venv\Scripts\streamlit run dashboard.py" -ForegroundColor Yellow
