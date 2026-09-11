@echo off
title Lichess Adaptive Chess Partner
echo Starting up your adaptive chess partner environment...

:: Run the script using the explicit Python executable inside the virtual environment
"venv\Scripts\python.exe" src/bot.py

pause
