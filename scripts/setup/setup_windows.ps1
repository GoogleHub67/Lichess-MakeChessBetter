\$ErrorActionPreference = "Stop"

ScriptDirectory = Split-Path -Parent MyInvocation.MyCommand.Path
RepositoryRoot = Get-Item (Join-Path ScriptDirectory "..\..")
Set-Location \$RepositoryRoot.FullName

Write-Host "==============================================" -ForegroundColor Cyan
Write-Host "  Setting up Lichess Chess Bot Environment    " -ForegroundColor Cyan
Write-Host "==============================================" -ForegroundColor Cyan
Write-Host "📍 Project Root: (RepositoryRoot.FullName)" -ForegroundColor Yellow
Write-Host "==============================================" -ForegroundColor Cyan

if (-not (Test-Path ".\venv")) {
    Write-Host "📦 Creating isolated Python Virtual Environment (venv)..." -ForegroundColor Green
    python -m venv venv
} else {
    Write-Host "✅ Virtual environment already exists." -ForegroundColor Yellow
}

Write-Host "🐍 Installing dependencies from requirements.txt..." -ForegroundColor Green
.\venv\Scripts\pip install --upgrade pip
if (Test-Path "requirements.txt") { .\venv\Scripts\pip install -r requirements.txt }

Write-Host "🐟 Installing Stockfish Engine via winget..." -ForegroundColor Green
try {
    winget install --id=Stockfish.Stockfish -e --accept-package-agreements --accept-source-agreements
} catch {
    Write-Host "⚠️ winget install skipped or failed. Install Stockfish manually if needed." -ForegroundColor Red
}

# 🌟 NON-DEV FIX: Create explicit folder architectures
if (-not (Test-Path ".\config\env")) {
    New-Item -ItemType Directory -Path ".\config\env" -Force | Out-Null
}

if (-not (Test-Path ".\config\env\windows.env.example")) {
    "LICHESS_TOKEN=lip_YOUR_TOKEN_HERE`nBOOK_PATH=path/to/opening/book.bin" | Out-File -FilePath ".\config\env\windows.env.example" -Encoding utf8
}

Write-Host "`n============================================================" -ForegroundColor Green
Write-Host "🎉 SETUP SCRIPT COMPLETE: READY FOR CREDENTIALS" -ForegroundColor Green
Write-Host "============================================================" -ForegroundColor Green
Write-Host "👉 NEXT STEPS FOR NON-DEVELOPERS:" -ForegroundColor Cyan
Write-Host "1. Open the folder: config/env/" -ForegroundColor Cyan
Write-Host "2. Right-click 'windows.env.example' and open with Notepad." -ForegroundColor Cyan
Write-Host "3. Replace 'lip_YOUR_TOKEN_HERE' with your real Lichess token." -ForegroundColor Cyan
Write-Host "4. Save and close the file." -ForegroundColor Cyan
Write-Host "5. Double-click your launch_windows.bat file to play!" -ForegroundColor Cyan
Write-Host "============================================================" -ForegroundColor Green
Write-Host ""

Read-Host "Press [ENTER] to close this setup assistant safely..."
