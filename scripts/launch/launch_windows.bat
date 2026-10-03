@echo off
title Lichess MakeChessBetter Launcher

:: 📍 Dynamic Path Correction: Force execution environment to look at project root
cd /d "%~dp0..\.."

SET CONFIG_DIR=config\env
SET ENV_FILE=%CONFIG_DIR%\.env
SET EXAMPLE_FILE=%CONFIG_DIR%\.env.example

:: Auto-generate the working .env file if missing
if not exist "%ENV_FILE%" (
    if exist "%EXAMPLE_FILE%" (
        copy "%EXAMPLE_FILE%" "%ENV_FILE%" >nul
    )
)

:: Validate if the user has replaced the default template token string
if exist "%ENV_FILE%" (
    findstr /C:"lip_YOUR_TOKEN_HERE" "%ENV_FILE%" >nul 2>&1
    if %ERRORLEVEL% EQU 0 goto :TOKEN_MISSING
) else (
    goto :TOKEN_MISSING
)

:: Run the core bot loop inside the isolated local virtual environment sandbox
if exist "venv\Scripts\activate.bat" (
    call venv\Scripts\activate.bat
    python src/bot.py
    if %ERRORLEVEL% NEQ 0 (
        python app.py
    )
) else (
    echo [ERROR] Virtual environment folder 'venv' missing! 
    echo Please run your scripts\setup\setup_windows.ps1 installer first.
    echo.
    pause
)
exit /b

:TOKEN_MISSING
echo ============================================================
echo  ^<x^> CONFIGURATION ERROR: MISSING LICHESS API TOKEN
echo ============================================================
echo Your chess bot cannot connect to Lichess without credentials.
echo.
echo.     👉 FIX STEPS FOR NON-DEVELOPERS:
echo.     1. Go into the folder: config\env\
echo.     2. Right-click the file '.env' and open it with Notepad.
echo.     3. Delete 'lip_YOUR_TOKEN_HERE' and paste your real token.
echo.     4. Save the file and double-click this launcher again!
echo ============================================================
echo.
pause
exit /b
