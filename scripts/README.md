# 📜 Setup & Launch Scripts

This directory contains the automation, installation, and deployment scripts for **Lichess-MakeChessBetter**. These utilities streamline system configuration and project execution across **Windows, macOS, and Linux** environments.

## 📁 Directory Structure

```text
scripts/
├── launch/                   # Starts application on various systems
│   ├── launch_windows.bat    # Windows Batch script to launch the application
│   └── launch_unix.sh        # Linux and macOS bash script to launch the application
└── setup/                    # Installs cross-platform system dependencies
    ├── setup_linux.sh        # Installs system dependencies and sets up Linux environments
    ├── setup_mac.sh          # Installs system dependencies using Homebrew for macOS
    └── setup_windows.ps1     # PowerShell script for Windows environment configuration
```

## ⚠️ Prerequisite: 
Ensure Python 3 is installed and added to your system's PATH variable before executing the setup scripts.

## ⚙️ Project Setup

Before running the project for the first time, execute the appropriate setup script for your operating system.

### 🐧 Linux
Give execution permissions and run the shell script:
```bash
chmod +x scripts/setup/setup_linux.sh
./scripts/setup/setup_linux.sh
```

### 🍏 macOS
Give execution permissions and run the shell script (requires Homebrew):
```bash
chmod +x scripts/setup/setup_mac.sh
./scripts/setup/setup_mac.sh
```

### 🪟 Windows
Open PowerShell as an Administrator and execute:
```powershell
Set-ExecutionPolicy Bypass -Scope Process
.\scripts\setup\setup_windows.ps1
```

---

## 🚀 Launching the Application

Once the setup is complete, use the launch scripts to start the project.

### 💻 Unix-based Systems (Linux & macOS)
```bash
chmod +x scripts/launch/launch_unix.sh
./scripts/launch/launch_unix.sh
```

### 🪟 Windows Systems
Simply double-click `launch_windows.bat` or execute it from the Command Prompt/PowerShell:
```cmd
.\scripts\launch\launch_windows.bat
```

## 🛠️ Contribution Guidelines

If you are modifying these setup or launch scripts:
1. **Cross-Platform Parity:** Ensure any structural dependency added to one OS setup script (e.g., Python packages or binary dependencies like Stockfish) is mirrored in the other two.
2. **Pathing:** Always use relative paths from the project root directory so scripts can be executed safely without breaking local directory trees.
