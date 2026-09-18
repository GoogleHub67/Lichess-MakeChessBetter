@echo off
title Lichess Adaptive Chess Partner

:: 📍 Path Correction: Break out of the scripts/launch directory into the project root
cd /d "%~dp0..\.."

echo Starting up your adaptive chess partner environment...
echo 📍 Project Root: %CD%

:: Run the script using the explicit Python executable inside the virtual environment
"venv\Scripts\python.exe" src/bot.py

pause
